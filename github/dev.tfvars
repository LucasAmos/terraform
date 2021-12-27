aws_profile  = "lucas"
aws_region   = "eu-west-1"
organisation = "LucasAmos"
repos = {
  "repo-one" = {
    "description" : "Test repo one",
    "config" : {
      "default-branch" : "master",
      "gitignore" : true,
      "projects" : { "Project 1" : "Description 1", "Project 2" : "Description 2"
      }
    }
  },
  "repo-two" = {
    "description" : "Test repo two",
    "config" : {
      "default-branch" : "master",
      "gitignore" : false,
      "projects" : {}
    }
  }
}
