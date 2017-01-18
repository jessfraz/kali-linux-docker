#!/bin/bash
set -e
set -o pipefail

# Fetch the latest Kali debootstrap script from git
curl "http://git.kali.org/gitweb/?p=packages/debootstrap.git;a=blob_plain;f=scripts/kali;h=50d7ef5b4e9e905cc6da8655416cdf3ef559911e;hb=refs/heads/kali/master" > kali-debootstrap

debootstrap kali-rolling ./kali-root http://http.kali.org/kali ./kali-debootstrap
