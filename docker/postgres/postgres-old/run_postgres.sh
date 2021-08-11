docker run --name my-postgres \
	-p 5432:5432 \
	-e POSTGRES_PASSWORD=pwsql \
	-e POSTGRES_USER=test_user \
	-e POSTGRES_DB=test_db \
	--network postgres-net \
	-v $PWD/mount/data:/var/lib/postgresql/data \
	-d postgres:alpine 
