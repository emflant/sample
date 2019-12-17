docker run -it --rm --network postgres-net \
	-e POSTGRES_PASSWORD=pwsql \
	-e POSTGRES_USER=test_user \
	postgres:alpine -h my-postgres -U test_user
