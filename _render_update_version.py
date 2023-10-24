import os
import subprocess
import warnings

def git_rev(short=True):
    """Returns the git revision.
    """
    cmd = ["git", "rev-parse"]
    if short:
        cmd.append("--short")
    cmd.append("HEAD")
    return subprocess.check_output(cmd).decode("utf-8").strip()

def git_branch_rev_count(branch):
    """Count the number of revisions on branch 'branch'.
    """    
    return int(subprocess.check_output(["git","rev-list",branch,"--count"]).decode("utf-8").strip())

def git_current_branch():
    """Return the name of the current branch."""
    return subprocess.check_output(["git","branch","--show-current"]).decode("utf-8").strip()

def replace_version_placeholders(file_content: str) -> str:
    return file_content.format(
        ROCM_LLVM_PYTHON_VERSION_SHORT=git_branch_rev_count(git_current_branch()),
        ROCM_LLVM_PYTHON_VERSION=git_branch_rev_count(git_current_branch()),
        ROCM_LLVM_PYTHON_BRANCH=git_current_branch(),
        ROCM_LLVM_PYTHON_REV=git_rev(),
    )

def map_hip_version_to_rocm_release(file_content: str, line_indicator: str) -> str:
    result = ""
    for line in file_content.splitlines(keepends=True):
        if line.startswith(line_indicator):
            for key in HIP_TO_ROCM:
                if key in line:
                    line = line.replace(key+".",HIP_TO_ROCM[key]+".")
        result += line
    return result

# render read _version.py (requires git)
def render_version_py(parent_dir: str):
    with open(os.path.join(parent_dir,"_version.py.in"),"r"
        ) as infile, open(os.path.join(parent_dir,"_version.py"),"w") as outfile:
        rendered:str = replace_version_placeholders(infile.read())
        outfile.write(rendered)

if __name__ == "__main__":
    render_version_py(os.path.join("rocm-llvm-python","rocm","llvm"))
