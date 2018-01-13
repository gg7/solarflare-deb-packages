#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd -- "$(dirname "$0")"

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <zip file in same directory>" >&2
	echo "Example: $0 'SF-107601-LS-52_Solarflare_Linux_Utilities_RPM_64bit.zip'" >&2
	exit 1
fi

zip_file=$1

docker run -it -v "$(pwd):/sf" sf-builder bash -c "cd /sf && ./build-directly.sh \"$zip_file\""
