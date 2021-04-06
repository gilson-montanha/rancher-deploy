#!/bin/sh

set -e

# The login stage
rancher login ${INPUT_URI} --token ${INPUT_TOKEN}

# Set a context
rancher context switch ${INPUT_CONTEXT}

# Getting a context
get_context=$(rancher context current)
echo $get_context

# Updating helm repository (helm repo update)
rancher catalog refresh ${INPUT_CATALOG_NAME}

# Outputs
echo "::set-output name=context::$get_context"

