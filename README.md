# consul_node-cookbook

Install/configure a minimal node with Docker, and then run a Consul instance inside Docker.
The `primary` recipe is meant for the bootstrap host, and the `secondary` recipe for the
subsequent participating nodes.

The primary is assigned a static IP of 172.16.0.2 in a private network, so that the secondaries
don't need to have the IP that they join to be manually configured. The only unfortunately
hard-coded assumption in this cookbook is the IP of the `docker0` interface, 172.17.42.1, which we
use to tell the daemon where to perform DNS lookups so that Consul can resolve them, but since
we're starting from the same image in each case this should always be the same.

This is based off of the Consul setup in Chapter 6 of *The Docker Book* by James Turnbull. I just
wanted to automate it as much as possible.

## Requirements

 - Berkshelf (most easily installed via ChefDK)
 - Vagrant
 - vagrant-berkshelf plugin

## Usage

Make sure your cookbooks are in order:

```
berks init .
```

Start the primary node:

```
vagrant up consul-primary
```

Start the secondary nodes:

```
vagrant up consul-secondary0
vagrant up consul-secondary1
```

And that's it! If you navigate to http://172.16.0.2:8500 in your browser you'll see the Consul
dashboard with your three participating nodes. Further services built on top of this are up to you.

## License and Authors

Author:: Michael Browning (mrbrowning@distopia.net)
