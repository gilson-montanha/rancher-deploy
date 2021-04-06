#!/bin/bash

set -e

get_context=$(rancher context current)
echo $get_context