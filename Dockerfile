FROM jupyter/scipy-notebook:latest
# meta information on the container
LABEL maintainer="Prof. JP Ebejer <jean.p.ebejer@um.edu.mt>" \
      version="2.0" \
      copyright="(C)2017-2026" \
      description="Container to run CADD workshop"

RUN mamba install --yes -c conda-forge \
    'rdkit' \
    'python-graphviz' \
    'py3dmol' && \
    # Clean up the cache to keep the final image smaller
    mamba clean --all -f -y
