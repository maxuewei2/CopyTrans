# CopyTrans

在 Linux 下复制文本并翻译，以系统通知显示翻译结果。

## 效果
![](SC.gif)

## 安装
安装 xsel 或 xclip
```bash
sudo apt install xsel xclip
```
安装 [notify-send](https://github.com/vlevit/notify-send.sh)
```bash
sudo apt install notify-send
```
安装 [translate-shell](https://github.com/soimort/translate-shell)



新建 [copytrans.sh](https://github.com/maxuewei2/CopyTrans/blob/master/copytrans.sh) 文件，将以下代码复制进该文件中。

```bash
#!/usr/bin/env bash

# Need https://github.com/soimort/translate-shell installed.
# Need xsel or xclip installed.
# Need notify-send installed.
# Need python2 installed

se=$(xsel -b -n -o) # xclip -selection clipboard -o
se=$(python2 /path-to-CopyTrans/pre_text.py "$se")
re=$(trans -b en:zh "$se")  # the 'trans' command is the installed translate-shell.
notify-send "$se" "$re" -i accessories-dictionary -t 2000
```
将其中的`/path-to-CopyTrans`修改为 CopyTrans 所在的路径。
```bash
chmod a+x copytrans.sh
```

在系统快捷键设置中添加执行此脚本的快捷键。



## 使用

选中词或句子，按 Ctrl+C 复制，按设定的快捷键运行翻译脚本显示翻译。
