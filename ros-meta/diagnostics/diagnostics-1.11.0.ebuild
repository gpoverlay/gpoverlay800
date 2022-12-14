# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
ROS_REPO_URI="https://github.com/ros/diagnostics"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="Packages related to gathering, viewing, and analyzing diagnostics data"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/diagnostic_aggregator
	dev-ros/diagnostic_analysis
	dev-ros/diagnostic_common_diagnostics
	dev-ros/diagnostic_updater
	dev-ros/rosdiagnostic
	dev-ros/self_test
	dev-ros/test_diagnostic_aggregator
"
DEPEND="${RDEPEND}"
