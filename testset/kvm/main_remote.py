#!/usr/bin/python
import os.path
import sys

linkfile = open("linkfail.txt", "a")
timeout = open("timeout.json", "a")
checkedJson = open("checked.json", "a")
failfile = open("kleefail.txt", "a")
tempfile = open("tmp.txt", "a")
def main():
        filename = sys.argv[1]
        infile = open(filename)
        num = filename[6:9]
        if not os.path.exists(num):
                os.makedirs(num)
        bcline = infile.readline()
        while bcline:
                bclist = bcline.replace(":\n", "")
                bclist = bclist.split(":")
                cmd = "llvm-link -o " + num+"/built-in.bc"
                for bc in bclist:
                        cmd = cmd + " " + bc
                tempfile.write(cmd)
                tempfile.write("\n")
                ret = os.system(cmd)
                if ret != 0:
                        #print "linking failed.\n"
                        linkfile.write(bcline)
                        linkfile.write("\n")
                        jsonline = infile.readline()
                        linkfile.write(jsonline)
                        linkfile.write("\n")
                        bcline = infile.readline()
                        continue
                else:
                        jsonline = infile.readline()
                        jsonline = jsonline.replace("\n", "")
                        cmd = "timeout 1800 /data/home/yizhuo/klee/2018_klee_confirm_path/build/bin/klee -json=\'" + jsonline + "\' "+num+"/built-in.bc 2>&1 | tee >> confirm_result.log"
                        status = os.system(cmd)
                        #print "status: "+str(status)
                        if status == 124:
                               timeout.write(jsonline)
                               timeout.write("\n")
                        elif status != 0:
                                failfile.write(jsonline)
                                failfile.write("\n")
                        else:
                                checkedJson.write(jsonline)
                                checkedJson.write("\n")
                        #print line+" already checked\n"
                        tempfile.write(cmd)
                        tempfile.write("\n")
                        bcline = infile.readline()
        linkfile.close()
        timeout.close()
        checkedJson.close()

if __name__ == "__main__":
        main()
