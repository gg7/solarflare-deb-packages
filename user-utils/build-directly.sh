#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

cd -- "$(dirname "$0")"

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <zip file in same directory>" >&2
	exit 1
fi

zip_file=$1

rm -r build/
mkdir build/
cd build/
unzip "../$zip_file"

rpm_file=$(ls)
alien -c "$rpm_file"
rm "$rpm_file"
