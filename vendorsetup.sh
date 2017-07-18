export WITH_SU=true;
export USE_CCACHE=true;
export RR_BUILDTYPE="Nightly";
#export WITH_ROOT_METHOD="magisk";
export WITH_ROOT_METHOD="rootless";
if [ -z $days_to_log ];then export days_to_log=0; fi
#export USE_NINJA=false
if [ ! -e device/huawei/cherryplus/patches/apply ]
then sh device/huawei/cherryplus/patches/apply.sh; touch device/huawei/cherryplus/patches/apply; fi
add_lunch_combo lineage_cherryplus-userdebug
add_lunch_combo lineage_cherryplus-eng
