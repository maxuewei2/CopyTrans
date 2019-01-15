# encoding=utf-8
import sys
import re

txt = sys.argv[1]
#print '%r' %txt
txt = re.sub(r'-\n', '', txt)
txt = re.sub(r'\xe2\x80\x90\n', '', txt)
txt = re.sub(r'\n+', ' ', txt)
print txt
