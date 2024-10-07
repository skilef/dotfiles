#!/bin/bash

for d in ./*/ ; do (cd "$d" && stow .); done

