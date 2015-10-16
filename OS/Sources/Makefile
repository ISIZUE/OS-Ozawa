
# デフォルト動作
 
default :
	../z_tools/make.exe run

# ファイル生成規則

eOS.bin : eOS.nas Makefile
	../z_tools/nask.exe eOS.nas eOS.bin eOS.lst

eOS.img : eOS.bin Makefile
	../z_tools/edimg.exe	imgin:../z_tools/fdimg0at.tek \
		wbinimg src:eOS.bin len:512 from:0 to:0   imgout:eOS.img

# コマンド

asm :
	../z_tools/make.exe -r eOS.bin

img :
	../z_tools/make.exe -r eOS.img

run :
	../z_tools/make.exe img
	copy eOS.img ..\z_tools\qemu\fdimage0.bin
	../z_tools/make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	../z_tools/imgtol.com w a: eOS.img

clean :
	-del eOS.bin
	-del eOS.lst

src_only :
	../z_tools/make.exe clean
	-del eOS.img
