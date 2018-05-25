users:
  redhat:
    fullname: Test
    home: /home/redhat
    uid: 2000
    gid: 100
    groups:
      - users
      - root
    sudouser: Ture
    ssh_auth: salt://tests/centos.pub

absent_users:
  - canonical
