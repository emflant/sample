docker run -d  \
    --name my-postgres \
    --network my-net \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=1111 \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $PWD/mount/data:/var/lib/postgresql/data \
    -v $PWD/mount/doc:/var/lib/postgresql/doc \
    -v ~/data:/var/lib/postgresql/my-data \
    postgres-2
