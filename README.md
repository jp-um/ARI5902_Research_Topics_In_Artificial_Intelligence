# ARI5902 Research Topics In Artificial Intelligence &ndash; Prof. Jean-Paul Ebejer

During this workshop I will show you how to build machine learning models for Computational Drug Discovery.  More background on the subject may be found [here](https://bitsilla.com/blog/2017/06/computer-aided-drug-design-cadd-reading-lists/)

The first thing you will need to do is clone this repository, i.e. ```git clone git@github.com:jp-um/ARI5902_Research_Topics_In_Artificial_Intelligence.git```

Note that this session assumes you have access to a Linux installation (ideally Ubuntu 24.04.3 LTS).  You can use [Oracle VirtualBox](https://www.virtualbox.org/) to create an Ubuntu Virtual Machine on your Windows/macOS (or you can dual boot, or even better, remove your OS and install Ubuntu directly on the bare metal).

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
docker run --init -ti --rm \
    --name cadd-workshop \
    -eJUPYTER_TOKEN=my-secret-jupyterlab-token \
    -v /YOUR/PATH/TO/ARI5902_Research_Topics_In_Artificial_Intelligence/jupyter:/home/jovyan/work \
    -p 8888:8888 \
    jpebe/ari5902
```

You should then be able to access the Jupyter lab instance running in the docker container via [http://127.0.0.1:8888/lab?token=my-secret-jupyterlab-token](http://127.0.0.1:8888/lab?token=my-secret-jupyterlab-token). We are now good to go!

## Building the Image from Scratch

The more docker-experienced people, can probably build the docker image from the docker file in this repository (```docker build -t ari5902 .```).

## When you are done

You may want to reclaim some space on your Ubuntu installation.  Remove all images and containers in the following way.

```bash
# This cleans up *all* unused docker objects on your system (not just for this project)
docker system prune -a
```

Pull requests (with fixes) will be received with thanks.

![](https://github.com/drmenguin/learnd/blob/master/jp.gif)
