# First setup

## 1. Start Floci

```bash
docker compose up -d floci
```

## 2. Run AWS CLI command

```bash
docker run --rm -it amazon/aws-cli --version
# or set a temporary alias during the session by evaluating the file `env.sh`
source env.sh
```

## 3. Verify the setup

```bash
# S3 - Create a bucket and upload a file
aws s3 mb s3://demo-bucket
echo "hello floci" | aws s3 cp - s3://demo-bucket/hello.txt
aws s3 ls s3://demo-bucket

# SQS — create a queue and send a message
aws sqs create-queue --queue-name orders
QUEUE=$(aws sqs get-queue-url --queue-name orders --output text)
aws sqs send-message \
  --queue-url $QUEUE \
  --message-body '{"event":"order.placed"}'

# DynamoDB — create a table
aws dynamodb create-table \
  --table-name Users \
  --attribute-definitions AttributeName=id,AttributeType=S \
  --key-schema AttributeName=id,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```

