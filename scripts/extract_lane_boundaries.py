#!/usr/bin/python
import os
import sys
import yaml
from jinja2 import Template

t = Template("""import copy

from planning_msgs.msg import LaneBoundariesMsg, RoadPoint
from geometry_msgs.msg import Point


def generateFakeExpertPath():
    expert_boundaries_msg = LaneBoundariesMsg()
    rp = RoadPoint()
    p = Point()
    {% if center %}
    # CENTER
    rp.type = 5
    rp.left_boundary_type = 12
    rp.right_boundary_type = 12
    rp.left_passable = rp.VIOLATE_BOUNDARY_STRICT
    rp.right_passable = rp.VIOLATE_BOUNDARY_STRICT
    {% for point in center %}
    rp.point.x = {{point['point']['x']}}
    rp.point.y = {{point['point']['y']}}
    expert_boundaries_msg.center_line.append(copy.deepcopy(rp))
    {% endfor %}
    {% endif %}
    # LEFT BOUNDARIES
    {% for point in left %}
    p.x = {{point['x']}}
    p.y = {{point['y']}}
    expert_boundaries_msg.left_boundary.append(copy.deepcopy(p))
    {% endfor %}
    # RIGHT BOUNDARIES
    {% for point in right %}
    p.x = {{point['x']}}
    p.y = {{point['y']}}
    expert_boundaries_msg.right_boundary.append(copy.deepcopy(p))
    {% endfor %}
    return expert_boundaries_msg""")


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Extracts expert mode lane boundaries from file containing the output of:'
        print '   rostopic echo /expert_mode/modified_lane_boundaries > /tmp/modified.txt'
        print ''
        print 'usage: ./{} <filename>'.format(os.path.basename(sys.argv[0]))
        sys.exit(1)

    modified_boundaries_file = sys.argv[1]

    with open(modified_boundaries_file, 'r') as stream:
        try:
            docs = [doc for doc in yaml.load_all(stream) if doc != None]
            modified_boundaries = docs[-1]
        except yaml.YAMLError as exc:
            print(exc)

    center = modified_boundaries['center_line']
    left = modified_boundaries['left_boundary']
    right = modified_boundaries['right_boundary']

    generated_python = t.render(center=center, left=left, right=right)
    for line in generated_python.splitlines():
        print line.rstrip() # trim any trailing spaces
