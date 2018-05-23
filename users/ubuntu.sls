canonical:
  user.present:
    - fullname: Canonical User
    - shell: /bin/bash
    - home: /home/canonical
    - uid: 4000
    - gid: 100
    - groups:
      - users

redhat:
  user.absent

/etc/sudoers.d/canonical:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      user_name: canonical

sshkeys:
  ssh_auth.present:
    - user: canonical
    - source: salt://ubuntu.pem
