# DWDemos

Scope of this repository is to aggregate a number of scripts to test specific Azure Synapse Analytics scenarios.


## DWDemoScripts

This folder contains a set of scripts that can guide through common scenarios that affect query performance.

## AzureSynapseTroubleshooting

This folder contains a set of scripts that cover a specific performance case troubleshooting, leveraging some newly introduced DMVs.
The examples are based on the AdventureWorks database, but you can use personalize the scripts for your own data set easily. 
You can also use the dataset in DWDemoScripts, [01_Create_And_Prepare_Database](./DWDEmoScripts/01_Create_And_Prepare_Databaase.sql).

[dm_pdw_nodes_exec_sql_text](https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-nodes-exec-sql-text-transact-sql?view=azure-sqldw-latest)
[dm_pdw_nodes_exec_query_plan](https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-nodes-exec-query-plan-transact-sql?view=azure-sqldw-latest)
[dm_pdw_nodes_exec_query_profiles](https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-nodes-exec-query-profiles-transact-sql?view=azure-sqldw-latest)
[dm_pdw_nodes_exec_query_statistics_xml](https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-nodes-exec-query-statistics-xml-transact-sql?view=azure-sqldw-latest)
[dm_pdw_nodes_exec_text_query_plan](https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-pdw-nodes-exec-text-query-plan-transact-sql?view=azure-sqldw-latest)

