FROM bioconductor/bioconductor_docker:devel

MAINTAINER kevinrue67@gmail.com
LABEL authors="kevinrue67@gmail.com" \
    description="Docker image to run blogdown::build_site()"

RUN apt-get update && apt-get install -y golang && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install blogdown and Hugo
RUN Rscript -e "install.packages('blogdown')"
RUN Rscript -e "blogdown::install_hugo()"

# Install Go (as root) and copy to 
RUN cp /root/bin/hugo /usr/local/bin/hugo
