#!/usr/bin/env python

"""Download the metrics baofile associated with a specific test_id"""

import requests
import sys
import os

from pipes import quote

test_id = sys.argv[1]
urls = requests.get(
    "https://spacestore.robot.car/api/v1/generate-bag-download-url",
    params={"testid": test_id})

baofiles = []
for (filename, url) in urls.json().iteritems():
    baofiles.append(quote(filename))
    os.system("wget %s -O %s" % (quote(url), quote(filename)))

os.system("rosrun bao bao2bag %s %s.bag" % (' '.join(baofiles), test_id))
