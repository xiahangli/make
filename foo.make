CC = gcc
CPPFLAGS = -Wall -g
AR = ar
ARFLAGS = rv

#
# libd.a(d.o b.o)
# 等价于libd.a(d.o) libd.a(b.o)
# 执行make 时: make 'libd.a(d.o)'
# make 'libd.a(b.o)'
#
#需要有b.o,d.o文件，可手动生成,其中$^表示前置条件，如target:prerequist1 prerequest2,则$^就指代prerequist1 prerequest2
#下面的展开为
#lib.a(d.o b.o): d.o b.o
#   ar rv lib.a(d.o,b.o) d.o b.o
#先执行make 'libd.a(d.o)',在执行make 'libd.a(b.o)',结果如下
#!<arch>
# d.o             1620497775  501   20    100644  0         `
# b.o             1620497787  501   20    100644  0         `
#
lib.a(d.o b.o): d.o b.o
	${AR} ${ARFLAGS} $@ $^

#$@代表当前目标，也就是要构建的目标,例子如下
#下面的例子stydollarat是目标target，如果输入make stydollarat就是说要执行touch stydollarat即创建目录,同理
#空格隔开的第二个对象stydollarat1,输入make stydollarat1会创建 stydollarat2文件
stydollarat stydollarat1:
	touch $@


#学习如何用>代替tab键
.RECIPEPREFIX = >

