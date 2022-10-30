NDK=${ANDROID_NDK_HOME}
ls
pwd

cd luajit
cd ../

echo "starting"

${NDK}/ndk-build NDK_PROJECT_PATH=./ NDK_APPLICATION_MK=./Application.mk APP_BUILD_SCRIPT=./Android.mk

echo "done"
