FROM scratch
ADD openwrt-armvirt-64-generic-rootfs.tar /
EXPOSE 22 80 443
# using exec format so that /sbin/init is proc 1 (see procd docs)
ENTRYPOINT ["/sbin/init"]
