install.packages("decisionSupport")
library(decisionSupport)


input_estimates <- read.csv("data/av_estimates_new0602.csv", header = TRUE, sep =",")
input_estimates


model_functionv1 <- function(){

  
  yield = ha * yield_per_ha
  
  saleable_products <-  yield - (yield * loss_after_harvest)
  
  total_income <- saleable_products * market_price * demand
  
  labour_cost <- (workload * ha) * price_work
  
  energy_costs <-  (energy_irrigation * ha) * energy_management * price_energy_kwh
  
  water_costs <-  (water_consumption * ha) * price_water_L
  
  total_costs <-  (-water_costs - energy_costs - labour_cost) * pest_control
  

  final_result <- total_income - total_costs 
  
  # Generate the list of outputs from the Monte Carlo simulation
  return(list(final_result = final_result))
}

model_function <- function(){
  
  # ex-ante risks
  av_int_event_no_involvement_by_population <- chance_event(av_int_no_involvement_by_population, 1, 0, n = 1)
  av_int_event_defect_photovoltaic_panels <- chance_event(av_int_event_photovoltaic_panels, 1, 0, n = 1)
  
  # crop benefits VV
  av_crop_yield <-  vv(av_crop_ha, vv_var, n_years) *
                    vv(av_crop_yield_t_ha, vv_var, n_years) *
                    vv(av_crop_profit_EUR_t, vv_var, n_years)
  
  av_energy_yield <-  vv(av_energy_ha, vv_var, n_years) * # possibility for positive tendency
                      vv(av_energy_yield_kwh_ha, vv_var, n_years) *
                      vv(av_energy_profit_EUR_kwh, vv_var, n_years)
  
  # processing through both alternatives
  for (decision_av_int in c(FALSE, TRUE))
  {
    if (decision_av_int)
    {
      decision_av_int_planning <- TRUE
      decision_av_int_cost <- TRUE
      decision_av_int_execution <- TRUE
    }
    else
    {

      decision_av_int_planning <- FALSE
      decision_av_int_cost <- FALSE
      decision_av_int_execution <- FALSE
    }
    
    if (av_int_event_no_involvement_by_population)
    {
      decision_av_int_cost <- FALSE
      decision_av_int_execution <- FALSE
    }
      
  # cost calculation
    if (decision_av_int_cost)
    {
      
      
    }
      
    
    
    
    
    
    
    
    
    
    
    
  }
  
  
  
  
  # Generate the list of outputs from the Monte Carlo simulation
  return(list(final_result = final_result))
}

# Run the Monte Carlo simulation using the model function
example_mc_simulation <- mcSimulation(estimate = as.estimate(input_estimates),
                                      model_function = model_function,
                                      numberOfModelRuns = 2000,
                                      functionSyntax = "plainNames")

example_mc_simulation

plot_distributions(mcSimulation_object = example_mc_simulation,
                   vars = "final_result",
                   method = "boxplot_density",
                   old_names = "final_result",
                   new_names = "Outcome distribution for profits")

