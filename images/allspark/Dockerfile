FROM jupyter/all-spark-notebook:latest

USER root

COPY nbstart.sh /usr/local/bin
RUN chmod o+x /usr/local/bin/nbstart.sh

CMD [ "nbstart.sh" ]

USER $NB_USER
