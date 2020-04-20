D:\soft\devbin\nrfutil.exe pkg generate --hw-version 52 --application-version 1 --application _build\nrf52_kbd.hex --sd-req 0xB7 --key-file private.key app_dfu_package.zip
D:\soft\devbin\nrfutil.exe settings generate --family NRF52 --application ..\..\application\bootloader\project\_build\nrf52_bootloader.hex --application-version 1 --bootloader-version 0 --bl-settings-version 1 bootloader_setting.hex


mergehex --merge ..\..\application\bootloader\project\_build\nrf52_bootloader.hex bootloader_setting.hex --output nrf_bootloader_wsetting.hex

copy ..\..\application\bootloader\project\_build\nrf52_bootloader.hex .\
nrfutil pkg generate --hw-version 52 --bootloader-version 0 --bootloader nrf_bootloader_wsetting.hex --application-version 1 --application _build\nrf52_kbd.hex  --sd-req 0xB8,0xB7 --sd-id 0xB8,0xB7 --softdevice  ../../SDK/components/softdevice/s132/hex/s132_nrf52_6.1.1_softdevice.hex --key-file private.key app_nrdfu_package_softdevice.zip
