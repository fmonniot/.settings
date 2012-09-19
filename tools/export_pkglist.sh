#!/bin/sh
EXPORT_DIR=~

pacman -Qqe | grep -vx "$(pacman -Qqm)" > $EXPORT_DIR/pkglist_$(eval date +%Y-%m-%d).pkg.list
