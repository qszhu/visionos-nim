#!/bin/bash
set -e

NIM_HOME=/opt/homebrew/Cellar/nim/2.0.0_1/nim
NIM=$NIM_HOME/bin/nim
NIMBASE=$NIM_HOME/lib/nimbase.h
NIM_CACHE=build/nimcache

$NIM cpp \
  --noMain \
  --app:lib \
  --cpu:arm64 \
  --nimcache:$NIM_CACHE \
  --compileOnly \
  --header \
  src/*.nim
cp $NIMBASE $NIM_CACHE
