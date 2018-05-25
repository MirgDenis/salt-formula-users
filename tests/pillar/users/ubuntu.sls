users:
  canonical:
    fullname: Test
    home: /home/canonical
    uid: 2000
    gid: 100
    groups:
      - users
      - root
    sudouser: True
    ssh_auth: salt://tests/ubuntu.pub

absent_users:
  - redhat

