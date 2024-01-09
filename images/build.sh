#!/usr/bin/env bash

set -e

dir="$(cd "$(dirname "$0")";pwd)"
file="${dir}/$(basename "$0")"
while file_symbol="$(readlink "$file")"; do
    file="$(cd "$(dirname "$file")";cd "$(dirname "$file_symbol")";pwd)/$(basename "$file_symbol")"
    dir="$(dirname "$file")"
done

_name="$1"
shift
_tags=()
while [ -n "$1" ] && [ "$1" != "--" ]; do
    _tags[${#_tags[@]}]="$1"
    shift
done &&\
_args="" &&\
for _t in "${_tags[@]}"; do
    _args+=" -t ${_t}"
done &&\
_cross_build="" &&\
if [ -n "$TARGET_ARCH" ] && [ "$TARGET_ARCH" != "$(arch || : 2>/dev/null)" ]; then
  _cross_build=" --platform=linux/${TARGET_ARCH}"
fi &&\
docker${_cross_build:+ buildx} build${_cross_build}${_args} "${dir}/${_name}" "$@" &&\
if [ -z "$SKIP_PUSH" ]; then
    for _t in "${_tags[@]}"; do
        docker push $_t
    done
fi

# regiswang image registry: swr.cn-east-3.myhuaweicloud.com/regiswang
