library(decisionSupport)

input_estimates <- read.csv("data/av_estimates_overview.csv", header = TRUE)

as.estimate(input_estimates)

input_estimates[input_estimates$variable == 'av_int_risk_maintenance',]$lower = 0.01
input_estimates[input_estimates$variable == 'av_int_risk_maintenance',]$upper = 0.2
input_estimates[input_estimates$variable == 'av_int_risk_installation',]$lower = 0.1
input_estimates[input_estimates$variable == 'av_int_risk_installation',]$upper = 0.2
input_estimates[input_estimates$variable == 'av_int_risk_panellowquality',]$lower = 0.1
input_estimates[input_estimates$variable == 'av_int_risk_panellowquality',]$upper = 0.2


model_function <- function(){
  
  av_int_execution_period <- rep(0,n_years)
  
  # ex-ante risks
  av_int_event_no_involvement_by_population <-
    chance_event(av_int_no_involvement_by_population, 1, 0, n = 1)
  av_int_event_no_involvement_by_institution <-
    chance_event(av_int_no_involvement_by_institution, 1, 0, n = 1)
  
  # ex-post risks
  av_int_event_defect_photovoltaic_panels <-
    chance_event(av_int_event_photovoltaic_panels, 1, 0, n = 1)
  
  
  
  # processing through standard farm and farm with av intervention
  for (decision_av_int in c(FALSE, TRUE))
  {
    if (decision_av_int)
    {
      decision_av_int_planning <- TRUE
      decision_av_int_setup <- TRUE
      decision_av_int_execution <- TRUE
    }
    else
    {
      
      decision_av_int_planning <- FALSE
      decision_av_int_setup <- FALSE
      decision_av_int_execution <- FALSE
    }
    
    if (av_int_event_no_involvement_by_population)
    {
      decision_av_int_setup <- FALSE
      decision_av_int_execution <- FALSE
    }
    
    if (av_int_event_no_involvement_by_institution)
    {
      decision_av_int_setup <- FALSE
      decision_av_int_execution <- FALSE
    }
    
    
    
    
    ### cost calculation
    
    ## calculation planning costs
    if (decision_av_int_planning)
    {
      av_int_planning <- av_int_cost_search_panels + av_int_cost_search_location
    }
    else
    {
      av_int_planning <- 0
    }
    
    ## calculation of setup costs  
    if (decision_av_int_setup)
    {
      # panel costs by €/kwp * ha * kwp/ha
      var_panel_cost = (av_int_cost_photovoltaic_panels * av_ha)
      # chance event if installation risk occurs and variation of costs with vv function
      var_installation_risk_cost = chance_event(chance = av_int_risk_installation, value_if = vv(av_int_risk_installation_cost, vv_var, n = 1) * av_int_cost_installation, value_if_not = 0, n = 1)
      
      av_int_setup <- var_panel_cost +
        av_int_cost_installation +
        var_installation_risk_cost +
        av_int_cost_training
    }
    else
    {
      av_int_setup <- 0
    }
    
    ## calculation execution/maintenance costs   
    if (decision_av_int_execution)
    {
      av_int_execution <- av_int_execution_period + 
        vv(av_int_cost_reparation, vv_var, n_years) *
        chance_event(chance = av_int_risk_maintenance, value_if = vv(av_int_risk_maintenance_costs, vv_var, 1), value_if_not = 1, n = n_years)
    }
    else
    {
      av_int_execution <- av_int_execution_period
    }
    
    
    
    ## calculation of labour costs and labour reduction through av intervention
    if (decision_av_int){
      var_labour_reduction <- vv(av_int_labour_reduction, vv_var, n_years)
    }
    
    else {
      var_labour_reduction <- vv(c(1, 1), c(0, 0), n_years)
    }
    
    var_labour_costs <- var_labour_reduction * 
      vv(av_crop_ha, c(0, 0), n_years) *
      vv(annual_labour, vv_var, n_years) *
      vv(labour_costs, vv_var, n_years)
    
    
    
    ## calculating overall costs
    av_int_cost <- av_int_execution  + var_labour_costs
    av_int_cost[1] <- av_int_cost[1] + av_int_setup + av_int_planning
    
    
    
    ## benefit calculations
    
    
    ## calculating energy yield with low quality panel risk
    var_lowpanelquality_risk_reduction = chance_event(chance = av_int_risk_panellowquality, value_if = vv(av_int_risk_panellowquality_reduction, vv_var, n = 1), value_if_not = 1, n = 1)
    av_energy_yield <-  vv(av_ha, c(0, 0), n_years) *
      vv(av_energy_yield_kwp_ha, vv_var, n_years) *
      var_lowpanelquality_risk_reduction
    
    av_energy_pump <-   vv(av_int_annual_irrigation, vv_var, n_years) *
      vv(av_int_pump_energy, vv_var, n_years) *
      vv(av_crop_ha, c(0, 0), n_years)
    
    # calculating variables if energy demand for irrigation is higher than energy yield
    if (av_energy_pump > av_energy_yield){
      av_energy_pump <- av_energy_yield
    }
    
    # calculating profit from energy yield and pump demand
    var_av_energy_profit <- (av_energy_yield - av_energy_pump) * av_energy_profit_EUR_kwp
    
    
    
    ## calculating crop yield
    
    # calculating factors for yield through extra av irrigation, drought risk
    if (decision_av_int){
      var_irrigation_factor = vv(av_int_irrigation_factor, vv_var, n_years)
      var_risk_effectdrought <- vv(c(1, 1), c(0, 0), n_years)
      var_shadedcrop_yield <- vv(av_shadedcrop_yield, vv_var, n_years)
    }
    
    else {
      var_irrigation_factor = vv(c(1, 1), c(0, 0), n_years)
      var_risk_effectdrought <- chance_event(chance = av_risk_drought, value_if = vv(av_effects_drought, vv_var, 1), value_if_not = 1, n = n_years)
      var_shadedcrop_yield <- vv(c(0, 0), c(0, 0), n_years)
      }
    
    av_crop_yield <-  vv(av_crop_ha, c(0, 0), n_years) *
      vv(av_crop_yield_t_ha, vv_var, n_years) *
      vv(av_crop_profit_EUR_t, vv_var, n_years) *
      var_irrigation_factor *
      var_risk_effectdrought +
      var_shadedcrop_yield *
      vv(av_shadedcrop_profit, vv_var, n_years) *
      vv(av_ha, c(0, 0), n_years)
    
    
    ##
    
    
    ## calculation of resulting benefits
    if(decision_av_int)
    {
      # chance event if low quality panel risk occurs and variation of reduction with vv function
      total_benefits <- av_crop_yield + var_av_energy_profit
    }
    
    else
    {
      total_benefits <- av_crop_yield
    }
    
    if (!decision_av_int)
    {
      net_benefits <- total_benefits - av_int_cost
      result <- net_benefits
    }
    
    if (decision_av_int)
    {
      net_benefits <- total_benefits - av_int_cost
      result_int <- net_benefits
    }   
  }
  
  NPV <- discount(result, discount, calculate_NPV = TRUE)
  NPV_int <- discount(result_int, discount, calculate_NPV = TRUE)
  
  # Generate the list of outputs from the Monte Carlo simulation
  return(list(NPV = NPV,
              NPV_int = NPV_int))
}


# Run the Monte Carlo simulation using the model function
example_mc_simulation <- mcSimulation(estimate = as.estimate(input_estimates),
                                      model_function = model_function,
                                      numberOfModelRuns = 6000,
                                      functionSyntax = "plainNames")


plot_distributions(mcSimulation_object = example_mc_simulation,
                   vars = c("NPV", "NPV_int"),
                   method = "smooth_simple_overlay",
                   base_size = 7)