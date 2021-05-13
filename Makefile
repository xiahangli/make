include foo.make *.mk $(bar)

test:test.c
	gcc -o test test.c


.PHONY: clean
clean:
	@rm -rf *.o

text.g: *.c
	touch print



bigoutput littleoutput : text.g
	-$(subst output,,$@) > $@ #-$(subst output,,$@) 中的 $ 表示执行一个Makefile的函数,-表示出错了继续执行


