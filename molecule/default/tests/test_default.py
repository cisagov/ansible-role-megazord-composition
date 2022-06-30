"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize(
    "f", ["/tools/SourcePoint/out.profile", "/tools/cs2modrewrite/.htaccess"]
)
def test_files(host, f):
    """Test that expected files were created and are non-empty."""
    assert host.file(f).exists
    assert host.file(f).is_file
    assert host.file(f).content
    if f == ".htaccess":
        assert "[P,L]" not in host.file(f).content_string
