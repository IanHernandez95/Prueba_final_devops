resource "aws_lambda_function" "lambda_prueba_final" {
  function_name = "lambda_prueba_final"

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"

  role = var.rol_sqs_arn

  tracing_config {
    mode = "PassThrough"
  }

  environment {
    variables = {
      SNS_TOPIC_ARN = var.SNS_TOPIC_ARN
    }
  }
}

resource "aws_lambda_permission" "sqs_permiso" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_prueba_final.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = var.sqs_arn
}

resource "aws_lambda_event_source_mapping" "sqs_to_lambda" {
  event_source_arn = var.sqs_arn
  function_name    = aws_lambda_function.lambda_prueba_final.function_name
  batch_size       = 10
  enabled          = true
}