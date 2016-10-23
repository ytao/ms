#!/bin/sh
# 启动X并选择window manager，核心思想是mstr的传递和替换

if [ $# -eq 0 ] # 直接输入ms等同于startx
then
	startx
	exit 0
elif [ $# -eq 1 ] # 选择一个内建的命令登录X
then
	case $1 in
		"a")
			mstr="awesome"
			;;
		"c")
			mstr="cinnamon-session"
			;;
		"m")
			mstr="mate-session"
			;;
		"o")
			mstr="openbox"
			;;
		"x")
			# mstr="startxfce4"
			mstr="xmonad-session"
			;;
		"f")
			mstr="startfluxbox"
			;;
		"l")
			mstr="lxde"
			;;
		"i")
			mstr="i3"
			;;
		*)
			mstr="awesome"
			;;
	esac
elif [ $# -eq 2 ] # 直接启动X后连接命令，输入模式 ms -t startfluxbox
then
	while getopts ":t:" optname
	do
		if [ ${optname} = "t" ]
		then
			mstr=$OPTARG
		else
			echo "input Error"
			exit 0
		fi
	done
fi
# echo "sed -i '\$s/^.*$/exec "${mstr}"/' ~/.xinitrc"
eval "sed -i '\$s/^.*$/exec "${mstr}"/' ~/.xinitrc"
startx
