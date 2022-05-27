install.packages("decisionSupport")
library(decisionSupport)

input_estimates <- read.csv("data/av_estimates.csv", header = TRUE, sep =";")
input_estimates

model_function <- function(){
  
  # Estimate the income in a normal season
  #yield <- Yield * Market_pric
  
  
  # Estimate the final results from the model
  
  final_result <- yield - m_cost 
  
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

