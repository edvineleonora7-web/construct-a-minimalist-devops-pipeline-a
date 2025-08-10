# Define a data model for the DevOps pipeline analyzer

# Define a list to store pipeline stages
stages <- list()

# Define a function to add a stage to the pipeline
add_stage <- function(stage_name, tools, duration) {
  stage <- list(name = stage_name, tools = tools, duration = duration)
  stages <<- c(stages, list(stage))
}

# Define a function to add a tool to a stage
add_tool <- function(stage_name, tool_name) {
  for (stage in stages) {
    if (stage$name == stage_name) {
      stage$tools <- c(stage$tools, tool_name)
      return()
    }
  }
}

# Define a function to calculate the total pipeline duration
calculate_duration <- function() {
  total_duration <- 0
  for (stage in stages) {
    total_duration <- total_duration + stage$duration
  }
  return(total_duration)
}

# Define a function to print the pipeline stages and tools
print_pipeline <- function() {
  for (stage in stages) {
    cat(stage$name, ": ")
    for (tool in stage$tools) {
      cat(tool, " ")
    }
    cat("\n")
  }
}

# Example usage
add_stage("Build", "Maven", 10)
add_tool("Build", "Gradle")
add_stage("Test", "JUnit", 20)
add_tool("Test", "TestNG")
add_stage("Deploy", "Ansible", 30)

print_pipeline()
cat("Total pipeline duration: ", calculate_duration(), "\n")