resource "aws_launch_template" "circleci_launch_template" {
  name_prefix   = "circleci-launch-template"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "b2c"
  network_interfaces {
    device_index = 0
    associate_public_ip_address = true
    security_groups = [aws_security_group.circleci_sg.id]
    subnet_id = data.aws_subnet.dev_subnet.id
  }
  #user_data = filebase64("${path.module}/user_data.sh")
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    RUNNER_AUTH_TOKEN = var.runner_auth_token
  }))  
}
