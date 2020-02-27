#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:ec1d7566d200e1cf6ab5348bd0f04df50af30fb1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:6b97daddeaab8d11f4995655602d3a31b408a203 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:ec1d7566d200e1cf6ab5348bd0f04df50af30fb1 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
