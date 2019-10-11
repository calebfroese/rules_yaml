load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

_YQ_SOURCES = {
    "darwin_amd64": (
        ["https://github.com/mikefarah/yq/releases/download/2.4.0/yq_darwin_amd64"],
        "f09d3db259a0073a441362e94c7973a921c58903c7dd7cb7894672037687322c",
    ),
    "windows_amd64": (
        ["https://github.com/mikefarah/yq/releases/download/2.4.0/yq_windows_amd64.exe"],
        "793dac701765fce832afff85104cb208c1392a94c369474222fe42a119e1bcd1",
    ),
    "linux_amd64": (
        ["https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64"],
        "99a01ae32f0704773c72103adb7050ef5c5cad14b517a8612543821ef32d6cc9",
    ),
}

def yaml_repositories(yq_sources = _YQ_SOURCES):
    """Declares workspaces that the YAML rules depends on. All consumers of rules_yaml should call this in their
    WORKSPACE."""

    http_file(
        name = "yq_binary_darwin",
        executable = True,
        urls = yq_sources["darwin_amd64"][0],
        sha256 = yq_sources["darwin_amd64"][1],
    )
    http_file(
        name = "yq_binary_windows",
        executable = True,
        urls = yq_sources["windows_amd64"][0],
        sha256 = yq_sources["windows_amd64"][1],
    )
    http_file(
        name = "yq_binary_linux",
        executable = True,
        urls = yq_sources["linux_amd64"][0],
        sha256 = yq_sources["linux_amd64"][1],
    )
