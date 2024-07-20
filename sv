#!/bin/bash

# separated value store (e.g., .csv) and cli (bash)

script_dir="${0%/*}"

( cd "${script_dir}/files"; bash --init-file "${script_dir}/sv.profile" )

