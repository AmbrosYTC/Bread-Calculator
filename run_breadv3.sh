#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
/usr/bin/env python3 "$DIR/breadv3"

