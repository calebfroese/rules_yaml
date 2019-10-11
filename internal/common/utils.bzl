def select_compiler(compiler):
    """Will return the correct YAML yq executable for the host machine."""
    if compiler != None:
        return compiler
    return select({
        "@bazel_tools//src/conditions:darwin": "@yq_binary_darwin//file",
        "@bazel_tools//src/conditions:windows": "@yq_binary_windows//file",
        "//conditions:default": "@yq_binary_linux//file",
    })
