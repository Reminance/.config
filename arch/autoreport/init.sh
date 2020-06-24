#!/usr/bin/bash

if [ ! -d "data/base" ];then
  echo initial base data dir
  mkdir -p data/base
fi
curl "$1/projects/list" | ../../dev-tools/jq -r . > data/base/project.json
if [ $? -ne 0 ]; then exit 0; fi
cat data/base/project.json | ../../dev-tools/jq -r '.data[]|[.id,.name]|join(",")' > data/base/project.list
curl "$1/dict/all" | ../../dev-tools/jq -r . > data/base/dict.json
if [ $? -ne 0 ]; then exit 0; fi
cat data/base/dict.json | ../../dev-tools/jq -r '.data[]|[.value,.label,.description]|join(",")' > data/base/dict.list

