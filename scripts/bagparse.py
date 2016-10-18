#!/usr/bin/python
import rosbag
import matplotlib.pyplot as plt
import os
import sys
import collections
import numpy as np
import math
import matplotlib.cm as cm
from collections import defaultdict


def get_topics_from_bag(list_o_topics, filename, max_t=None, is_epoch=False):
    this_result = {}
    for topic in list_o_topics:
        this_result[topic] = []
    bag = rosbag.Bag(filename)
    first_time = None
    slashed_topics = ['/' + x for x in list_o_topics]
    for topic, msg, t in bag.read_messages(topics=slashed_topics):
        if first_time == None:
            first_time = t.to_sec()
        if (is_epoch):
            this_time = t.to_sec()
            delta_time = t.to_sec() - first_time
        else:
            this_time = t.to_sec() - first_time
            delta_time = this_time
        if max_t != None and delta_time > max_t:
            return this_result
        this_element = {}
        this_element['t'] = this_time
        this_element['msg'] = msg
        this_result[topic[1:]].append(this_element)

    return this_result


if __name__ == '__main__':
    filename = sys.argv[1]
    print filename

    topics = sys.argv[2:]

    all_msgs = get_topics_from_bag(topics, filename, max_t=None)

    num_items = 0
    total_size = 0.0
    elapsed_time = 0.0

    topicsize = defaultdict(float)

    for key,m in all_msgs.items():
        if elapsed_time == 0.0:
            mintime = 1000000000
            maxtime = -1000000000
            for i in range(len(m)):
                mintime = min(mintime, m[i]['t'])
                maxtime = max(maxtime, m[i]['t'])
            elapsed_time = maxtime - mintime

        for d in m:
            times = d['t']
            msgs = d['msg']
            print key, type(msgs)
            topicsize[key] += sys.getsizeof(msgs)

    # print elapsed_time
    for key,size in topicsize.items():
        print "{:70s} {:10.3f} KB/s".format(key, size/elapsed_time/1000.0)


