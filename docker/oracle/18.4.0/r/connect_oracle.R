
# mac 에서 rJava 가 로드가 안될시, 아래 명령어를 쉘에서 실행한다.
# install_name_tool -change \
# /Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/lib/server/libjvm.dylib \
# /Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home/lib/server/libjvm.dylib \
# /Library/Frameworks/R.framework/Versions/3.6/Resources/library/rJava/libs/rJava.so

# (참고) https://github.com/s-u/rJava/issues/151#issuecomment-395070694
# (참고) https://yunhwankim2.github.io/2019/09/25/rstudio-rjava/

# Sys.getenv()
# Sys.setenv(JAVA_HOME = '/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home/')
# dyn.load('/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home/lib/server/libjvm.dylib')

library(RJDBC)
jdbc_driver = JDBC("oracle.jdbc.OracleDriver", classPath = "../docker/oracle/18.4.0/r/ojdbc8.jar")
con = dbConnect(jdbc_driver, "jdbc:oracle:thin:@//localhost:1521/xepdb1", "sys as sysdba", "1")

jobs = dbReadTable(con, "hr.jobs")

aa = dbGetQuery(con, 'select * from hr.jobs')
# dbListTables(con)


