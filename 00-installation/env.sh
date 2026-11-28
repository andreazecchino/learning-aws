export AWS_ENDPOINT_URL=http://floci:4566
export AWS_DEFAULT_REGION=eu-south-1
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DOCKER_CLI_VERSION="2.42.1"

alias aws="docker run --rm -i \
  -e AWS_ENDPOINT_URL=$AWS_ENDPOINT_URL \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  --network floci-network \
  -v $(pwd):/aws amazon/aws-cli:$AWS_DOCKER_CLI_VERSION"
