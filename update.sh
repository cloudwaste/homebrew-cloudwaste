#!/bin/sh

set -e -x

if [ "$#" -lt 2 ]; then
  echo "Usage: ./update.sh cloudwaste VERSION"
  exit 1
fi

CLI_NAME="$1"
VERSION="$2"

if [ "${CLI_NAME}" = "cloudwaste" ]; then
  URL_BASE="https://github.com/cloudwaste/cloudwaste/releases/download"
  CLASSNAME="Cloudwaste"
  DESC="Find wasted resources in your cloud 💸"
else
  echo "Unsupported binary: ${CLI_NAME}"
  exit 1
fi

# OSX
OSX_CLI_NAME="${CLI_NAME}_${VERSION}_mac_amd64"
OSX_BINPATH="/tmp/${OSX_CLI_NAME}"
curl -L -o ${OSX_BINPATH} -s "${URL_BASE}/v${VERSION}/${OSX_CLI_NAME}.tar.gz"
OSX_SHA256=$(shasum -a 256 "${OSX_BINPATH}" | awk '{print $1}')

# Linux
LINUX_CLI_NAME="${CLI_NAME}_${VERSION}_linux_amd64"
LINUX_BINPATH="/tmp/${LINUX_CLI_NAME}"
curl -L -o ${LINUX_BINPATH} -s "${URL_BASE}/v${VERSION}/${LINUX_CLI_NAME}.tar.gz"
LINUX_SHA256=$(shasum -a 256 "${LINUX_BINPATH}" | awk '{print $1}')

TEMPLATE="# This is an auto-generated file. DO NOT EDIT
class ${CLASSNAME} < Formula
    desc \"${DESC}\"
    homepage \"https://github.com/cloudwaste/cloudwaste\"
    baseurl = \"${URL_BASE}\"
    version \"${VERSION}\"
    bottle :unneeded
    if OS.mac?
      kernel = \"mac\"
      sha256 \"${OSX_SHA256}\"
    elsif OS.linux?
      kernel = \"linux\"
      sha256 \"${LINUX_SHA256}\"
    end
    @@bin_name = \"${CLI_NAME}_${VERSION}_\" + kernel + \"_amd64.tar.gz\"
    url baseurl + \"/v${VERSION}/\" + @@bin_name
    def install
      bin.install \"${CLI_NAME}\"
    end
end"

echo "${TEMPLATE}" > "${CLI_NAME}.rb"
