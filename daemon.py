import time
import subprocess

while True:
    print "waking up"

    try:
        print "executing galileo"

        p = subprocess.Popen("galileo", stdout=subprocess.PIPE, shell=True)
        (output, err) = p.communicate()

        print output
    except:
    	e = sys.exc_info()[0]

        print "ERROR: exception occurred"
        print "ERROR: " % e

    print "sleeping for 120 seconds"
    time.sleep(120)
