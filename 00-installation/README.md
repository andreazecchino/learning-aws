# First setup

## 1. Start Floci

```bash
docker compose up -d floci
```

## 2. Run AWS CLI command

```bash
docker compose run -q --rm aws-cli <command> # `entrypoint` is already set to `aws`
# or set a temporary alias during the session
alias aws='docker compose run -q --rm aws-cli'
```

## 3. Verify the setup

```bash
# S3 - Create a bucket and upload a file
aws s3 mb s3://my-bucket --endpoint-url $AWS_ENDPOINT_URL
echo "hello floci" | aws s3 cp - s3://my-bucket/hello.txt --endpoint-url $AWS_ENDPOINT_URL
aws s3 ls s3://my-bucket --endpoint-url $AWS_ENDPOINT_URL

# SQS — create a queue and send a message
aws sqs create-queue --queue-name orders --endpoint-url $AWS_ENDPOINT_URL
aws sqs send-message \
  --queue-url $AWS_ENDPOINT_URL/000000000000/orders \
  --message-body '{"event":"order.placed"}' \
  --endpoint-url $AWS_ENDPOINT_URL

# DynamoDB — create a table
aws dynamodb create-table \
  --table-name Users \
  --attribute-definitions AttributeName=id,AttributeType=S \
  --key-schema AttributeName=id,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --endpoint-url $AWS_ENDPOINT_URL
```

## Tips

- `--endpoint-url $AWS_ENDPOINT_URL` won't work as expeted because `$AWS_ENDPOINT_URL` refer to host environment variable and not the `awc-cli` service one. Set `export AWS_ENDPOINT_URL=http://floci:4566` before run the `aws` commands.
