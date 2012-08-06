#!/bin/bash

FILES=`find $1 | grep "~$"`
if [ ! -z "${FILES+xxx}" ]; then
  rm $FILES
fi
