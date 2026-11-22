#!/bin/bash

export AWS_ENDPOINT_URL=http://floci:4566
alias aws='docker compose run -q --rm aws-cli'
