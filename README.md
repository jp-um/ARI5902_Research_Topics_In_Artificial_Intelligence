# ARI5902 Research Topics In Artificial Intelligence

During this workshop I will show you how to build machine learning models for Computational Drug Discovery.

You will need a ton of software (configuration, etc.), which I have conveniently installed and set-up for you and placed in a docker container (you're spoilt these days!).  This should be as easy as issuing:

```
docker pull jpebe/ari5902
```

This implies you have docker installed.  This can be achieved (on Ubuntu 16.04.3 LTS) with:

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
```

You should copy **all** the Jupyter notebooks and data files [here](https://github.com/jp-uom/ARI5902_Research_Topics_In_Artificial_Intelligence/tree/master/jupyter) in a local directory and then issue:

```
docker run -ti --rm -v /your/local/dir/ARI5902_Research_Topics_In_Artificial_Intelligence/docker/jupyter:/notebooks -p 8888:8888 jpebe/ari5902
```

You should then be able to copy the Jupyter notebook URL from the terminal into your browser (ctrl-click will open a browser automatically).

The more docker-experienced people, can probably build the docker image from the docker file in this repository (```docker build -t ari5901 .```).

Pull requests (with fixes) will be recieved with thanks.

![](https://github.com/drmenguin/learnd/blob/master/jp.gif)
