# nodejs-openwrt
Nodejs package for openwrt

Usage: 

[1] copy whole package into openwrt_trunk/package/utils folder.

[2] make menuconfig 
		Utilities
			-->nodejs
			
[3] make V=s

***Notice***
The node binary is about 12M Bytes after strip by mips toolchain, So,
if your FLASH_SIZE is not bigger enough, less than 16MB, the firmware
may not be generate(like openwrt-ramips-MODEL-squash-sysupgrade.bin),
you can cp the node binary to firmware /tmp folder to test.

