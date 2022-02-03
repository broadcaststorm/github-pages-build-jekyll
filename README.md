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

## Environment "Operational" Notes

I am not a Ruby person and don't intend to learn any more than necessary
as my focus is on other spaces. Yet, I still want a decent blog site that
is free :)  So, below are notes to myself on how to do certain tasks with
the website.

- GitHub Pages only supports Ruby 2.x???
    - Currently 2.7.3 (see GitHub repo below)
    - [How to manually install Ruby](https://developer.fedoraproject.org/tech/languages/ruby/ruby-installation.html)

- The theme is based on [Flexible Jekyll](https://github.com/artemsheludko/flexible-jekyll)

- Gemfile.lock locks versions of the Ruby Gems, based around GitHub Pages gem.
The latest version of github-pages can be determined at its
[GitHub repo](https://github.com/github/pages-gem)

- **bundle update** will install latest Ruby gems as specified (and/or restricted)
by the specified Gemfile, placing the latest versions leveraged into the Gemfile.lock
file.

- When **bundle update github-pages** fails, it's typically because it is
trying to compile code (no compilers in the Vagrant box).  Look for RPM
packages as a substitute.

