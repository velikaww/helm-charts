#!/usr/bin/env bash

set -e

dir="$(cd "$(dirname "$0")";pwd)"
file="${dir}/$(basename "$0")"
while file_symbol="$(readlink "$file")"; do
    file="$(cd "$(dirname "$file")";cd "$(dirname "$file_symbol")";pwd)/$(basename "$file_symbol")"
    dir="$(dirname "$file")"
done

helm package $dir/$1 -d $dir/../repository/
helm repo index $dir/../repository --url https://velikaww.github.io/helm-charts
