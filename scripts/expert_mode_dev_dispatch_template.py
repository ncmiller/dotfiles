#! /usr/bin/env python

import rospy
from os import path
import sys
import time

from std_msgs.msg import Bool, String, Empty

from simulator import Simulator
from simulator.launcher import Launcher
from semantic_database import SemanticDatabase
from simulator.spawn_utils import SpawnUtils


# This is a list of connected semantic lane ids.
# We will verify that it is a valid path later.
OUR_ROUTE = [29992, 41113, 29989]


def get_sim_flags():
    flags = ''
    flags += ' policy_predictor:=true'
    flags += ' advanced_vehicle_model:=false'
    flags += ' allow_dpv_lane_redrawing:=true'
    flags += ' watchdog_yaml:=watchdog_sim_expert_mode.yaml'
    flags += ' all_green:=true'
    return flags


def get_local_expert_flags():
    flags = ''
    flags += ' expert_mode_client_enable:=true'
    flags += ' expert_mode_control_endpoint:="ws://expert-mode-dev.robot.car/client_registration"'
    return flags


def initialize_simulator(route):
    sim_flags = get_sim_flags()
    expert_flags = get_local_expert_flags()

    '''
    Launches the sim and sets up the world.
    '''
    launch_planning = Launcher('simulator', 'planning_stack.launch', sim_flags)
    launch_local_expert = Launcher('expert_mode', 'local_expert_mode.launch', expert_flags)

    # Take the filename and drop '*.py', this is our node name
    simulator = Simulator(
        path.basename(__file__)[:-3],
        launchers=[launch_planning, launch_local_expert])

    spawn_utils = SpawnUtils(simulator)

    # Spawn our car near the start of the intersection
    # Spawn dpv across the intersection
    with SemanticDatabase() as db:
        db.validate_route(route)
        start_x, start_y, start_angle = db.get_point_in_lane(route[0])
        dpv_x, dpv_y, _ = db.point_interpolated_along_lane(route[2], 0.02)

    # dpv_theta = spawn_utils.get_parked_car_heading((dpv_x, dpv_y), 270)
    dpv_theta = spawn_utils.get_parked_car_heading((dpv_x, dpv_y), 0)

    cruise_robot = simulator.spawn_cruise_robot(start_x, start_y, 0, start_angle)
    simulator.spawn_robot(x=dpv_x, y=dpv_y, theta=dpv_theta)

    # Now tell our robot what route to follow
    cruise_robot.brain.set_lane_plans([(1000.0, route)])

    return simulator, cruise_robot


def main():
    # Call the sim set-up function
    simulator, cruise_robot = initialize_simulator(OUR_ROUTE)

    pub_vin = rospy.Publisher("/vin", String, queue_size=1)

    time.sleep(1.0)

    # pub_enable_video.publish(True)
    pub_vin.publish("00000000000000000")

    # Run the simulator to watch everything go down.
    # You must return this, otherwise the regression tests will not work.
    return simulator.run()

if __name__ == '__main__':
    sys.exit(0 if main() else -1)
