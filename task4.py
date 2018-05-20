import psutil,datetime
import sys

if len(sys.argv)<2:
	print "No Process ID Given"
	exit(0)
try:
	for i in sys.argv[1:]:
		pid=int(i)
		p=psutil.Process(pid)
		ppid=p.ppid()

		print "Process ID : {}".format(pid)
		print "Process Name : {}".format(p.name())
		print "Process Status : {}".format(p.status())

		print "Process PPID : {}".format(p.ppid())
		print "Process Parent Name : {}".format(psutil.Process(ppid).name())

		print "Process Creation Time : {}".format(datetime.datetime.fromtimestamp(p.create_time()).strftime("%Y-%m-%d %H:%M:%S"))

		print "Files Opened by the Process : "
		print p.open_files()

		print "Memory Info : "
		print p.memory_info()
		print '\n'
except Exception,e:
	print e
