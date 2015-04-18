#!/bin/bash

curl -o /home/jtreminio/.git-prompt.sh \
    https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

echo "source ~/.git-prompt.sh" >> /home/jtreminio/.bash_profile
