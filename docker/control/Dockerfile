FROM python:3.7.0-slim-stretch

# for debuuging and testing temporarily we can install packages below
RUN apt-get update && apt-get install -y net-tools iputils-ping nmap

RUN mkdir -p /opt/gobgp_control
WORKDIR /opt/gobgp_control/

RUN pip install pygobgp jupyter

# Run Jupyter Notebook and allow remote access on port 8080
# Also disable token 
RUN mkdir -p /root/.jupyter
COPY docker/control/jupyter/jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8080
ENTRYPOINT ["jupyter", "notebook", "--port=8080", "--ip=0.0.0.0", "--allow-root"]
