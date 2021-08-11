docker run -d  \
    --name my-postgres \
    --network mariadb-net \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=1111 \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $PWD/mount/data:/var/lib/postgresql/data \
    postgres-2
