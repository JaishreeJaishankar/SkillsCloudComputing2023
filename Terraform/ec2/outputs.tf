output "aws_security_group" {
  value = aws_security_group.ec2_sg.id
}

output "aws_launch_template" {
  value = aws_launch_template.this_lt
}

output "iam_role"{
  value = aws_iam_role.this.arn
}