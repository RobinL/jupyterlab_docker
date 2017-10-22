FROM jupyter/datascience-notebook

# Install Anaconda
RUN conda install anaconda

# Install Jupyter Dashboard
RUN conda install jupyter_dashboards -c conda-forge

# See https://github.com/jupyterlab/jupyter-renderers
# Note there seems to be a bug that means you can't install both geojson and json
# See https://github.com/jupyterlab/jupyter-renderers/issues/53
# RUN jupyter labextension install @jupyterlab/json-extension
RUN jupyter labextension install @jupyterlab/geojson-extension
# RUN jupyter labextension install @jupyterlab/plotly-extension

# Install Vega and Altair
RUN pip install altair
RUN pip install https://github.com/altair-viz/jupyter_vega/archive/master.zip

RUN jupyter labextension install jupyterlab_voyager

# Install widgets - see https://github.com/jupyter-widgets/ipywidgets/blob/62b1c501a0a0edf0574ca57417eca55b0a3069c2/packages/jupyterlab-manager/README.md
# This currently fails due to conflicting dependencies/different version.s
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.27.1
# RUN git clone https://github.com/jupyter-widgets/ipywidgets.git
# WORKDIR $HOME/ipywidgets
# RUN git checkout @jupyter-widgets/jupyterlab-manager@0.27.1
# WORKDIR $HOME/ipywidgets/packages/jupyterlab-manager
# RUN npm install
# RUN npm run build
# RUN jupyter labextension link .
# WORKDIR $HOME

USER root

# Changing ownership of $CONDA_DIR to all users in 'staff'
# (so we don't have to do it at container start)

ADD testfiles /home/jovyan/work/testfiles
ADD testfiles /home/jovyan/work/testfiles
RUN chmod a+rwx -R /home/jovyan/work/testfiles
COPY container-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/container-start.sh

EXPOSE 8888

CMD ["/usr/local/bin/container-start.sh"]
