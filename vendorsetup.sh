export WITH_SU=true;
export USE_CCACHE=true;
#export USE_NINJA=false
if [ ! -e device/huawei/cherryplus/patches/apply ]
then sh device/huawei/cherryplus/patches/apply.sh; touch device/huawei/cherryplus/patches/apply; fi
add_lunch_combo aosp_cherryplus-userdebug
add_lunch_combo aosp_cherryplus-eng
