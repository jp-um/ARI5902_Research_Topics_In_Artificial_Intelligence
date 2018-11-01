FROM continuumio/miniconda3
LABEL maintainer="JP <jean.p.ebejer@um.edu.mt>"
LABEL version="2018/9"
LABEL copyright="(C)2017-2019"

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "-s", "--"]

ENV LANG C

# install and activate python 3.6 -- this is a requirement below
RUN conda create -n py36 python=3.6.6
ENV PATH /opt/conda/envs/py36/bin:$PATH

# install the RDKit:
RUN conda config --add channels conda-forge
RUN conda config --add channels rdkit
# note including jupyter in this brings in rather a lot of extra stuff
RUN conda install -n py36 -y nomkl rdkit pandas cairo cairocffi jupyter scikit-learn graphviz python-graphviz matplotlib
# what no conda package? use pip then
RUN pip install py3Dmol

RUN mkdir /notebooks
CMD jupyter-notebook --ip="0.0.0.0" --no-browser --allow-root --notebook-dir=/notebooks
