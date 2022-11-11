#!/usr/bin/env bash
set -e

submodules_cfg=$(git config -f .git/config --get-regexp 'submodule\..+\.url' | cut -d'.' -f2)
submodules=$(git submodule | cut -b 2- | cut -d' ' -f 2)
for submodule_cfg in $submodules_cfg; do
    submodule_cfg_exists=0
    for submodule in $submodules; do
        if [ "$submodule" == "$submodule_cfg" ]; then
            echo "Found submodule $submodule as active"
            submodule_cfg_exists=1
        fi
    done

    if [ "$submodule_cfg_exists" == 0 ]; then
        echo "Removing stale submodule ${submodule_cfg}"
        mkdir -p archived-submodules
        mv "$submodule_cfg" archived-submodules/
        git config -f .git/config --remove-section "submodule.$submodule_cfg"
    fi
done
