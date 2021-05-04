# Each instruction in this file generates a new layer that gets pushed to your local image cache
 # Lines preceeded by # are regarded as comments and ignored
# ARG DEBIAN_FRONTEND=noninteractive

# New TF2.4
FROM tensorflow/tensorflow:2.4.1-gpu-jupyter

# Identify the maintainer of an image
LABEL maintainer="d.nankani@iitg.ac.in"
LABEL version="0.1"
LABEL description="PyTorch + some other libraries"

# Update the image to the latest packages
RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y wget vim htop fish datamash graphviz libgraphviz-dev

RUN apt-get install -y libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
    libharfbuzz-dev libfribidi-dev libxcb1-dev

RUN pip install --upgrade pip

RUN pip3 --no-cache-dir install ipython pandas docopt joblib natsort scipy tqdm keras matplotlib librosa scikit-learn dill bleach namedtupled

RUN pip3 --no-cache-dir install networkx pathlib pygraphviz Pillow

RUN pip3 --no-cache-dir install torch==1.4.0+cu100 torchvision==0.5.0+cu100 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip3 --no-cache-dir install torchvision torchsummary tb-nightly

# Install locales
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
