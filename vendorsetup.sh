export WITH_SU=true;
export USE_CCACHE=true;
export RR_BUILDTYPE="Nightly";
#export WITH_ROOT_METHOD="magisk";
export WITH_ROOT_METHOD="rootless";
if [ -z $dtl ];then export dtl=0; else export days_to_log=$dtl; fi
#export dtl=0; unset days_to_log;
#export USE_NINJA=false
if [ ! -e device/huawei/cherryplus/patches/apply ]
then sh device/huawei/cherryplus/patches/apply.sh; touch device/huawei/cherryplus/patches/apply; fi
add_lunch_combo lineage_cherryplus-userdebug
add_lunch_combo lineage_cherryplus-eng
