#!/bin/bash
set -e
set -o pipefail

# Fetch the latest Kali debootstrap script from git
curl "https://gitlab.com/kalilinux/packages/debootstrap/raw/kali/master/scripts/kali" > kali-debootstrap

debootstrap --variant=minbase --include=kali-archive-keyring kali-rolling ./kali-root https://http.kali.org/kali ./kali-debootstrap
