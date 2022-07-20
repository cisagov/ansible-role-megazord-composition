"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

# import socket


testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize(
    "image",
    [
        "xvxd4sh/coredns:latest",
        "xvxd4sh/apache2:latest",
    ],
)
def test_docker_images_pulled(host, image):
    """Test that the Docker images used by the Megazord Docker composition are present."""
    assert image in host.check_output(
        "docker images --format='{% raw %}{{.Repository}}:{{.Tag}}{% endraw %}'"
    )


@pytest.mark.parametrize("f", ["/lib/systemd/system/megazord-composition.service"])
def test_htaccess_file(host, f):
    """Test that the megasord-composition service file was created and is non-empty."""
    assert host.file(f).exists
    assert host.file(f).is_file
    assert host.file(f).content
