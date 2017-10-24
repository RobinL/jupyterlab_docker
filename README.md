# analytics-platform-jupyter-notebook
Jupyter Notebook Docker image for Analytics Platform

For jupyter lab:

```
docker run -d -p 8888:8888 jl start.sh jupyter lab --NotebookApp.token=''
```


For Jupyter Notebook:

```
docker run -d -p 8889:8888 jl start-notebook.sh --NotebookApp.token=''
```

```
docker kill $(docker ps --filter ancestor=jl -q)
```

### About Jupyter Notebook
From [Jupter](http://jupyter.org):
> The Jupyter Notebook is a web application that allows you to create and share documents that contain live code, equations,
> visualizations and explanatory text. Uses include: data cleaning and transformation, numerical simulation, statistical
> modeling, machine learning and much more."

### Docker image
This docker image is based on the [jupyter/datascience-notebook image](https://github.com/jupyter/docker-stacks/blob/master/datascience-notebook/README.md#notebook-options). See

It adds Anaconda and Jupyter dashboard.

**NOTE**: There is a page with recipes in the docker-stacks repository. This may be useful, https://github.com/jupyter/docker-stacks/wiki/Docker-Recipes

### Disabling authentication
In order to disable the authentication you can run this container as follows:

    $ docker run -d -p 8888:8888 jupyter/datascience-notebook start-notebook.sh --NotebookApp.token=''
    
### Known issues
 - This image is a work in progress, you'll currently get a "Dead kernel" error in Jupyter notebook ([this issue may be related](https://github.com/jupyter/docker-stacks/issues/337))
 - The image creates a 'jovyan' user with UID 1000, we'll need to figure it out how this will work with the NFS home (rename/change user UID?)
   - anaconda/jupyter dashboard are installed as this user, this may need to change
