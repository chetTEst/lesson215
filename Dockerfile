# Start with a lightweight Python base image
FROM python:3.11-slim

# Install Jupyter
RUN pip install notebook

# Install the required Python libraries
RUN pip install numpy pandas scikit-learn plotly

# Create a user to avoid running as root
RUN useradd -m jupyteruser
USER jupyteruser

# Set the working directory
WORKDIR /home/jupyteruser

COPY lesson2.1.5.ipynb /home/jupyteruser/
COPY AdaptiveAntivirus /home/jupyteruser/
COPY utilities.py /home/jupyteruser/

# Expose the port Jupyter will run on
EXPOSE 8888

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]