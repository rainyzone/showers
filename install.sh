#/usr/env/bin bash

set -e

SHOWERS=${SHOWERS:-~/.showers}
REPO=${REPO:-rainyzone/showers}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}

get_showers() {
  git clone $REMOTE $SHOWERS
}

get_showers
