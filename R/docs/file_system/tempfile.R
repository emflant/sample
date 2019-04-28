# This will be a subdirectory of the per-session temporary directory found by the following rule when the R session is started.
tempdir(check = F)
# [1] "/var/folders/tg/nwxp2y9n1gz6111wjyh3gzgh0000gp/T//RtmpIkXiRr"
# [1] "/var/folders/tg/nwxp2y9n1gz6111wjyh3gzgh0000gp/T//RtmpNILu4e"

tempfile()
# [1] "/var/folders/tg/nwxp2y9n1gz6111wjyh3gzgh0000gp/T//RtmpNILu4e/file3ae348f80e0"

tempfile(tmpdir = "~/temp")
