#!/bin/bash

for x in `cat mesas`; do
    if [[ -f "${x}1.jpg" ]]; then
        echo "==========================${x}1.jpg=========================="
        exiftool "${x}1.jpg"
        echo "===================================================="
        continue
    fi
done
