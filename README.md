# rules_yaml

This project provides [Bazel](http://bazel.build) rules for operating with YAML.

## Setup

In your WORKSPACE file, include the following snippets.
This will tell Bazel to fetch the YAML rules archive, extract it, and prepare it for use in your application.

```bzl
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_yaml",
    sha256 = "<see github releases page for checksum>",
    url = "https://github.com/calebfroese/rules_yaml/archive/0.0.1.zip",
)

load("@rules_yaml//:defs.bzl", "yaml_repositories")

# This sets up the dependencies for rules_yaml
yaml_repositories()
```

## Usage

You can pull elements into new YAML files using the `yaml_excerpt` rule.

```bzl
# Extract elements nested under the path into a new file
yaml_excerpt(
    name = "first_car_info",
    src = "template.yml",
    path = "config.properties.cars[0].Details",
)
# Which can then be passed in to other rules as ":first_car_info"
```
