FROM python:3.6-slim-stretch

RUN apt-get update && apt-get install -y git time

RUN pip install https://anaconda.org/intel/tensorflow/1.6.0/download/tensorflow-1.6.0-cp36-cp36m-linux_x86_64.whl
RUN pip install requests

RUN git clone --branch v1.10.0 https://github.com/tensorflow/models.git
ENV PYTHONPATH $PYTHONPATH:$HOME/models
WORKDIR $HOME/models/official/wide_deep
RUN python ./census_dataset.py

ENTRYPOINT python ./census_main.py
