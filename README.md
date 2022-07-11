# ansible-role-megazord-composition #

[![GitHub Build Status](https://github.com/hsfetty/ansible-role-megazord-composition/workflows/build/badge.svg)](https://github.com/hsfetty/ansible-role-megazord-composition/actions)

## Requirements ##

None.

## Role Variables ##

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| domain_name | The domain name for cobalt strike. | `sample.domain` | No |
| redirect_location | The site to redirect unwanted traffic to, excluding 'https://'. | `cisa.gov` | No |

## Dependencies ##

- [ansible-role-cs2modrewrite](https://github.com/xvxd4sh/ansible-role-cs2modrewrite)
- [ansible-role-sourcepoint](https://github.com/hsfetty/ansible-role-sourcepoint)

## Example Playbook ##

Here's how to use this in a playbook:

```yaml
- hosts: all
  become: yes
  become_method: sudo
  roles:
    - megazord-composition
```

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Author Information ##

Brian Hambleton - <brian.hambleton@dhs.gov>
