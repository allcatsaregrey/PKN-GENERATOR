# Make sure work directory is appropriately configured 
source("pkn_generator.R")

runPipeline <- function(net_sources, sources, targets) {
  
  # Input the data and generate the necessary PKN
  user_data <- read_user_data()
  user_net <- init_net(net_sources) %>% process_net()
  user_pkn <- gen_pkn(user_net, sources, targets)
  
  # Run CARNIVAL and display the resultant network
  result <- carn_pkn(user_net, user_data[1], user_data[2])
  vis_carn(result) 
  
}