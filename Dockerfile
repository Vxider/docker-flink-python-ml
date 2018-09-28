# Below are the dependencies required for installing the common combination of numpy, scipy, pandas and matplotlib 
# in an Alpine based Docker image.
FROM vxider/docker-flink-python:latest

# xgboost
RUN apk add --update --no-cache \
    --virtual=.build-dependencies \
    git && \
    mkdir /src && \
    cd /src && \
    git clone --recursive https://github.com/dmlc/xgboost && \
    sed -i '/#define DMLC_LOG_STACK_TRACE 1/d' /src/xgboost/dmlc-core/include/dmlc/base.h && \
    sed -i '/#define DMLC_LOG_STACK_TRACE 1/d' /src/xgboost/rabit/include/dmlc/base.h && \
    apk del .build-dependencies

RUN apk add --update --no-cache \
    --virtual=.build-dependencies \
    make gfortran \
    py-setuptools g++ && \
    apk add --no-cache openblas lapack-dev libexecinfo-dev libstdc++ libgomp && \
    pip install numpy==1.13.3 && \
    pip install scipy==1.0.0 && \
    pip install pandas==0.22.0 scikit-learn==0.19.1 && \
    ln -s locale.h /usr/include/xlocale.h && \
    cd /src/xgboost; make -j4 && \
    cd /src/xgboost/python-package && \
    python setup.py install && \
    rm /usr/include/xlocale.h && \
    rm -r /root/.cache && \
    rm -rf /src && \
    apk del .build-dependencies