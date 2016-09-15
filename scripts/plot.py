#!/usr/bin/python
import sys
import csv
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import matplotlib
from sympy import *

def parse_logfile(filename):
    global secs, ppm_err, int_err, pps_err, ppm_adjust, fixed_offset, locked, secs, nsecs
    with open(filename, 'r') as f:
        r = csv.reader(f)
        d = list(r)
    secs = [int(x[0])-1 for x in d]
    ppm_err = [float(x[1]) for x in d]
    int_err = [float(x[2]) for x in d]
    pps_err = [int(x[3]) for x in d]
    ppm_adjust = [float(x[4]) for x in d]
    fixed_offset = [float(x[5]) for x in d]
    lock = [int(x[6]) for x in d]
    secs = [int(x[7]) for x in d]
    nsecs = [int(x[8]) for x in d]

def parse_offsets(filename):
    global host_ref_offset, host_target_offset
    with open(filename, 'r') as f:
        r = csv.reader(f)
        d = list(r)

    host_ref_offset = [float(x[0]) for x in d]
    host_target_offset = [float(x[1]) for x in d]

    # host_target_offset = [float(x[0]) for x in d]


def testcase1():
    m,b = np.polyfit(secs, ppm_err, 1)
    adjusted_ppm_err = [ppm_err[i] - (m*i) - b for i in range(len(ppm_err))]
    diffs = np.diff(np.array(ppm_err))

    # positive ppm means higher freq, shorter period, faster than reference
    plt.title('Clock accuracy, no clock correction')
    plt.xlabel('seconds since boot')
    plt.ylabel('Offset (ppm)')
    plt.plot(secs, ppm_err, 'r.', label='freq offset (ppm)')
    plt.plot(secs, adjusted_ppm_err, 'g.', label='freq offset - t*' + str(round(m,3)) + ' (ppm)')
    plt.annotate('lin fit: y = ' + str(round(m,3)) + 'x + ' + str(round(b,3)), 
        xy=(.6, .6), xycoords='axes fraction')
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

    # Oscillator changes with temp/voltage
    plt.title('Non-linearity of ppm error')
    plt.xlabel('seconds since boot')
    plt.ylabel('Offset (ppm)')
    plt.plot(secs, adjusted_ppm_err, 'g.', label='freq offset - t*' + str(round(m,3)) + '-' + str(round(b,3)))
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

    plt.title('Clock accuracy finite differences')
    plt.xlabel('seconds since boot')
    plt.ylabel('Offset (ppm)')
    plt.plot(secs[1:], diffs, 'b.')
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

def testcase2():
    plt.title('Clock accuracy, with clock corrections')
    plt.xlabel('seconds since boot')
    plt.plot(secs, ppm_err, '.r-', label='freq offset (ppm)')
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

    h = sorted(ppm_err)
    hmean = np.mean(h)
    hstd = np.std(h)
    pdf = stats.norm.pdf(h, hmean, hstd)
    print hmean, hstd

    plt.title('Generated PPS jitter')
    plt.xlabel('ppm offset')
    plt.plot(h, pdf)
    plt.show()
    plt.gcf().clear()

def testcase3_4():
    plt.title('GPS dropout')
    plt.xlabel('seconds since boot')
    plt.plot(secs, ppm_err, 'r.', label='freq offset (ppm)')
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

def testcase5():
    samples = range(len(host_target_offset))

    # plt.title('Offset of linux time vs. NTP server time')
    # plt.xlabel('# Samples')
    # plt.plot(samples, host_ref_offset, 'r-', label='client/server offset')
    # plt.legend(fontsize=8)
    # plt.show()
    # plt.gcf().clear()

    # plt.title('Offset of linux time vs. IF board time')
    # plt.xlabel('# Samples')
    # plt.plot(samples, host_target_offset, 'b-', label='host/target offset')
    # plt.legend(fontsize=8)
    # plt.show()
    # plt.gcf().clear()

    # previous two plots in one
    plt.title('Offset of linux time vs. IF board time')
    plt.xlabel('# Samples')
    plt.plot(samples, host_ref_offset, 'b-', label='host/ntp offset')
    plt.plot(samples, host_target_offset, 'r-', label='host/target offset')
    plt.legend(fontsize=8)
    plt.show()
    plt.gcf().clear()

    diff = [(host_ref_offset[i] - host_target_offset[i]) for i in range(100,len(host_target_offset))]
    h = sorted(diff)
    hmean = np.mean(h)
    hstd = np.std(h)
    pdf = stats.norm.pdf(h, hmean, hstd)
    print hmean, hstd

    plt.title('Distribution of offset between ntp/IF board')
    plt.xlabel('offset')
    plt.plot(h, pdf)
    plt.show()
    plt.gcf().clear()

if __name__ == '__main__':
    font = {'family' : 'serif', 'weight' : 'normal', 'size' : 12}
    matplotlib.rc('font', **font)

    # parse_logfile(sys.argv[1])
    parse_offsets(sys.argv[1])

    # testcase1()
    # testcase2()
    # testcase3_4()
    testcase5()