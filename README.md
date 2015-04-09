# consul-node-cookbook

Installs/configures a minimal node with Docker, and then runs a Consul instance inside Docker.

## Supported Platforms

 - Ubuntu 14.04+

## Usage

### consul-node::default

Include `consul-node` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[consul-node::default]"
  ]
}
```

## License and Authors

Author:: Michael Browning (mrbrowning@distopia.net)
