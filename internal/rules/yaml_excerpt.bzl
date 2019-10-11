load("//internal/common:utils.bzl", "select_compiler")

def yaml_excerpt(name, src, path, compiler = None):
    """Macro to wrap the yaml_excerpt rule getting around the restriction of running Starlarks `select` in rules."""
    _yaml_excerpt(
        name = name,
        src = src,
        path = path,
        compiler = select_compiler(compiler),
    )

def _yaml_excerpt_impl(ctx):
    executable = ctx.executable.compiler
    sourcefile = ctx.file.src
    outputfile = ctx.outputs.excerpt
    print("Exec", executable)

    ctx.actions.run_shell(
        tools = [executable],
        outputs = [outputfile],
        inputs = [sourcefile],
        command = "{executable} read {yaml_file} {path} > {output}".format(
            executable = executable.path,
            yaml_file = sourcefile.path,
            path = ctx.attr.path,
            output = outputfile.path,
        ),
    )

_yaml_excerpt = rule(
    doc = """Extracts YAML at a path into a new file

    Uses JSON path syntax to reference a YAML element and output a file with the selected contents. A custom
    yq executable can optionally be provided.""",
    implementation = _yaml_excerpt_impl,
    attrs = {
        "src": attr.label(
            doc = """The source YAML file to perform operations on""",
            mandatory = True,
            allow_single_file = True,
        ),
        "path": attr.string(
            doc = """JSON path reference to the element, for example `a.b.c`. `$` can be specified to reference the root.""",
            mandatory = True,
        ),
        "compiler": attr.label(
            doc = """yq executable""",
            allow_files = True,
            executable = True,
            cfg = "host",
        ),
    },
    outputs = {
        "excerpt": "%{name}.yaml",
    },
)
