#!/bin/bash
#
echo "Does the user template run?"
uptime
sudo apt-get install -y curl tar gzip coreutils
curl -s https://packagecloud.io/install/repositories/circleci/runner/script.deb.sh?any=true | sudo bash
sudo apt-get install -y circleci-runner
export RUNNER_AUTH_TOKEN="${RUNNER_AUTH_TOKEN}"
sudo sed -i "s/<< AUTH_TOKEN >>/$RUNNER_AUTH_TOKEN/g" /etc/circleci-runner/circleci-runner-config.yaml
sudo systemctl enable circleci-runner && sudo systemctl start circleci-runner
sudo systemctl status circleci-runner
echo "User data script ran at $(date)"
