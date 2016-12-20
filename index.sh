#!/bin/sh

readonly NAME="$1"
readonly FILE="${2:-/dev/stdin}"

cat <<EOF
(function(module, exports = module.exports = {}) {
$(< "$FILE")
})({ set exports(value) { window["$NAME"] = value }, get exports() { return window["$NAME"] } });
EOF