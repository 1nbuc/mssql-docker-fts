## Source: https://github.com/Microsoft/mssql-docker/blob/master/linux/preview/examples/mssql-agent-fts-ha-tools/Dockerfile

# mssql-agent-fts-ha-tools
# Maintainers: Microsoft Corporation (twright-msft on GitHub)
# GitRepo: https://github.com/Microsoft/mssql-docker

# Base OS layer: Latest Ubuntu LTS
FROM amd64/ubuntu:20.04

# Install prerequistes since it is needed to get repo config for SQL server
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update
RUN apt-get install -yq curl apt-transport-https gnupg
    # Get official Microsoft repository configuratio
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - 
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-preview.list | tee /etc/apt/sources.list.d/mssql-server.list 
 # Install SQL Server from apt
RUN apt-get update
RUN apt-get install -y mssql-server mssql-server-fts
    # Install optional packages
    # Cleanup the Dockerfile
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists

# Run SQL Server process
CMD /opt/mssql/bin/sqlservr
