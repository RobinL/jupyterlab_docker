#!/usr/bin/env bash
set -ex

# NB_USER=$USER
# NB_UID=$USER_UID
# USER_UID=1001
# GROUP=staff

# Copy jovyan's files in the home without overwriting (-n)
# cp -nR /home/jovyan/ /home/$USER/
# chown -R $USER /home/$USER

# Disable authentication, see: https://github.com/jupyter/docker-stacks/blob/master/datascience-notebook/README.md#notebook-options
start.sh jupyter lab --NotebookApp.token=''