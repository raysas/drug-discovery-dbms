## SQL

*implemented on MySQL*
* [DDl](./DDL.sql)
* [DML](./DML.sql):
  * data related to genes and variants are withdrawn from ENSEMBLE database
  * data related to chemical compounds and drugs are withdrawn from ChEMBL database
  * data related to records and patients were generated randomly using [python scripts](#python). *Not related to real life records/people; any similarities are totally irrelevant and does not reflect real people*
* [DQL](./DQL.sql)

## python

* [records generator](./record.py) generates randomly records that involve IDs, diseases, drugs... *(disease drug association might be irrelavant due to this randomization)*
* [patients generator](./patient.py) generates randomly people with names, IDs, ages...
