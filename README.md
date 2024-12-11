# ARI5902 Research Topics In Artificial Intelligence

During this workshop I will show you how to build machine learning models for Computational Drug Discovery.  More background on the subject may be found [here](https://bitsilla.com/blog/2017/06/computer-aided-drug-design-cadd-reading-lists/)

The first thing you will need to do is clone this repository, i.e. ```git clone git@github.com:jp-um/ARI5902_Research_Topics_In_Artificial_Intelligence.git```

Note that this session assumes you have access to a Linux installation (ideally Ubuntu 24.04.1 LTS).  You can use [Oracle VirtualBox](https://www.virtualbox.org/) to create an Ubuntu Virtual Machine on your Windows/macOS (or you can dual boot, or even better, remove your OS and install Ubuntu directly on the bare metal).

## Pre-requisite (Docker)

For my session you will need ```docker``` installed (on Ubuntu).  Docker is a clever bit of software which allows me to package all the libraries (and setup) you need all in one place.  Docker can easily be installed (on Ubuntu, but also on other platforms) by following the [official Docker guides](https://docs.docker.com/engine/install/ubuntu/).

### Getting the Container Image

You will need a ton of software (configuration, etc.), which I have conveniently installed and set-up for you and placed in a docker container (you're spoilt these days!).  This should be as easy as issuing:

```
docker pull jpebe/ari5902
```

## Running the Container

You should copy **all** the Jupyter notebooks and data files [here](https://github.com/jp-um/ARI5902_Research_Topics_In_Artificial_Intelligence/tree/main/jupyter) in a local directory and then issue:

```
docker run -ti --rm -v /your/local/dir/ARI5902_Research_Topics_In_Artificial_Intelligence/jupyter:/notebooks -p 8888:8888 jpebe/ari5902
```

You should then be able to copy the Jupyter notebook URL from the terminal into your browser (ctrl-click will open a browser automatically).  We are now good to go!

## Building the Image from Scratch

The more docker-experienced people, can probably build the docker image from the docker file in this repository (```docker build -t ari5902 .```).

## When you are done

You may want to reclaim some space on your Ubuntu installation.  Remove all images and containers in the following way.

```bash
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
```


Pull requests (with fixes) will be recieved with thanks.

![](https://github.com/drmenguin/learnd/blob/master/jp.gif)
