resource "aws_cloudwatch_log_group" "this" {
  name = "this-cloudwatch-log-group"

  tags = {
    Name        = "this-cloudwatch-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "this" {
  name           = "this-cloudwatch-log-stream"
  log_group_name = aws_cloudwatch_log_group.this.name
}