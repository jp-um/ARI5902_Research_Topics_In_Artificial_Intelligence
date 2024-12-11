FROM continuumio/miniconda3
LABEL maintainer="JP <jean.p.ebejer@um.edu.mt>"
LABEL version="2019/25"
LABEL copyright="(C)2017-2025"

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV LANG C

# Update conda
RUN conda update -n base -c defaults -y conda
# install and activate python 3.12 -- this is a requirement below
RUN conda create -n py312
ENV PATH /opt/conda/envs/py312/bin:$PATH

# install the RDKit:
RUN conda config --add channels conda-forge
# note including jupyter in this brings in rather a lot of extra stuff
RUN conda install -n py312 -y rdkit pandas jupyter scikit-learn graphviz python-graphviz matplotlib py3dmol

# run the jupyter notebook
RUN mkdir /notebooks
CMD jupyter-notebook --ip="0.0.0.0" --no-browser --allow-root --notebook-dir=/notebooks

