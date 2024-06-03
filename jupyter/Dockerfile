# ベースイメージのバージョンを動的に指定
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Jupyter Labをインストール
RUN pip install --no-cache-dir jupyterlab

# Jupyter設定ファイルをコピー
COPY jupyter_lab_config.py /root/.jupyter/

# コンテナ起動時にJupyter Labを実行
ENV JUPYTER_PORT=8888
CMD ["sh", "-c", "jupyter lab --notebook-dir=/workspace"]
