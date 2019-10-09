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

# Update conda
RUN conda update -n base -c defaults -y conda
# install and activate python 3.7 -- this is a requirement below
RUN conda create -n py37
ENV PATH /opt/conda/envs/py37/bin:$PATH

# install the RDKit:
RUN conda config --add channels rdkit
# note including jupyter in this brings in rather a lot of extra stuff
RUN conda install -n py37 -y rdkit pandas jupyter scikit-learn graphviz python-graphviz matplotlib

# what no conda package? use pip then
RUN pip install py3Dmol

# run the jupyter notebook
RUN mkdir /notebooks
CMD jupyter-notebook --ip="0.0.0.0" --no-browser --allow-root --notebook-dir=/notebooks

