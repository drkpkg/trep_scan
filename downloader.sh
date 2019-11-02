#!/bin/bash

for x in `cat mesas`; do
    if [[ -f "${x}1.jpg" ]]; then
        echo "$x already exists"
        continue
    fi
    echo "Downloading https://trep.oep.org.bo/resul/imgActa/${x}1.jpg"
    wget -q https://trep.oep.org.bo/resul/imgActa/${x}1.jpg
    sleep 5
done
