FROM feelpp/feelpp-pyfeelpp:latest
#RUN sudo pip3 install --upgrade pip
#RUN sudo pip3 install --no-cache-dir notebook==5.*

ENV NB_USER user
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN sudo groupmod -g 999 feelpp
RUN sudo adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN sudo chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
WORKDIR ${HOME}

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
