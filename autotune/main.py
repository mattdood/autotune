import argparse
import inspect
import textwrap
from typing import Optional, Sequence

from .commands import config, create, engines

# Command mapper
COMMAND_MAP = {
    "config": config,
    "create": create,
    "engines": engines,
}


def main(argv: Optional[Sequence] = None) -> int:
    parser = argparse.ArgumentParser(
        prog="autotune",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=textwrap.dedent("""
        Autotune creates Terraform modules for databases.

        These modules are tuned by workload and configuration
        to ensure a moderate starting point in database performance
        can be expected. Projects commonly have completely untuned
        databases which later lead to a scramble to increase performance
        later on.

        With autotune the database provisioning step already contains
        sane defaults to the workload type that is expected.
        """),
    )

    subparsers = parser.add_subparsers(help="sub-command help", dest="command")

    parser_create = subparsers.add_parser(
        "create",
        help="""Creates a Terraform deployment of a database.

        User parameters define the Terraform starter code
        to create based on workload type, database engine version,
        and configuration.

        Note: Requires a configuration file prior to running.
        """
    )
    parser_create.set_defaults(which="create")

    parser_config = subparsers.add_parser(
        "config",
        help="""Creates a blank config file.

        Config files are used to ensure consistent output of the
        Terraform starter code. These can be used to replicate
        the `create` executions and serve as a record of the CLI
        executions.

        Example:
        `autotune config -n my_db -o .` would create `my_db.json`
        """
    )
    parser_config.set_defaults(which="config")

    parser_engines = subparsers.add_parser(
        "engines",
        help="""Lists supported engines.

        Shows a list of the supported database engines, their respective
        major versions, and workloads.
        """
    )
    parser_engines.set_defaults(which="engines")

    args = parser.parse_args(argv)

    if args.command:
        # Map arg to command
        func = COMMAND_MAP[args.command]

        # Filter argparse specific keys from
        # argument values to only ones used
        # in the function call.
        # This could be done with `**_` as a "kwargs"
        # placeholder in the function as well.
        # Inspiration: https://stackoverflow.com/a/43238973/12387496
        filtered_args = {}
        func_params = [param.name for param in inspect.signature(func).parameters.values()]
        for key, value in vars(args).items():
            if key in func_params:
                filtered_args[key] = value

        func(**filtered_args)

    else:
        parser.print_help()

    return 0


if __name__ == "__main__":
    main()

