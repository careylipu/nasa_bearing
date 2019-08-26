FROM jupyter/scipy-notebook:2ce7c06a61a1

RUN pip install --no-cache \
       numpy>=1.15.1 \
       ocs-sample-library-preview>=0.0.32rc0 \
       pandas>=0.24.2 \
       python_dateutil>=2.8.0 \
       seaborn>=0.9.0

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
