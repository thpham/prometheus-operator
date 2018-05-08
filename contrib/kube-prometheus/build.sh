#!/usr/bin/env bash
set -e
set -x
# only exit with zero if all commands of the pipeline exit successfully
set -o pipefail

# Make sure to start with a clean 'manifests' dir
rm -rf manifests
mkdir manifests

                                               # optional, but we would like to generate yaml, not json
jsonnet -J vendor -m manifests example.jsonnet | xargs -I{} sh -c 'cat $1 | gojsontoyaml > $1.yaml; rm -f $1' -- {}

