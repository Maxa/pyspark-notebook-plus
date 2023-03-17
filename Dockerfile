# add libraries to jupyter/pyspark-notebook
FROM jupyter/pyspark-notebook

USER ${NB_UID}

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'tensorflow' \
    'spectrum' \
    'statsmodels' \
    'rasterio' \
    'gdal' \
    'geoutils' \
    'contextily' \
    'ipympl' \
    'nodejs' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR "${HOME}"
