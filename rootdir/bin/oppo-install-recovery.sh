#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:6383b2d42e622da4facc56a87e6f2d21b750a1c4; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:407d083b150654ac1b6d82e0713ec5baba1bb83a \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:6383b2d42e622da4facc56a87e6f2d21b750a1c4 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
