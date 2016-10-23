#!/usr/bin/env python
#coding=utf-8
import os
import sys
xs={
    'x':'startxfce4',
    'a':'awesome',
    'k':'kde',
    'f':'startfluxbox',
    'g':'gnome',
    'o':'openbox',
    'l':'lxde'
    }

# print str(len(sys.argv))
# print sys.argv[0]

if len(sys.argv)==1:
    os.system('startx')
elif len(sys.argv)==2:
    mpath = os.environ['HOME'] + '/'
    mstr='exec '+ xs[sys.argv[1]]
    mstr="sed -i '$s/^.*$/" + mstr + "/' " + mpath +'.xinitrc'
    try:
        os.system(mstr)
        os.system('startx')
        # print(mstr)
    except:
        print('FAILED.............')
