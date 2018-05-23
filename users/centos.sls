redhat:
  user.present:
    - name: redhat
    - home: /home/redhat
    - uid: 4000
    - gid: 100
    - groups:
      - users

canonical:
  user.absent

/etc/sudoers.d/redhat:
  file.managed:
    - source: salt://users/templates/sudoers.d.jinja2
    - template: jinja
    - context:
      user_name: redhat

sshkeys:
  ssh_auth.present:
    - user: redhat
    - source: salt://centos.pem
