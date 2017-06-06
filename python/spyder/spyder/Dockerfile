FROM ubuntu
MAINTAINER Ruben ten Hove <git@rhtenhove.nl>

RUN apt-get update && apt-get install -y libxext-dev libxrender-dev libxtst-dev \
libgl1-mesa-glx libgl1-mesa-dri libgtk2.0-0 libglib2.0-0 libnss3 libx11-6 libasound2 libxtst6 \
libxkbcommon-x11-0 \
libxslt-dev libxml2-dev libxss1 \
python3 python3-pip

RUN pip3 install spyder PyQt5

# Use --new-instance because the persisted ~/.config/spyder3-py3/spyder.lock file isn't removed when closing the container
CMD ["spyder3", "--new-instance"]