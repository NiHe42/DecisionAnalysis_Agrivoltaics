library(decisionSupport)

input_estimates <- read.csv("data/av_estimates_overview.csv", header = TRUE)

as.estimate(input_estimates)




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
  
  av_event_drought <-
                chance_event(av_drought, 1,0, n = n_years)
  
  
  # crop benefits VV
  
  if (av_event_drought){
    av_crop_yield_t_ha
  }
  
  
  av_crop_yield <-  vv(av_crop_ha, c(0, 0), n_years) *
                    vv(av_crop_yield_t_ha, vv_var, n_years) *
                    vv(av_crop_profit_EUR_t, vv_var, n_years) *
                    yield_loss
  
  av_energy_yield <-  vv(av_ha, vv_var, n_years) *
                      vv(av_energy_yield_kwp_ha, vv_var, n_years) *
                      vv(av_energy_profit_EUR_kwp, vv_var, n_years)
  
  # processing through both alternatives
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
    
    
  # cost calculation
    #calculation planning costs
    if (decision_av_int_planning)
    {
      av_int_planning <- av_int_cost_search_panels + av_int_cost_search_location
    }
    else
    {
      av_int_planning <- 0
    }
    
    #calculation setup costs   
    if (decision_av_int_setup)
    {
      av_int_setup <- (av_int_cost_photovoltaic_panels * av_ha * av_energy_yield_kwp_ha) +
                      av_int_cost_installation + # maybe in av_int_cost_photovoltaic_panels
                      av_int_cost_training
    }
    else
    {
      av_int_setup <- 0
    }
    
    #calculation execution/maintenance costs   
    if (decision_av_int_execution)
    {
      av_int_execution <- av_int_execution_period + 
                          vv(av_int_cost_reparation, vv_var, n_years) -
                          vv(av_int_benefit_shade, vv_var, n_years)
    }
    else
    {
      av_int_execution <- av_int_execution_period
    }
 
    
    av_int_cost <- av_int_execution
    av_int_cost[1] <- av_int_cost[1] + av_int_setup + av_int_planning
    
    if(decision_av_int)
    {
      total_benefits <- av_crop_yield + av_energy_yield
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

