"""CLI commands for autotune."""


def config() -> None:
    """Creates a blank config file.

    Configuration files are used to ensure consistent
    output for the CLI and serves as a record of the
    CLI input.
    """
    pass


def create() -> None:
    """Creates a Terraform module for a database.

    Outputs a Terraform module to a given output directory
    with the database engine, version, and workload type.
    """
    pass


def engines() -> None:
    """Lists all supported engines.

    Discovers supported engines, versions,
    and their respective workload configurations.
    """
    pass

