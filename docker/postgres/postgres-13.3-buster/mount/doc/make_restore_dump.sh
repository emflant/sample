dropdb -f test
createdb test
psql test < ./dumpfile/dumpfile_20230228
