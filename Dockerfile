FROM jupyter/datascience-notebook

# Install Anaconda
RUN conda install anaconda

# Install Jupyter Dashboard
# RUN pip install jupyter_dashboards
# RUN jupyter dashboards quick-setup --sys-prefix
# RUN jupyter nbextension enable jupyter_dashboards --py --sys-prefix
RUN conda install jupyter_dashboards -c conda-forge

# See https://github.com/jupyterlab/jupyter-renderers
# Note there seems to be a bug that means you can't install both geojson and json
# RUN jupyter labextension install @jupyterlab/json-extension
RUN jupyter labextension install @jupyterlab/geojson-extension
RUN jupyter labextension install @jupyterlab/plotly-extension

# Install Vega
RUN pip install altair
RUN pip install https://github.com/altair-viz/jupyter_vega/archive/master.zip
# It seems that this is now installed by default and the following lines are no longer neede
# RUN jupyter labextension install --symlink --py --sys-prefix jupyterlab_vega
# RUN jupyter labextension enable --py --sys-prefix jupyterlab_vega
# For Notebook
# RUN jupyter nbextension install --symlink --py --sys-prefix jupyterlab_vega
# RUN jupyter nbextension enable --py --sys-prefix jupyterlab_vega

RUN jupyter labextension install jupyterlab_voyager

# Install widgets - see https://github.com/jupyter-widgets/ipywidgets/blob/62b1c501a0a0edf0574ca57417eca55b0a3069c2/packages/jupyterlab-manager/README.md

# RUN git clone https://github.com/jupyter-widgets/ipywidgets.git
# WORKDIR $HOME/packages/jupyterlab-manager
# RUN npm install
# RUN npm run build
# RUN jupyter labextension link .
# WORKDIR $HOME
# RUN pip install jupyterlab_widgets
# RUN jupyter labextension install jupyterlab_widgets
# RUN jupyter labextension enable jupyterlab_widgets

USER root

# Changing ownership of $CONDA_DIR to all users in 'staff'
# (so we don't have to do it at container start)

ADD testfiles /home/jovyan/work/testfiles
COPY container-start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/container-start.sh

EXPOSE 8888

CMD ["/usr/local/bin/container-start.sh"]
