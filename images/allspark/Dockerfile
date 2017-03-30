FROM jupyter/all-spark-notebook:latest

USER root

COPY nbstart.sh /booter
RUN chmod o+x /booter

ENTRYPOINT [ "/booter" ]

USER $NB_USER
