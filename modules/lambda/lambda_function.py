import json
import boto3
import os

sns_client = boto3.client('sns')
sns_topic_arn = os.environ['SNS_TOPIC_ARN']  # Obtener el ARN del SNS desde las variables de entorno

def lambda_handler(event, context):
    for record in event['Records']:
        # Obtener el mensaje de la cola SQS
        message = record['body']
        
        # Enviar el mensaje al tópico SNS
        response = sns_client.publish(
            TopicArn=sns_topic_arn,
            Message=message
        )
        
        # Log de respuesta
        print(f"Mensaje enviado a SNS: {response}")
    
    return {
        'statusCode': 200,
        'body': json.dumps('Messages processed successfully')
    }
