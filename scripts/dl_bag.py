#!/usr/bin/python
import sys
import dateutil.parser
import datetime
from subprocess import call
from os.path import expanduser, isfile
import os
import glob

"""Download a bag of an entire drive

Will download individual 60-second bags from bagstore and
merge them. Individual bags and merged bags placed in current dir.

usage:
    dl_bag.py <minutes> <bcli cmd from drives app>

    minutes: length of entire drive, in minutes
"""

minutes = int(sys.argv[1])

fields = dict(zip(sys.argv[3::2], sys.argv[4::2]))

time = dateutil.parser.parse(fields["--start"])

# Generate bags at 60 second intervals
delta = datetime.timedelta(minutes=1)
fields["--duration"] = "60"
# fields["--topic"] = "/system* --topic /watchdog/diagnostics*"
fields["--topic"] = "/roscpp/sub_drop_stats --topic /roscpp/pub_drop_stats --topic /roscpp/callback_queue_stats"
# fields["--rate"] = "0.2"

for i in xrange(minutes):
    bag_cmd = sys.argv[2]
    for key,val in fields.iteritems():
        bag_cmd += ' '
        bag_cmd += key + ' ' + val

    print bag_cmd
    call(bag_cmd.split())

    time += delta
    fields["--start"] = time.isoformat()[:-6] + '.000Z'

output_filename = "merged.bag"
if isfile(output_filename):
    os.unlink(output_filename)

bag_files = glob.glob("*.bag")
merge_cmd = expanduser("~") + "/cruise/ros/scripts/rosbag_merge.py " + output_filename + ' ' + ' '.join(bag_files)
call(merge_cmd.split())
