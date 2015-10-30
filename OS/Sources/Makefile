TOOLPATH = ../z_tools/
MAKE	 = $(TOOLPATH)make.exe -r
NASK	 = $(TOOLPATH)nask.exe
EDIMG	 = $(TOOLPATH)edimg.exe
IMGTOL	 = $(TOOLPATH)imgtol.com
COPY	 = copy
DEL		 = del

# デフォルト動作
 
default :
	$(MAKE) run

# ファイル生成規則

eOS.bin : eOS.nas Makefile
	$(NASK) eOS.nas eOS.bin eOS.lst

eOS.img : eOS.bin Makefile
	$(EDIMG)	imgin:../z_tools/fdimg0at.tek \
		wbinimg src:eOS.bin len:512 from:0 to:0   imgout:eOS.img

# コマンド

asm :
	$(MAKE) eOS.bin

img :
	$(MAKE) eOS.img

run :
	$(MAKE) img
	$(COPY) eOS.img ..\z_tools\qemu\fdimage0.bin
	$(MAKE) -C ../z_tools/qemu

install :
	$(MAKE) img
	$(IMGTOL)w a: eOS.img

clean :
	-$(DEL) eOS.bin
	-$(DEL) eOS.lst

src_only :
	$(MAKE) clean
	-$(DEL) eOS.img
