#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:dc898d8ec5fdac0f59d2a33ecf3bc4df2d04688b; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:7d13cc0a2df411defd472f7c45ed2d1d1b7a2641 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:dc898d8ec5fdac0f59d2a33ecf3bc4df2d04688b && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
