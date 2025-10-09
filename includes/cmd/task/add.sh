# Create a new task
task add $TASK_DESC

# Specify a project
task add project:$PROJECT $TASK_DESC

# Specify due date
task add due:tomorrow $TASK_DESC

# Recurring task
task add recur:weekly $TASK_DESC
