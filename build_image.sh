#!/bin/bash

UK_APP=httpreply
UNIKRAFT_DIR=../../unikraft

OUT_ISO=kernel.iso
CMD_LINE=app-${UK_APP}.cmdl
BINARY=build/${UK_APP}_qemu-x86_64

if [ -f $CMD_LINE ]; then
  echo "$UK_APP" > $CMD_LINE
fi

rm -rf $OUT_ISO
make -j8 && sudo $UNIKRAFT_DIR/support/scripts/mkukimg -f iso -k $BINARY -b ukefi -a X64 -c $CMD_LINE -o $OUT_ISO
