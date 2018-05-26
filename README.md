# users

Formula for creating, deleting and configuring users.

## Usage

Crete users by:
```yaml
users:
  auser:
    # configuration
    
  buser:
    # configuration
```

Delete user by:
```yaml
absent_users:
  - auser
  - buser
```
You can configure:
  - fullname
  - home directory
  - uid, gid
  - groups
  - sudo without password
  - public key for ssh
  
## Examples

Pillar examples for ubuntu and centos placed in /tests/pillars/users.
