UNIX=(Debian 'Red Hat' Ubuntu Suse Fedora)
echo ${UNIX[*]}
echo ${#UNIX[*]}
echo ${#UNIX[2]}
echo ${UNIX[@]:3:4}
echo ${UNIX[@]/Ubuntu/SCOUnix}
UNIX[5]=AIX
UNIX[6]=HP-UX
echo ${UNIX[@]}
unset UNIX[2]
echo ${UNIX[@]}
LINUX=${UNIX[@]}
echo ${LINUX[@]}
BASH=(${LINUX[@]} ${UNIX[@]})
echo ${BASH[@]}
unset UNIX[@]
unset LINUX

