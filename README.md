# mssql-docker-fts
Docker image for Microsoft SQL Server with Full-Text Seach feature enabled

## To get started choose one of the following Options:

### With docker-compoes:
```bash 
git clone https://github.com/1nbuc/mssql-docker-fts.git && cd mssql-docker-fts
```
Edit .env and docker-compose.yaml as needed.
```bash
docker compose up -d
```

### single command:
```bash
sudo mkdir -p /mssql-data && \
sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Password123" \
   -p 1433:1433 --name sql_server --hostname sql1 \
   -v /mssql-data:/var/opt/mssql \
   -d ghcr.io/1nbuc/mssql-docker-fts:latest
 ```
 
 For further documentation see:
 - https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure?view=sql-server-ver16&pivots=cs1-bash#persist
 - https://hub.docker.com/_/microsoft-mssql-server
