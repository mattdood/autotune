# RDS database configuration
Workload specific configurations are stored under the associated workload file.
E.g. olap.tf, oltp.tf, hybrid.tf.

Note: This file is meant to be a baseline start for a database,
it does not contain all settings that can be used (e.g., multi-az,
allocated storage, network type, etc.).

## References:
* [Postgresqlco Database parameter references](https://postgresqlco.nf/doc/en/param/) - A
great site for the database parameter descriptions and which engine version a
parameter was created in
    * [Postgres parameter documentation]
* [PGTune](https://pgtune.leopard.in.ua/) - A site for creating some default
values for Postgres parameters.
