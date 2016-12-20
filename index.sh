#!/bin/sh

readonly NAME="$1"
readonly FILE="${2:-/dev/stdin}"

cat <<EOF
var module = {};
Object.defineProperty(module, 'exports', {
	set: function(value) {
		window["$NAME"] = value;
	},

	get: function() {
		return window["$NAME"];
	}
});

var exports = module.exports = {};

$(< "$FILE")
EOF