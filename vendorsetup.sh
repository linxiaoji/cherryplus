export WITH_SU=true;
export USE_CCACHE=true;
export CM_BUILDTYPE=NIGHTLY;
if [ ! -e device/huawei/cherryplus/patches/apply ]
then sh device/huawei/cherryplus/patches/apply.sh; touch device/huawei/cherryplus/patches/apply; fi
add_lunch_combo lineage_cherryplus-userdebug
