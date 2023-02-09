resource "aws_sns_topic" "pessoa" {
  name = "pessoa_topic"
}

resource "aws_sqs_queue" "pessoa_fisica" {
  name = "pessoa_fisica_queue"
}

resource "aws_sqs_queue" "pessoa_juridica" {
  name = "pessoa_juridica_queue"
}

resource "aws_sns_topic_subscription" "assinatura_topico_pessoa_fisica" {
  topic_arn = aws_sns_topic.pessoa.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.pessoa_fisica.arn
  filter_policy = jsonencode({
    header_key = [
      "pessoa_fisica"
    ]
  })
}

resource "aws_sqs_queue_policy" "pessoa_fisica" {
  queue_url = aws_sqs_queue.pessoa_fisica.url

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "SQS:SendMessage",
        Resource = aws_sqs_queue.pessoa_fisica.arn,
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.pessoa.arn
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "assinatura_topico_pessoa_juridica" {
  topic_arn = aws_sns_topic.pessoa.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.pessoa_juridica.arn
  filter_policy = jsonencode({
    header_key = [
      "pessoa_juridica"
    ]
  })
}

resource "aws_sqs_queue_policy" "pessoa_juridica" {
  queue_url = aws_sqs_queue.pessoa_juridica.url

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "SQS:SendMessage",
        Resource = aws_sqs_queue.pessoa_juridica.arn,
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.pessoa.arn
          }
        }
      }
    ]
  })
}