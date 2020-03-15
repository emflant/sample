docker run -it --network mariadb-net --rm mariadb-1:10.4.12-bionic \
	mysql -hmy-mariadb -uroot -proot_pw test
