#!/bin/bash
VERSION=1.0.0
PACKAGE=

log_error() {
  if [ $LOG_LEVEL -le 3 ]; then
    echo -e "Error: ${1}"
  fi
}
usage(){
  echo "
  Version: $VERSION
  Usage: android_pull [options] <package>

  <package> Should be valid android debuggable package

  Options:
  -h,--help This help page
  "
}


parse_params() {
  LOG_LEVEL=${LOG_LEVEL:=1}
  while [ "${1:0:1}" == "-" ]; do
    case "$1" in
    -debug | --debug)
      LOG_LEVEL=0
      shift
      ;;
    -h | --help)
      usage
      exit
      ;;
    *)
      log_error "Unexpected initial script's parameter(s). Please check command format."
      usage
      exit
      ;;
    esac
  done
  PACKAGE=$1
}

parse_params $*
echo "Dumping android package $PACKAGE directory..."
adb shell "run-as $PACKAGE tar -c . | base64 -w 0" > $PACKAGE.tar.base64
echo "Dump is done"
echo "Unpacking..."
base64 -d $PACKAGE.tar.base64 > $PACKAGE.tar
rm -rf $PACKAGE.tar.base64
mkdir -p $PACKAGE
tar -xvf ./$PACKAGE.tar -C $PACKAGE
rm -rf $PACKAGE.tar
echo "Process is finished"
exit 0