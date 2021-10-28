FROM continuumio/miniconda:4.6.14

LABEL authors="Laurence Kuhlburger, Gisela Gabernet" \
      description="Docker image containing all requirements for qbic-pipelines/vcreport pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
RUN apt-get update -qq && \
    apt-get install -y zip procps ghostscript

# Add conda installation dir to PATH
ENV PATH /opt/conda/envs/qbic-pipelines-vcreport-1.0.0dev/bin:$PATH

# Dump the details of the installed packates to a file for posterity
RUN conda env export --name qbic-pipelines-vcreport-1.0.0dev > qbic-pipelines-vcreport-1.0.0dev.yml

# Instruct R processes to use these empty files instead of clashing with a local config
RUN touch .Rprofile
RUN touch .Renviron
