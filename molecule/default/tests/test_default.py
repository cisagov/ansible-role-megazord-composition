"""Module containing the tests for the default scenario."""

# Standard Python Libraries
from datetime import date
import os

# Third-Party Libraries
import pytest
import testinfra.utils.ansible_runner

# import socket


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


# def test_containers(host):
#     """Test that the docker containers are running."""
#     assert len(host.docker.get_containers(status="running")) == 2


def test_service(host):
    """Test that the expected service is enabled and running."""
    assert host.service("megazord-composition").is_enabled


#    assert host.service("megazord-composition").is_running


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


# def test_redirection_helper(s, uri, user_agent, redirect_location) -> bool:
#     """Helper function to try all 3 cases for apache redirection."""
#     ret_arr = [0, 0, 0]
#     http_get = "GET / HTTP/1.1\r\nHost:localhost/{}\r\nUser-Agent:{}\r\n\r\n"
#     s.connect(("localhost", 80))

#     s.send(http_get.format(uri, user_agent))
#     response = s.recv(1024)
#     # if the URI is in the response, we know it would be forwarded to the C2 server
#     if uri in response:
#         ret_arr[0] = 1

#     s.send(http_get.format("test", "dummy-user-agent"))
#     # if the redirect location is in the response, we know the redirection works
#     response = s.recv(1024)
#     if redirect_location in response:
#         ret_arr[1] = 1

#     s.send(http_get.format("/uploads", "dummy-user-agent"))
#     if "200" in response:
#         ret_arr[2] = 1

#     return 0 not in ret_arr


# @pytest.mark.parametrize("d", ["/tools/SourcePoint"])
# def test_redirection_apache(host, d):
#     """Test that the apache redirection is working as intended."""
#     today = date.today()
#     file_name = "{}/SourcePoint-{}.profile".format(d, today)

#     with open(file_name, "r") as f:
#         lines = f.readlines()
#         for line in lines:
#             if "useragent" in line:
#                 user_agent = line.split(" ")[-1][:-1]
#                 break

#     with open("/tools/Megazord-Composition/src/apache2/.htaccess", "r") as f:
#         contents = f.read()
#         contents = contents.split("\n")

#     uri = contents[contents.index("## Profile URIs") + 1].split("^(")[1].split(".*|")[0]
#     redirect = (
#         contents[contents.index("## Redirect all other traffic here") + 1]
#         .split(" ")[-2]
#         .split("/")[-2]
#     )
#     s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#     assert test_redirection_helper(s, uri, user_agent, redirect)
