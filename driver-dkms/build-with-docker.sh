#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

cd -- "$(dirname "$0")"

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <zip file in same directory>" >&2
	echo "Example: $0 'SF-104979-LS-33_Solarflare_NET_driver_source_DKMS.zip'" >&2
	exit 1
fi

zip_file=$1

docker run -it -v "$(pwd):/sf" sf-builder bash -c "cd /sf && ./build-directly.sh \"$zip_file\""
