#!/bin/bash
TAG=latest
if [ ! -z "$1" ];then
	TAG=$1
fi

TMPDIR=openwrt_rootfs
OUTDIR=opt/imgs
IMG_NAME=mojialin/openwrt_phicomm_n1
		
[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"
mkdir -p "$OUTDIR"
mkdir -p "$TMPDIR"  && \
gzip -dc openwrt-armvirt-64-generic-rootfs.tar.gz | ( cd "$TMPDIR" && tar xf - ) && \
cp -f rc.local "$TMPDIR/etc/" && \
cp -f sysctl.conf "$TMPDIR/etc/" && \
cp -f firewall.user "$TMPDIR/etc/" && \
(cd "$TMPDIR" && tar cf ../openwrt-armvirt-64-generic-rootfs.tar .) && \
docker buildx build --platform linux/amd64,linux/arm64 -t ${IMG_NAME}:${TAG} .