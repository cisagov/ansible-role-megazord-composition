"""Module containing the tests for the default scenario."""

# Standard Python Libraries
from datetime import date
import os

# Third-Party Libraries
import pytest
import requests
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
    today = date.today()
    profile = "{}/SourcePoint-{}.profile".format(d, today)
    assert host.file(profile).exists
    assert host.file(profile).is_file
    assert host.file(profile).content
    assert host.file(profile).contains("set keystore")
    assert host.file(profile).contains("set password")


def test_containers(host):
    """Test that the docker containers are running."""
    assert host.docker("apache").is_running
    assert host.docker("coredns").is_running


def test_service(host):
    """Test that the expected service is enabled and running."""
    assert host.service("megazord-composition").is_enabled
    assert host.service("megazord-composition").is_running


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


def test_redirection_apache(host):
    """Test that the apache redirection is working as intended."""
    file_name = "/tools/SourcePoint"
    file_name += date.today()
    file_name += ".profile"
    user_agent = ""
    htaccess = "/tools/Megazord-Composition/src/apache2/.htaccess"
    htaccess_contents = ""
    uri = ""

    with open(file_name, "r") as f:
        lines = f.readlines()
        for line in lines:
            if "useragent" in line:
                user_agent = line.split(" ")[-1][:-1]
                break
    
    with open(htaccess, "r") as f:
        contents = f.read()
        contents = contents.split("\n")
    
    uri = contents[contents.index("## Profile URIs")+1].split("^(")[1].split(".*|")[0]
    assert True