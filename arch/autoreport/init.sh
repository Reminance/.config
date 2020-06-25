#!/usr/bin/bash

if [ ! -d "data/base" ];then
  echo -e "\033[36m==== initial base dir ====\033[0m"
  mkdir -p data/base
fi
curl "$1/projects/list" | jq -r . > data/base/project.json
if [ $? -ne 0 ]; then exit 0; fi
cat data/base/project.json | jq -r '.data[]|[.id,.name]|join(",")' > data/base/project.list
curl "$1/dict/all" | jq -r . > data/base/dict.json
if [ $? -ne 0 ]; then exit 0; fi
cat data/base/dict.json | jq -r '.data[]|[.value,.label,.description]|join(",")' > data/base/dict.list

