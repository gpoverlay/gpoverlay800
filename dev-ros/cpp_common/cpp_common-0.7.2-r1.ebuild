# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
ROS_REPO_URI="https://github.com/ros/roscpp_core"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="C++ code for doing things that are not necessarily ROS related"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/console_bridge:=
	dev-libs/boost:="
DEPEND="${RDEPEND}"
