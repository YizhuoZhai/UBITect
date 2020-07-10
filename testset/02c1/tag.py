import sys
import os.path
import os

file_abs = "/data/home/yizhuo/UBIAnalysis/test--new"
for dirpath, dirnames, filenames in os.walk("/data/home/yizhuo/UBIAnalysis/allyes-lll-414"):
    for filename in filenames:
        if os.path.splitext(filename)[1] == ".llbc":
	    newfile = os.path.splitext(filename)[0] +".bc"
	    current = os.path.join(dirpath, filename)
            module = os.path.join(dirpath, newfile)
	    cmd = "opt -load /data/home/yizhuo/llvm-7.0.0/build-dbg/lib/myHellolib.so -myhello "+ current+" >>"+ module
            os.system(cmd)
