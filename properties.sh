#!/usr/bin/env bash
set -e

# for envVar in $(compgen -e | grep SHOWCASE_); do
#     prop_name="${envVar/SHOWCASE_/}"
#     echo $prop_name equal ${!envVar}
#     sed -i -e "s/$prop_name/${!envVar}/g" userdata/generalapp.properties
# done
> userdata/generalapp.properties

for envVar in $(env | grep showcase_); do
    prop="${envVar/showcase_/}"
    prop="${prop//_/\.}"
    echo "$prop" >> userdata/generalapp.properties
done

exec "$@"