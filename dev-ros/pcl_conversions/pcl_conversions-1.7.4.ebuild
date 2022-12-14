# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
ROS_REPO_URI="https://github.com/ros-perception/perception_pcl"
ROS_SUBDIR=${PN}
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Provides conversions from PCL data types and ROS message types"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/roscpp
	sci-libs/pcl:=
"
DEPEND="${RDEPEND}
	dev-ros/pcl_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
	dev-ros/std_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
	dev-ros/sensor_msgs[${CATKIN_MESSAGES_CXX_USEDEP}]
	dev-cpp/eigen:3
	test? ( dev-cpp/gtest )"
