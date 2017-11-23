FROM continuumio/miniconda3
MAINTAINER JP <jean.p.ebejer@um.edu.mt>

# Add Tini - due to reaping problem ...
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV LANG C

# install and activate python 3.5 -- this is a requirement below
RUN conda create -n py35 python=3.5
ENV PATH /opt/conda/envs/py35/bin:$PATH

# install the RDKit:
RUN conda config --add channels  https://conda.anaconda.org/rdkit
# note including jupyter in this brings in rather a lot of extra stuff
RUN conda install --name py35 -y nomkl rdkit pandas cairo cairocffi jupyter scikit-learn graphviz python-graphviz matplotlib
# what no conda package? use pip then
RUN pip install py3Dmol

RUN mkdir /notebooks
CMD jupyter-notebook --ip="*" --no-browser --allow-root --notebook-dir=/notebooks
