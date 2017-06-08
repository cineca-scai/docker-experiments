
FROM continuumio/miniconda3:4.3.14
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

##########################
# See https://hub.docker.com/r/intelpython/intelpython3_full/~/dockerfile/
ENV ACCEPT_INTEL_PYTHON_EULA=yes
RUN conda config --add channels intel \
    && conda install -y -q intelpython3_full=2017.0.3=0 python=3

##########################

# Configure environment
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/$NB_USER

# Create jovyan user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    # mkdir -p $CONDA_DIR && \
    chown $NB_USER $CONDA_DIR
USER $NB_USER
ENV PATH $CONDA_DIR/bin:$PATH

##########################
# Add notebook starter
USER root
ENV DATA_DIR /data
RUN mkdir -p $DATA_DIR && chown $NB_USER $DATA_DIR
VOLUME $DATA_DIR
WORKDIR $DATA_DIR

CMD [ "nbstart.sh" ]
COPY nbstart.sh /usr/local/bin
RUN chmod +x /usr/local/bin/nbstart.sh

# USER $NB_USER
