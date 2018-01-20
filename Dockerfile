FROM jupyter/datascience-notebook

USER root

RUN pip install tensorflow gensim keras

RUN pip install spacy
RUN python -m spacy download en
RUN python -m spacy download de

USER $NB_USER

ENTRYPOINT ["tini", "--"]
CMD ["start.sh", "jupyter lab --LabApp.token='' work/"]