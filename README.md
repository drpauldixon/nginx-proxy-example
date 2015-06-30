# NGINX proxy example

## Usage

**Start the VMs and run a test:**

```
vagrant up
./tests/run.sh
```

**Destroy the VMs:**

```
vagrant destroy
```

**Re-run the provisioner scripts:**

```
vagrant provision
```

## VMs

This Vagrant config creates 2x virtual machines:

**NGINX proxy:**

- prx01: 172.16.12.101

This proxies all requests to the web server listening on `http://172.16.2.102`.

**Apache web server:**

- web01: 172.16.12.102

The web server has 3x large files in *DocumentRoot*:

- 15mb.html
- 20mb.html
- 25mb.html

