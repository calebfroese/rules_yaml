# Contributing

## Releasing

Create an artifact of the rules and attach as a binary to the GitHub release.

```shell
git archive HEAD --format tar.gz --output rules_yaml-v1.0.0.tar.gz
```

Get the checksum

```shell
sha256sum rules_yaml-v1.0.0.tar.gz > rules_yaml-v1.0.0.tar.gz.sha256 
```

And makes sure to include both with an installation example in the release notes.
