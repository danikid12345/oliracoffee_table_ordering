FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get update &&     sudo apt-get install -y python3 python3-pip libgtk-3-dev mesa-utils
