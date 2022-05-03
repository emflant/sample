docker run -it --network my-net \
	--rm mariadb-2 \
	mariadb -hmy-mariadb -uroot -proot_pw test
