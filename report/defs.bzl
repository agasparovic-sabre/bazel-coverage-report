# Copyright 2018 The Bazel Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Coverage report generation."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

_LCOV_BUILD_FILE_CONTENT = """
filegroup(
    name = "bin",
    srcs = glob(["bin/**/*"]),
    visibility = ["//visibility:public"],
)
"""

def bazel_coverage_report_repositories():
  """Add to the WORKSPACE external dependencies needed by the generator.
  """
  maybe(
      http_archive,
      name = "lcov",
      build_file_content = _LCOV_BUILD_FILE_CONTENT,
      urls = ["https://github.com/linux-test-project/lcov/archive/v1.14.tar.gz"],
      strip_prefix = "lcov-1.14",
      sha256 = "f19eff1dcf5f40f4a57d959584acd318155873c43d723e25dd1b91636f94ca41",
  )
