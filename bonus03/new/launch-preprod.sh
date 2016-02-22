#!/bin/sh

set -x

NAME=$1

IMAGENAME=$NAME

# Base directories :
BASEIN="/srv/http/www"
BASEOUT=/$IMAGENAME

echo $BASEOUT

# Container ports :
PORTS="-p 10081:80"
# PORTS=""

# Database :
DBINDIR=$BASEIN"/data"
DBIN=$DBINDIR"/db.sqlite3"
DBOUTDIR=$BASEOUT"/data"
DBOUT=$DBOUTDIR"/db.sqlite3"

# Media files
MEDIAIN=$BASEIN"/media"
MEDIAOUT=$BASEOUT"/media"

# SRC :
SRCIN=$BASEIN"/htdocs"
SRCOUT=$BASEOUT"/htdocs"

# Conf :
# CONFIN=$BASEIN"/server/httpd-app.conf"
# CONFOUT="$BASEOUT/server/httpd-app.conf"
CONFIN="/etc/httpd/conf/httpd.conf"
CONFOUT=$BASEOUT"/server/preprod.httpd.conf"


# Logs :
LOGSIN=$BASEIN"/logs"
LOGSOUT=$BASEOUT"/logs"

# Container volumes :
#DBVOL="-v "$DBOUTDIR":"$DBINDIR
#SRCVOL="-v "$SRCIN":"$SRCOUT
CONFVOL="-v $CONFOUT:$CONFIN"
LOGSVOL="-v $LOGSOUT:$LOGSIN"
#VOLUMES=$DBVOL $SRCVOL $CONFVOL
BASEVOL="-v $BASEOUT:$BASEIN"
SRCVOL="-v $SRCOUT:$SRCIN"
DBVOL="-v $DBOUT:$DBIN"
MEDIAVOL="-v $MEDIAOUT:$MEDIAIN"
VOLUMES="$CONFVOL $SRCVOL $LOGSVOL $DBVOL $MEDIAVOL"
# Other options :
OTHER=" --net=host --name $1"
OTHER="--name $1"
# shell mode :
SHELL="--rm -ti"
# Daemonize mode :
DAEMON="-d"
# Default
DEFAULT=$DAEMON
DEFAULT=$SHELL

# Building docker image.
#docker build -t $NAME .

# creating files if it doesn't exist.
echo "toto"
docker-machine ssh default "sudo mkdir -p $DBOUTDIR"
docker-machine ssh default "sudo touch $DBOUT"
docker-machine ssh default "sudo mkdir -p $LOGSOUT"


CMD="docker run $DEFAULT $OTHER $PORTS $VOLUMES $IMAGENAME"

# Running site :
echo $CMD
$CMD
