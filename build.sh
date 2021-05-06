#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IMAGE_VERSION="1.0"
IMAGE_NAME="turtletramp/7z-docker"
IMAGE_TAG="${IMAGE_NAME}:${IMAGE_VERSION}"

usage()
{
	echo "usage: $0 [--tag]                  Create image ${IMAGE_NAME}"
	echo "       $0 [-h | --help ]           Display usage information"
	echo
	echo " Options:"
	echo "	-p | --push		Tag and push image to the internal registry"
}

while [ "$#" -ne 0 ]; do
	case "$1" in
	"-h" | "--help")
		usage && exit 1;;
	"-p" | "--push")
		CMD_PUSH="1";;
	*)
		break;;
	esac
	shift 1
done

docker build -t ${IMAGE_TAG} .
if [ "$CMD_PUSH" == "1" ]; then
	docker push ${IMAGE_TAG}
fi


