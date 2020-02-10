#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:143769d8d66a30d2c96971f0ec07ab1b64ac09fe; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:a511f36df1e98d799228acace47a5d326c9f18f1 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:143769d8d66a30d2c96971f0ec07ab1b64ac09fe && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
