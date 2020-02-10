
# install.packages("RJDBC")
# *** JDK is incomplete! Please make sure you have a complete JDK. JRE is *not* sufficient.
# configure: error: ./configure failed for jri
# ERROR: configuration failed for package ‘rJava’

library(RJDBC)

jdbc_driver = JDBC("oracle.jdbc.OracleDriver", classPath = )

con = dbConnect(odbc(), "oracledb", UID = "sys", PWD="1")
