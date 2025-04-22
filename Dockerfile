# Usar la imagen base de Jupyter con PySpark
FROM jupyter/pyspark-notebook:2023-04-24

# Instalar bibliotecas Python adicionales
RUN pip install --no-cache-dir \
    pymysql \
    sqlalchemy \
    trino \
    minio \
    pandas \
    pyarrow \
    pyhive \
    thrift_sasl \
    ipython-sql \
    delta-spark \
    findspark \
    boto3