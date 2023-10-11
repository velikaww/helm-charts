
# PARAM_TARGET_ARCH: 指定目标cpu架构

set -e

odir=$(pwd)
dir="$(cd "$(dirname "$0")";pwd)"
file="${dir}/$(basename "$0")"
while file_symbol="$(readlink "$file")"; do
    file="$(cd "$(dirname "$file")";cd "$(dirname "$file_symbol")";pwd)/$(basename "$file_symbol")"
    dir="$(dirname "$file")"
done

_d=$1
shift
cd $dir/$_d
_cross_build=""
if [ -n "$PARAM_TARGET_ARCH" ] && [ "$PARAM_TARGET_ARCH" != "$(arch || : 2>/dev/null)" ]; then
  _cross_build=" --platform=linux/${PARAM_TARGET_ARCH}"
fi
_tags=""
while [ -n "$1" ] && [ "$1" != "--" ]; do
  _tags+=" -t $1"
  shift
done
shift || :
docker${_cross_build:+ buildx} build${_cross_build}${_tags} "$@" .
cd $odir
