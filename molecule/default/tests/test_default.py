"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os
import re

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize("f", ["/tools/Megazord-Composition/src/apache2/.htaccess"])
def test_htaccess_file(host, f):
    """Test that expected htaccess file was created and is non-empty."""
    assert host.file(f).exists
    assert host.file(f).is_file
    assert host.file(f).content
    assert "[P,L]" not in host.file(f).content_string


@pytest.mark.parametrize("d", ["/tools/SourcePoint"])
def test_sourcepoint_profile(host, d):
    """Test that the expected sourcepoint profile was created and is not empty."""
    # First test if SourcePoint directory exists
    assert host.file(d).exists
    assert host.file(d).is_directory
    dirContents = host.file(d).listdir()
    assert dirContents

    # Iterate of directory contents to ensure at least 1 file is present
    # matching the scheme below
    scheme = r"SourcePoint-\d{4}-\d{2}-\d{2}.profile"
    match = [file for file in dirContents if re.match(scheme, file)]
    assert len(match) > 0
    profile = "{}/{}".format(d, match[0])
    assert host.file(profile).exists
    assert host.file(profile).is_file
    assert host.file(profile).content
