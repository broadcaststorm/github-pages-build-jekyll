# Vagrant-based GitHub Pages Build Environment

A simple Vagrantfile to deploy and setup a Fedora cloud image so that
I can locally test my Jekyll-based github.io web content.

Why?
- Web design isn't my primary (secondary, tertiary, ... you get the picture)
focus so I can never remember it, so automate and document it!
- As of this time, GitHub pages and its native Jekyll support are anchored
around Ruby 2.7.  The recent Fedora distributions have moved on to 3.x versions
so it's not quite as easy as simply installing OS packages.
- This might be of value to newcomers to GitHub Pages bloggers?  Maybe?

## Overview

The Vagrantfile will essentially install most of the core pre-requisites for
Ruby 2.7 and some of the GitHub pages dependencies in the "guest build system".

I assume that you, as I do, prefer to edit with an IDE in the host OS. To
accomodate this, the host system's local "blog" directory is mounted into the
guest build system's /home/vagrant/blog directory. Edits in the host system
then appear in the guest build system.  Note: this is a **mount** and not a
copy.

Finally, there is an assumption that your blog GitHub repository has a Gemfile
in the parent directory. Vagrant will attempt to install the Gemfile dependencies
for your particular blog theme.

The Vagrantfile also maps the Jekyll guest build web server connection to your
host system network (http://localhost:4000).

## Setup

- Clone this repository:

```bash
git clone https://github.com/broadcaststorm/github-pages-build-jekyll
```

- Check out your blog from ITS GitHub repo to THIS repo's blog directory:

```bash
cd github-pages-build-jekyll
git clone https://github.com/broadcaststorm/broadcaststorm.github.io blog
```

That **blog** argument is important!!!

- Start the Vagrant box

```bash
$ vagrant up
```

## Using the build environment

Once the Vagrant box is up and running, you'll need to connect into the environment
and launch the local Jekyll server.

```bash
$ vagrant ssh
[vagrant@localhost]$ cd broadcaststorm.github.io
[vagrant@localhost]$ bundle exec jekyll serve --host=$MYHOST
```

As you'll see in the command output, the local Jekyll server is portmapped to
http://localhost:4000 for viewing the site content. You'll almost certainly open
an IDE in the host system to edit the content and commit those changes back to
GitHub Pages.

You might ask, why not autostart Jekyll in the VM and have it run in the background
as a service?  Great question. In normal environments, edits to the source content
automatically trigger Jekyll to rebuild the static content. Unfortunately, as of
this moment, the Vagrant mount process does not provide the needed signalling for
Jekyll to detect file updates.  So, you'll have to stop/restart the Jekyll server
process to realize content updates.

**Optional**

If you have a couple different GitHub accounts (work and personal, for example),
you can ABSOLUTELY commit code changes from within the Vagrant box guest to help
you keep credentials/identities straight. In that case, you'll likely want to
run the following commands within the Vagrant guest system to be sure you are
leveraging the right identities with code commits:

```bash
git config --global user.name 'Your Name'
git config --global user.email 'your@email.address'
```

## Developer Notes

I am not a Ruby person and really don't intend to learn any more than necessary
as my focus is on other spaces. Yet, I still want a decent blog site that is
free :) and not hosted on suspicious services. So, below are notes to myself on
how to do certain tasks with the website.

- GitHub Pages only supports Ruby 2.7
    - Currently 2.7.3 (see GitHub repo below)
    - [How to manually install Ruby](https://developer.fedoraproject.org/tech/languages/ruby/ruby-installation.html)

- The theme is based on [Flexible Jekyll](https://github.com/artemsheludko/flexible-jekyll)
    - [Fedora Jekyll Pre-Requisites](https://jekyllrb.com/docs/installation/other-linux/)
    - [Jekyll Installation Docs[(https://jekyllrb.com/docs/installation/)

- [Working with GitHub Pages](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/testing-your-github-pages-site-locally-with-jekyll)

- Gemfile.lock locks versions of the Ruby Gems, based around GitHub Pages gem.
The latest version of github-pages can be determined at its
[GitHub repo](https://github.com/github/pages-gem)

- **bundle update** will install latest Ruby gems as specified (and/or restricted)
by the specified Gemfile, placing the latest versions leveraged into the Gemfile.lock
file.

- When **bundle update github-pages** fails, it's typically because it is
trying to compile code (no compilers in the Vagrant box).  Look for RPM
packages as a substitute.
