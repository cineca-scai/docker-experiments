
##########################################################################
# Spark and python friends
# Last changes: 14th June, 2016

FROM cineca/nbsparkling:0.5
MAINTAINER "Paolo D'Onorio De Meo <p.donoriodemeo@cineca.it>"

##########################################################################
# MAPREDUCE RELATED
USER root

# install libs
RUN pip install --upgrade pip
RUN pip install plumbum jinja2 tweepy version_information


# Update anaconda
RUN conda update --all -y
RUN conda remove backports_abc -y
RUN conda install python=3.5 -y
RUN conda clean -yt 

