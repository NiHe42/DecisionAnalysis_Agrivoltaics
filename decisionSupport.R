install.packages("decisionSupport")
library(decisionSupport)

input_estimates <- read.csv("data/av_estimates.csv", header = TRUE, sep =";")
input_estimates

model_function <- function(){

  total_costs = (-water_costs - energy_costs - labour_cost)
  
  
  
  
  
  
  final_result <- total_income - total_costs 
  
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

