#!/system/bin/sh
INSTALLED=/data/adb/modules/arkael_dev_susfs
STAGED=/data/adb/modules_update/arkael_dev_susfs
[ "$(getprop persist.sys.safemode)" != 1 ] || exit 0
[ "$(getprop ro.sys.safemode)" != 1 ] || exit 0
if [ -d "$INSTALLED" ]; then
  [ ! -f "$INSTALLED/disable" ] && [ ! -f "$INSTALLED/remove" ] || exit 0
fi
MODDIR=$INSTALLED
[ ! -d "$STAGED" ] || MODDIR=$STAGED
[ -d "$MODDIR" ] || exit 0
[ ! -f "$MODDIR/disable" ] && [ ! -f "$MODDIR/remove" ] || exit 0
[ -f "$MODDIR/early_load" ] || exit 0
exec /system/bin/sh "$MODDIR/load.sh"
