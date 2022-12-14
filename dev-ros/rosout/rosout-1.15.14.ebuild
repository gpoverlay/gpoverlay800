# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros/ros_comm"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=tools/${PN}

inherit ros-catkin

DESCRIPTION="System-wide logging mechanism for messages sent to the /rosout topic"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/roscpp
"
DEPEND="${RDEPEND}
	dev-ros/rosgraph_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
"
