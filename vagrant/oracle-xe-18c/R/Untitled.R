install.packages("odbc")
library(odbc)
con = DBI::dbConnect(odbc::odbc(),
                     Driver = "oracledb",
                     Host = "localhost",
                     SVC = "xepdb1",
                     UID = "sys",
                     PWD = "4IFwe1nCV8E=1",
                     Port = 1521)
odbc::odbcListDrivers()

install.packages("RJDBC")
install.packages("rJava")
library(rJava)

# Oracle Database 18c (18.3) JDBC Driver Download.
# https://www.oracle.com/database/technologies/appdev/jdbc-ucp-183-downloads.html
setwd("$WORKSPACE")
RJDBC::JDBC(driverClass="oracle.jdbc.OracleDriver", 
            classPath="/Volumes/PhotoDisk/30_workspace/sample/vagrant/oracle-xe-18c/ojdbc8.jar", "`")
getwd()

Sys.getenv()
Sys.getenv("JAVA_HOME")
Sys.setenv(JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/")
Sys.setenv(LD_LIBRARY_PATH = '$LD_LIBRARY_PATH:$JAVA_HOME/lib')
Sys.getenv("DYLD_FALLBACK_LIBRARY_PATH")

# Sys.setenv(DYLD_FALLBACK_LIBRARY_PATH ="/Library/Frameworks/R.framework/Resources/lib:/Users/emflant/lib:/usr/local/lib:/usr/lib:::/lib:/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/jre/lib/server")
install.packages("rJava", type = "source")
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/jre/lib/server/libjvm.dylib')
remove.packages(rJava)



# https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance/dockerfiles/18.4.0

