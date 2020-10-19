# README

# SETUP
$ `bin/setup`

# TESTS
$ `rspec`

# ROUTES
## Get projects
`localhost:3000/project`

## Create project
`localhost:300/project` method post
  `{ "name":"name of the project" }`

## Show project
`localhost:300/project/:id` method get

## Update project
`localhost:300/project/:id` method put
  `{ "name":"name of the project" }`
  
## Delete 
`localhost:3000/project/:id` method delete

## Create task
`localhost:3000/project/:project_id/task` method post
`{ "name": "some cool task", "description": "some cool task" }`

## Update task
`localhost:3000/project/:project_id/task/:id` method put
`{ "name": "some cool task", "description": "some cool task" }`

## Delete task
`localhost:3000/project/:project_id/task/:id` method delete

## Show task
`localhost:3000/project/:project_id/task/:id` method get
