# CopyTrans

在 Linux 下复制文本并翻译，以系统通知显示翻译结果。

## 效果
![](SC.gif)

## 安装

安装 xsel 或 xclip
```bash
sudo apt install xsel xclip
```

安装 notify-send 
```bash
# 方式1
sudo apt install notify-send

# 方式2
sudo apt install libnotify-bin

# 方式3
# 使用 https://github.com/vlevit/notify-send.sh
```

安装 [translate-shell](https://github.com/soimort/translate-shell)
```bash
wget git.io/trans
chmod +x ./trans
```

新建 [copytrans.sh](https://github.com/maxuewei2/CopyTrans/blob/master/copytrans.sh) 文件，将以下代码复制进该文件中。

```bash
#!/usr/bin/env bash

# Need https://github.com/soimort/translate-shell installed.
# Need xsel or xclip installed.
# Need notify-send or libnotify-bin installed.

curdir=`dirname $0`

selected=`xsel -b -n -o` # xclip -selection clipboard -o
selected=`printf "$selected" | tr -d '\r' | sed 's/-$//g' | tr -d '\n'`
translated=`${curdir}/trans -e bing -b en:zh "$selected"`  # the 'trans' command is the installed translate-shell.
notify-send "$selected" "$translated" -t 2000
```

```bash
chmod a+x copytrans.sh
```

在系统快捷键设置中添加执行此脚本的快捷键。



## 使用

选中词或句子，按 Ctrl+C 复制，按设定的快捷键运行翻译脚本显示翻译。
