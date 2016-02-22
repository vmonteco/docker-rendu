#!/bin/sh

NAME=$1

IMAGENAME=bonus03

# Base directories :
BASEIN="/srv/http/www"
BASEVM=/$IMAGENAME
BASEOUT=$(pwd)

echo $BASEVM

# Container ports :
PORTS="-p 10081:80"
# PORTS=""

# Database :
DBINDIR=$BASEIN"/data"
DBIN=$DBINDIR"/db.sqlite3"
DBOUTDIR=$BASEVM"/data"
DBOUT=$DBOUTDIR"/db.sqlite3"

# Media files
MEDIAIN=$BASEIN"/media"
MEDIAOUT=$BASEVM"/media"

# SRC :
SRCIN=$BASEIN"/htdocs"
SRCOUT=$BASEVM"/htdocs"

# Conf :
# CONFIN=$BASEIN"/server/httpd-app.conf"
# CONFOUT="$BASEVM/server/httpd-app.conf"
CONFIN="/etc/httpd/conf/httpd.conf"
CONFOUT=$BASEVM"/server/preprod.httpd.conf"


# Logs :
LOGSIN=$BASEIN"/logs"
LOGSOUT=$BASEVM"/logs"

# Container volumes :
#DBVOL="-v "$DBOUTDIR":"$DBINDIR
#SRCVOL="-v "$SRCIN":"$SRCOUT
CONFVOL="-v $CONFOUT:$CONFIN"
LOGSVOL="-v $LOGSOUT:$LOGSIN"
#VOLUMES=$DBVOL $SRCVOL $CONFVOL
BASEVOL="-v $BASEVM:$BASEIN"
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
#DEFAULT=$SHELL

# Building docker image.
#docker build -t $NAME .

# creating files if it doesn't exist.
mkdir -p $DBOUTDIR
touch $DBOUT
mkdir -p $LOGSOUT


CMD="docker run $DEFAULT $OTHER $PORTS $VOLUMES $IMAGENAME"

# Running site :
echo $CMD
$CMD
