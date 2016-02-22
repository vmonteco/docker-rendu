#!/bin/sh

NAME=$1

IMAGENAME=hypnose

# Base directories :
BASEIN="/srv/http/www"
BASEOUT=$(pwd)

echo $BASEOUT

# Container ports :
PORTS="-p 10080:80"
# PORTS=""

# Database :
DBINDIR=$BASEIN"/data"
DBIN=$DBINDIR"/db.sqlite3"
DBOUTDIR=$BASEOUT"/data"
DBOUT=$DBOUTDIR"/db.sqlite3"

# other files
#EXTIN=$BASEIN"/ext"
#EXTOUT=$BASEOUT"/ext"

# Media files :
MEDIAOUT=$BASEOUT"/media"
MEDIAIN=$BASEIN"/media"

# SRC :
SRCIN=$BASEIN"/htdocs"
SRCOUT=$BASEOUT"/htdocs"

# Conf :
# CONFIN=$BASEIN"/server/httpd-app.conf"
# CONFOUT="$BASEOUT/server/httpd-app.conf"
CONFIN="/etc/httpd/conf/httpd.conf"
CONFOUT=$BASEOUT"/server/httpd.conf"


# Logs :
LOGSIN=$BASEIN"/logs"
LOGSOUT=$BASEOUT"/logs"

# Container volumes :
#DBVOL="-v "$DBOUTDIR":"$DBINDIR
#SRCVOL="-v "$SRCIN":"$SRCOUT
CONFVOL="-v $CONFOUT:$CONFIN"
LOGSVOL="-v $LOGSOUT:$LOGSIN"
#VOLUMES=$DBVOL $SRCVOL $CONFVOL
DBVOL="-v $DBOUT:$DBIN"
SRCVOL="-v $SRCOUT:$SRCIN"
MEDIAVOL="-v $MEDIAOUT:$MEDIAIN"
#EXTVOL="-v $EXTOUT:$EXTIN"
VOLUMES="$CONFVOL $SRCVOL $LOGSVOL $DBVOL $MEDIAVOL $EXTVOL"
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
