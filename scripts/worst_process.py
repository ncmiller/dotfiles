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


def flatten_msg(msg, cur_str=None):
    result = []
    if cur_str == None:
        cur_str = ''
    if hasattr(msg, '__slots__'):
        for x in msg.__slots__:
            result.extend(flatten_msg(getattr(msg, x), cur_str + '/' + str(x)))
    elif isinstance(msg, list):
        for i, thing in enumerate(msg):
            result.extend(flatten_msg(thing, cur_str + '[' + str(i) + ']'))
    else:
        result = [(cur_str, msg)]
    return result


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


def vectorize_message(messages):
    t, msg_vect = zip(*[(x['t'], x['msg']) for x in messages])
    return t, msg_vect


def get_data_from_message(messages,
                          this_name=None,
                          show_fields=None,
                          hide_fields=None):
    t, y, l = get_flat_data_from_message(messages, this_name)
    if show_fields != None:
        # t, y, l = [ (this_t,this_y,this_l) for this_t, this_y, this_l in zip(t,y,l) if any (s in this_l for s in show_fields) ]
        cheese = [(this_y, this_l) for this_y, this_l in zip(y, l)
                  if any(s in this_l for s in show_fields)]
        y, l = zip(*cheese)
    if hide_fields != None:
        cheese = [(this_y, this_l) for this_y, this_l in zip(y, l)
                  if all(s not in this_l for s in hide_fields)]
        y, l = zip(*cheese)

    return t, y, l


def get_flat_data_from_message(messages, this_name=None):
    if this_name == None:
        this_name = ''
    times, messages = vectorize_message(messages)
    result = None
    for msg in messages:
        msg_data = flatten_msg(msg, this_name)
        label, raw_data = zip(*msg_data)
        if result == None:
            result = [raw_data]
        else:
            result.append(raw_data)
    return times, zip(*result), label


def node_name(name, cmd):                              
    node_name = name
                                                       
    if 'nodelet' in node_name or 'python' in node_name:
        try:                                           
            for field in cmd.split():               
                if '__name' in field:                  
                    node_name = field.split(':=')[1]   
                    break                              
        except IndexError:                             
            pass                                       
                                                       
    return node_name                                   

class process_data:
    name = ''
    pid = ''
    cpu_percentages = None
    stats = []


if __name__ == '__main__':
    filename = sys.argv[1]
    print filename

    # proc_topic = 'system/processes/top16'
    proc_topic = 'system/processes/all'

    system_cpu = 'system/cpu/utilization'

    topics = [proc_topic, system_cpu]
    all_msgs = get_topics_from_bag(topics, filename, max_t=None)

    proc_dicts = all_msgs[proc_topic]
    system_dicts = all_msgs[system_cpu]

    times = [d['t'] for d in proc_dicts]
    msgs = [d['msg'] for d in proc_dicts]

    # Dictionary of cpu%, key is name, val is list cpu%
    process_cpu_percent = defaultdict(process_data)

    # Sort by timestamp
    times, msgs = zip(*sorted(zip(times, msgs), key = lambda x: x[0]))

    # one message == one sample of proc_topic
    for m,t in zip(msgs, times):
        procs = flatten_msg(m)
        for field,val in procs:
            if 'pid' in field:
                ppid = val
            if 'name' in field:
                pname = val
            if 'cpu_percent' in field:
                pcpu = val
            if 'mem_percent' in field:
                pmem = val
            if 'cmdline' in field:
                pcmd = val
                
                # We have all the fields for a single process, so update dict
                if not process_cpu_percent[ppid].cpu_percentages:
                    process_cpu_percent[ppid].cpu_percentages = []

                process_cpu_percent[ppid].name = node_name(pname, pcmd)
                process_cpu_percent[ppid].pid = ppid
                process_cpu_percent[ppid].cpu_percentages.append(pcpu)

    _,processes = zip(*process_cpu_percent.items())

    for p in processes:
        p.stats = []
        a = np.array(p.cpu_percentages)
        p.stats += [np.min(a), np.max(a), np.mean(a), np.std(a)]

    processes = sorted(processes, key = lambda p: p.stats[2], reverse=True)

    print "{:8s} {:8s} {:8s} {:8s} {}".format("min","max","mean","std","Name")
    print "-----------------------------------------------"

    for p in processes:
        print "{:8.3f} {:8.3f} {:8.3f} {:8.3f} {:8s}".format(p.stats[0], p.stats[1], p.stats[2], p.stats[3], p.name)

    # Compute min,mean,max,stddev of CPU utilization values
    times = [d['t'] for d in system_dicts]
    msgs = [d['msg'] for d in system_dicts]

    usages = []
    for m,t in zip(msgs, times):
        usage = flatten_msg(m)
        usages.append(usage[0][1])

    a = np.array(usages)
    print "{:8.3f} {:8.3f} {:8.3f} {:8.3f} {}".format(
        np.min(a), np.max(a), np.mean(a), np.std(a), "system")

    # print times

