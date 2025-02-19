# MIT License
#
# Copyright (c) 2023-2025 Advanced Micro Devices, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess


def git_rev(short=True):
    """Returns the git revision."""
    cmd = ["git", "rev-parse"]
    if short:
        cmd.append("--short")
    cmd.append("HEAD")
    return subprocess.check_output(cmd).decode("utf-8").strip()


def git_branch_rev_count(branch):
    """Count the number of revisions on branch 'branch'."""
    return int(
        subprocess.check_output(["git", "rev-list", branch, "--count"])
        .decode("utf-8")
        .strip()
    )


def git_current_branch():
    """Return the name of the current branch."""
    return (
        subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"])
        .decode("utf-8")
        .strip()
    )


def replace_version_placeholders(file_content: str) -> str:
    return file_content.format(
        VERSION_SHORT=git_branch_rev_count(git_current_branch()),
        VERSION=git_branch_rev_count(git_current_branch()),
        BRANCH=git_current_branch(),
        REV=git_rev(),
    )


# render read _version.py (requires git)
def render_version_py(parent_dir: str):
    with open(os.path.join(parent_dir, "_version.py.in"), "r") as infile, open(
        os.path.join(parent_dir, "_version.py"), "w"
    ) as outfile:
        rendered: str = replace_version_placeholders(infile.read())
        outfile.write(rendered)


if __name__ == "__main__":
    render_version_py(os.path.join("rocm-llvm-python", "rocm", "llvm"))
    render_version_py(os.path.join("rocm-llvm-python", "rocm", "amd_comgr"))
