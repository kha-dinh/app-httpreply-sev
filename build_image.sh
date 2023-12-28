#!/bin/bash

UK_APP=httpreply
UNIKRAFT_DIR=../../unikraft

OUT_ISO=kernel.iso
CMD_LINE=app-${UK_APP}.cmdl
BINARY=build/${UK_APP}_qemu-x86_64

if [ ! -f $CMD_LINE ]; then
  echo "$UK_APP netdev.ipv4_addr=172.44.0.2 netdev.ipv4_gw_addr=172.44.0.1 netdev.ipv4_subnet_mask=255.255.255.0 --" > $CMD_LINE
fi

rm -rf $OUT_ISO
make -j8 && sudo $UNIKRAFT_DIR/support/scripts/mkukimg -f iso -k $BINARY -b ukefi -a X64 -c $CMD_LINE -o $OUT_ISO
