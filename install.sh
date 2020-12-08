#!/usr/bin/env bash

#
# Installs the scripts as soft links
#

BINDIR=${HOME}/bin

function link_file {
    source="${PWD}/$1"
    target="${BINDIR}/${1/_/}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        echo "Renaming $target to $target.bak"
        mv $target $target.bak
    fi

    if [ ! -e "${target}" ]; then
        echo "Linking $source to $target"
        ln -sf ${source} ${target}
    fi
}

if [ ! -d ${BINDIR} ]
then
    mkdir ${BINDIR}
fi

for i in _*
do
    link_file $i
done

