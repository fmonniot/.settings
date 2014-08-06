#!/usr/bin/env python2
print "Console colors. Use them with \ 033[#;#;#;"
for i in [0,1,2,3,4,7,9]:
    print ""
    for j in range(30, 38):
        for k in range(40, 48):
            print "\33[%d;%d;%dm%d;%d;%d\33[m " % (i, j, k, i, j, k),
        print
