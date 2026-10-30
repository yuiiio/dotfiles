#!/usr/bin/env bash

# use by source ...
export SSH_ASKPASS=/usr/bin/ksshaskpass
eval "$(ssh-agent -s)"

ssh-add -c -t 12h ~/.ssh/id_ed25519
ssh-add -c -t 12h ~/.ssh/git_signing_ed25519
