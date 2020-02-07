
/***********************************************************
STEP 1 and STEP 2 should be run separately from the resto of the script
They are used to identify the nformation you require for the 
analysis performed in STEP 3 to STEP 7
***********************************************************/

-- STEP 1 
-- Obtain the QID from the current active requests for the query label 
SELECT *   
FROM sys.dm_pdw_exec_requests
WHERE [status] = 'Running'
AND [label] = 'Top100Sales'

-- STEP 2 
-- Identity the problematic step by providing the QId from the previous selection 
SELECT * FROM sys.dm_pdw_request_steps
WHERE request_id = 'QID'



/***********************************************************
Once you have the information from the previous STEPS you can
you can highlight STEPS 3 to STEP 7 and execute in a single batch
***********************************************************/

-- STEP 3
-- To Obtain the plan and sql text information without providing any additoinal input we can perform the following while another repro is active 
-- Declare the variables for the values I require
-- Highlight and run STEP 3 to STEP7 while problematic query step (step 20 with our dataset) of Statement is Active 
DECLARE @qid   VARCHAR(10)
DECLARE @pdw_node_id INT  
DECLARE @session_id INT   

-- STEP 4 
-- Use a label to assist with finding your running statement 
SELECT @qid = request_id
FROM sys.dm_pdw_exec_requests
WHERE [status] = 'Running'
AND [label] = 'Top100Sales'

-- STEP 5 
-- The problem step has been identified in STEP 2 we will provide this below 
SELECT  @pdw_node_id = pdw_node_id, @session_id =sql_spid  
FROM sys.dm_pdw_dms_workers
WHERE request_id =   @qid
AND step_index = 20
AND [type] LIKE '%READER%' 
AND status = 'execute'

-- STEP 6
-- Retrieve the Running query plan for the identified query and step which is running 
SELECT * FROM sys.dm_pdw_nodes_exec_query_plan​ 
WHERE session_id = @session_id  AND pdw_node_id = @pdw_node_id

-- STEP 7 
-- Retrieve the query text for the identified query and step which is running 
SELECT * FROM sys.dm_pdw_nodes_exec_sql_text​
WHERE session_id = @session_id  AND pdw_node_id = @pdw_node_id
