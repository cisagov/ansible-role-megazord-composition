# ansible-role-megazord-composition #

[![GitHub Build Status](https://github.com/cisagov/ansible-role-megazord-composition/workflows/build/badge.svg)](https://github.com/cisagov/ansible-role-megazord-composition/actions)
[![CodeQL](https://github.com/cisagov/ansible-role-megazord-composition/workflows/CodeQL/badge.svg)](https://github.com/cisagov/ansible-role-megazord-composition/actions/workflows/codeql-analysis.yml)

## Requirements ##

None.

## Role Variables ##

None.

## Dependencies ##

- [ansible-role-cs2modrewrite](https://github.com/cisagov/ansible-role-cs2modrewrite)
- [ansible-role-docker](https://github.com/cisagov/ansible-role-docker)
- [ansible-role-sourcepoint](https://github.com/cisagov/ansible-role-sourcepoint)

## Example Playbook ##

Here's how to use this in a playbook:

```yaml
- hosts: all
  become: yes
  become_method: sudo
  tasks:
    - name: Install the Megazord composition
      ansible.builtin.include_role:
        name: megazord_composition
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

<<<<<<< HEAD
-
=======
First Last - <first.last@gwe.cisa.dhs.gov>
>>>>>>> b1e866deabc2408ffe58711e6a0f32446d183205
