#!/usr/bin/python

from earth_projections import *
import sys
import json
from pprint import pprint

if len(sys.argv) != 2:
    print 'usage: {} <filename>'.format(sys.argv[0])
    print ' where filename has a list of cruise points:'
    print '''
    {
        "points" : [
            {"x" : -91.527490711082805, "y" : 342.05788029777631},
            {"x" : -90.343562910964934, "y" : 340.67248329617416},
            {"x" : -89.635765717901862, "y" : 339.55226520357775},
            {"x" : -89.314859335287224, "y" : 338.89700180739169},
            {"x" : -89.05433612510663, "y" : 337.79789174468095},
            {"x" : -89.14540762687605, "y" : 336.63449258517835},
            {"x" : -89.432004974638701, "y" : 335.8899321182501},
            {"x" : -89.870694515254883, "y" : 335.15306435128883},
            {"x" : -90.743492019322304, "y" : 334.0138573113291}
        ]
    }'''
    sys.exit(1)

CITY = SAN_FRANCISCO
filename = sys.argv[1]

with open(filename, 'r') as f:
    data = json.load(f)

# pprint(data)

global_pts = []
for pt in data["points"]:
    x = pt["x"]
    y = pt["y"]
    global_pts.append(cruise_UTM_to_global_UTM(x, y, city=CITY))

# Format into LINESTRING WKT string
linestr = "LINESTRING("
for pt in global_pts[:-1]:
    x, y = pt
    linestr += '{} {},'.format(x, y)

# last point
x, y = global_pts[-1]
linestr += '{} {}'.format(x, y)
linestr += ")"

print linestr
