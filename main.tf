provider "google" {}
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
  number  = true
  keepers = {
  always_run = "${timestamp()}"
  }

}

resource "random_integer" "priority" {
  min     = 1
  max     = 20
  keepers = {
  always_run = "${timestamp()}"
  }
}

locals  {
name= "${random_string.random.result}-${random_integer.priority.result}"
}

output "string" {
  value = random_string.random.result
}

output "number" {
  value = random_integer.priority.result
}
output "your-name-is" {
  value = local.name
  depends_on = [random_integer.priority.result]
}
