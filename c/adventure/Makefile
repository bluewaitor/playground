all: lilcave map.png

C = object.c misc.c inventory.c location.c toggle.c execute.c parsexec.c main.c
H = object.h misc.h inventory.h location.h toggle.h execute.h parsexec.h

lilcave: $(C) $(H)
	gcc -Wall -Wextra -Wpedantic -Werror $(C) -o $@

object.h: object.awk object.txt
	awk -v pass=h -f object.awk object.txt > $@

object.c: object.awk object.txt
	awk -v pass=c1 -f object.awk object.txt > $@
	awk -v pass=c2 -f object.awk object.txt >> $@

map.png: map.gv
	dot -Tpng -o $@ $<

map.gv: map.awk object.txt
	awk -f map.awk object.txt > $@