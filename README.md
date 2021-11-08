# Broadcast Storm Blog Build Environment

A nice Vagrantfile to deploy and setup a Fedora cloud image so that
I can locally test my Jekyll-based github.io web content.

## Details

- First, you'll need to check out the blog from ITS repo to this directory:

```bash
$ git clone https://github.com/broadcaststorm/broadcaststorm.github.io
```

- Second, fire up the Vagrant box

```bash
$ vagrant up
```

- Once the Vagrant box is up and running, you'll need to connect into
  the environment and launch the local Jekyll server.

```bash
$ vagrant ssh
[vagrant@localhost]$ cd broadcaststorm.github.io
[vagrant@localhost]$ bundle exec jekyll serve --host=$MYHOST

```

- The local Jekyll server is portmapped to http://localhost:4000 for
  viewing the site content. You'll almost certainly open an IDE in the
  checked out site repository, make changes, and restart the Jekyll
  server.

