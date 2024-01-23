resource "aws_autoscaling_group" "circleci" {
  capacity_rebalance = true
  desired_capacity = 3
  max_size = 5
  min_size = 1
  vpc_zone_identifier = [data.aws_subnet.dev_subnet.id]

  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity = 0
      on_demand_percentage_above_base_capacity = 0
      on_demand_allocation_strategy = "lowest-price"
      spot_allocation_strategy = "capacity-optimized"
    }
    
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.circleci_launch_template.id
        version = aws_launch_template.circleci_launch_template.latest_version
      }
    }
  }
}
