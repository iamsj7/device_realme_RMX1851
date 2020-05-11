#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0a1ed49940e8faf0c33058b000e78367eee037c5; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:fa7c2f238f04517a6ae9efcc3a15e39a70e06185 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0a1ed49940e8faf0c33058b000e78367eee037c5 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
