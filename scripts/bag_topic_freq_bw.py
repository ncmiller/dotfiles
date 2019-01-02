#!/usr/bin/python
import sys
import yaml
import subprocess
from rosbag.bag import Bag
from collections import defaultdict

"""Extract per-topic frequency and bandwidth information from a bag"""


def bag_du_stats(bagfile):
    topic_mbytes = defaultdict(float)

    cmd = 'rosrun bag_du bag_du {}'.format(bagfile).split(' ')
    p = subprocess.Popen(cmd,
                         stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE)
    out, err = p.communicate()

    lines = out.split('\n')
    for line in lines:
        if len(line) == 0 or line[0] != '/': # only want lines with topics
            continue
        topic, total_mbytes = line.split()[:2]
        total_mbytes = total_mbytes[:-2] # drop the 'MB' at the end
        topic_mbytes[topic] = float(total_mbytes)

    return topic_mbytes


if __name__ == '__main__':
    filename = sys.argv[1]
    print filename

    print "Extracting topic bandwidths..."
    topic_mbytes = bag_du_stats(filename)

    print "Extracting topic frequencies"
    info_dict = yaml.load(Bag(filename, 'r')._get_yaml_info())
    duration = float(info_dict['duration'])

    print 'Duration = {:.3f} s'.format(duration)

    format_str = "{:60}  {:>10}  {:>13}  {:>10}  {:>4s}  {}"
    print format_str.format("Topic", "Freq", "BW (MBps)", "# Msgs", "Per?", "Type")
    print '-' * 120

    for topic in info_dict['topics']:
        topicname = topic['topic']
        if topic['messages'] == 1:
            frequency = "{:10.3f}".format(1.0 / duration)
        else:
            frequency = topic['frequency']

        if topicname in topic_mbytes:
            bw = topic_mbytes[topicname] / duration
        else:
            bw = 0.0
        bw = "{:>13.6f}".format(bw)

        expected_msgs = float(frequency) * duration

        # Detect if this topic is regular and periodic
        periodic = True
        if (expected_msgs < 0.95 * int(topic['messages'])) or \
           (expected_msgs > 1.05 * int(topic['messages'])):
            periodic = False

        print format_str.format(topicname[:60],
                                frequency,
                                bw,
                                topic['messages'],
                                "Y" if periodic else "N",
                                topic['type'])

    print '-' * 120
    print "Total BW (MBps) = {:10.3f}".format(sum(topic_mbytes.values()) / duration)
