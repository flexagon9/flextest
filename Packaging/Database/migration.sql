set define off;

UPDATE FD.OBJECT_TYPE set OBJECT_TYPE_CODE = 'MATERIALIZED_VIEW' where OBJECT_TYPE_ID = 112;
UPDATE FD.OBJECT_TYPE set OBJECT_TYPE_CODE = 'MATERIALIZED_VIEW_LOG' where OBJECT_TYPE_ID = 113;


-- Oracle Database Read Only Workflow changes
UPDATE FD.WORKFLOW_VERSION_DATA set  WORKFLOW_VERSION_DATA = 
'<?xml version="1.0" encoding="UTF-8"?>
<ns0:WorkFlow xmlns:ns1="http://flexagon.com/flexdeploy/workflow/common" xmlns:ns0="http://flexagon.com/flexdeploy/workflow">
   <ns1:Name>Oracle-Build-DDL</ns1:Name>
   <ns1:Description></ns1:Description>
   <ns0:Inputs>
      <ns0:Variable>
         <ns1:Name>Revert_to_Baseline_ID</ns1:Name>
         <ns1:Description>Baseline to revert to (Leave blank to create a new baseline)</ns1:Description>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Revert to Baseline ID</ns1:DisplayName>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:InitialValueExpression>false</ns1:InitialValueExpression>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Table_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1=OWNER.OLD_TABLE1,OWNER.TABLE2=OWNER.OLD_TABLE2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Table Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Index_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.INDEX1=OWNER.OLD_INDEX1,OWNER.INDEX2=OWNER.OLD_INDEX2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Index Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Column_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1.COLUMN1=OWNER.TABLE1.OLD_COLUMN1,OWNER.TABLE2.COLUMN2=OWNER.OLD_TABLE2.OLD_COLUMN2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Column Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Trigger_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TRIGGER1=OWNER.OLD_TRIGGER1,OWNER.TRIGGER2=OWNER.OLD_TRIGGER2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Trigger Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Constraint_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1.CONSTRAINT1=OWNER.TABLE1.OLD_CONSTRAINT1,OWNER.TABLE2.CONSTRAINT2=OWNER.OLD_TABLE2.OLD_CONSTRAINT2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Constraint Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Synonym_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.SYNONYM1=OWNER.OLD_SYNONYM1,OWNER.SYNONYM2=OWNER.OLD_SYNONYM2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Synonym Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Sequence_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.SEQUENCE1=OWNER.OLD_SEQUENCE1,OWNER.SEQUENCE2=OWNER.OLD_SEQUENCE2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Sequence Renames</ns1:DisplayName>
      </ns0:Variable>'
  where WORKFLOW_VERSION_DATA_ID = 110 and WORKFLOW_VERSION_ID = 104 and SEQUENCE_NUMBER = 0;
  
    
	
update FD.WORKFLOW_VERSION_DATA
set WORKFLOW_VERSION_DATA = 
 '<?xml version="1.0" encoding="UTF-8"?>
<ns0:WorkFlow xmlns:ns1="http://flexagon.com/flexdeploy/workflow/common" xmlns:ns0="http://flexagon.com/flexdeploy/workflow">
   <ns1:Name>Oracle-Synchronize-DDL</ns1:Name>
   <ns1:Description></ns1:Description>
   <ns0:Inputs>
      <ns0:Variable>
         <ns1:Name>Preview_Execution</ns1:Name>
         <ns1:Description>TRUE/FALSE - True will bypass actual execution of DDL (preview mode).  False executes DDL.</ns1:Description>
         <ns1:Type>Boolean</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>true</ns1:InitialValue>
         <ns1:InitialValueExpression>false</ns1:InitialValueExpression>
      </ns0:Variable>
   </ns0:Inputs>
   <ns0:Variables>
      <ns0:Variable>
         <ns1:Name>Original_baseline_ID</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Preview_Execution_var</ns1:Name>
         <ns1:Type>Boolean</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>TRUE</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Applied_baseline_ID</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Delta_DDL_ID</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Table_Drop_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Table_Create_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Table_Alter_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Column_Drop_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Column_Add_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>'
where 
    WORKFLOW_VERSION_DATA_ID = 120 and
    WORKFLOW_VERSION_ID = 105 and
    SEQUENCE_NUMBER = 0;

update FD.WORKFLOW_VERSION_DATA set WORKFLOW_VERSION_DATA = 
'<ns0:Variable>
         <ns1:Name>Baseline_Constraint_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Sequence_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Procedures_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Views_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Synonyms_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Privileges_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Invalid_count_before</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Recompile_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Invalid_count_after</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>MView_Drop_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>MView_Create_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>-1</ns1:InitialValue>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>'
	  where 
    WORKFLOW_VERSION_DATA_ID = 124 and
    WORKFLOW_VERSION_ID = 105 and
    SEQUENCE_NUMBER = 4;
    
	UPDATE FD.WORKFLOW_VERSION_DATA set WORKFLOW_VERSION_DATA = 
  '<ns0:PluginInput>
                  <ns0:Name>FDORA_DDL_USER</ns0:Name>
                  <ns0:ValueType>Text</ns0:ValueType>
                  <ns0:Encrypted>false</ns0:Encrypted>
                  <ns1:Type>String</ns1:Type>
                  <ns0:Text>fddb</ns0:Text>
               </ns0:PluginInput>
               <ns0:PluginInput>
                  <ns0:Name>FDORA_DDL_PASSWORD</ns0:Name>
                  <ns0:ValueType>Text</ns0:ValueType>
                  <ns0:Encrypted>true</ns0:Encrypted>
                  <ns1:Type>String</ns1:Type>
                  <ns0:Text>44fA2GrgFLy0XlCT3iJuE9OdW/Oc9b0cNGuDRHCF39Fgc=W8sE0hC0huAKGnzQdY64zZ/nvNWTCXKt701p3iEIDek=</ns0:Text>
               </ns0:PluginInput>
               <ns0:PluginInput>
                  <ns0:Name>FDORA_COL_DROP_ACTION</ns0:Name>
                  <ns0:ValueType>Text</ns0:ValueType>
                  <ns0:Encrypted>false</ns0:Encrypted>
                  <ns1:Type>String</ns1:Type>
                  <ns0:Text>SET UNUSED</ns0:Text>
               </ns0:PluginInput>
               <ns0:PluginInput>
                  <ns0:Name>FDORA_CREATE_BASELINE_FLG</ns0:Name>
                  <ns0:ValueType>Expression</ns0:ValueType>
                  <ns0:Encrypted>false</ns0:Encrypted>
                  <ns1:Type>Boolean</ns1:Type>
                  <ns0:Value>
                     <ns0:Expression>true</ns0:Expression>
                  </ns0:Value>
               </ns0:PluginInput>
               <ns0:PluginInput>
                  <ns0:Name>FDORA_PREVIEW_EXECUTION</ns0:Name>
                  <ns0:ValueType>Expression</ns0:ValueType>
                  <ns0:Encrypted>false</ns0:Encrypted>
                  <ns1:Type>Boolean</ns1:Type>
                  <ns0:Value>
                     <ns0:Expression>Preview_Execution</ns0:Expression>
                  </ns0:Value>
               </ns0:PluginInput>
            </ns0:PluginInputs>
            <ns0:UserInputs/>
            <ns0:PluginOutputs>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_BASELINE_ID</ns0:NameInCallee>
                  <ns0:NameInCaller>Original_baseline_ID</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_NEW_BASELINE_ID</ns0:NameInCallee>
                  <ns0:NameInCaller>Applied_baseline_ID</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_DELTA_BASELINE_ID</ns0:NameInCallee>
                  <ns0:NameInCaller>Delta_DDL_ID</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_DROP_TABLE_COUNT</ns0:NameInCallee>
                  <ns0:NameInCaller>Table_Drop_count</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_CREATE_TABLE_COUNT</ns0:NameInCallee>
                  <ns0:NameInCaller>Table_Create_count</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_ALTER_TABLE_COUNT</ns0:NameInCallee>
                  <ns0:NameInCaller>Table_Alter_count</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_DROP_COLUMNS_COUNT</ns0:NameInCallee>
                  <ns0:NameInCaller>Column_Drop_count</ns0:NameInCaller>
               </ns0:OutputValue>
               <ns0:OutputValue>
                  <ns0:NameInCallee>FDORA_OUT_ADD_COLUMNS_COUNT</ns0:NameInCallee>
                  <ns0:NameInCaller>Column_Add_count</ns0:NameInCaller>
               </ns0:OutputValue>'
  where 
    WORKFLOW_VERSION_DATA_ID = 127 and
    WORKFLOW_VERSION_ID = 105 and
    SEQUENCE_NUMBER = 7;

 UPDATE FD.WORKFLOW_VERSION_DATA set WORKFLOW_VERSION_DATA = 
    '<ns0:Variable>
         <ns1:Name>View_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.VIEW1=OWNER.OLD_VIEW1,OWNER.VIEW2=OWNER.OLD_VIEW2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>View Renames</ns1:DisplayName>
      </ns0:Variable>
   </ns0:Inputs>
   <ns0:Variables>
      <ns0:Variable>
         <ns1:Name>Baseline_ID</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:InitialValue>0</ns1:InitialValue>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Table_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Index_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Constraint_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Sequence_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Procedures_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Views_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Baseline_Synonyms_count</ns1:Name>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>true</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>'  
  where
    WORKFLOW_VERSION_DATA_ID = 141 and
    WORKFLOW_VERSION_ID = 106 and
    SEQUENCE_NUMBER = 1;
  

update FD.WORKFLOW_VERSION_DATA set WORKFLOW_VERSION_DATA =
'<?xml version="1.0" encoding="UTF-8"?>
<ns0:WorkFlow xmlns:ns1="http://flexagon.com/flexdeploy/workflow/common" xmlns:ns0="http://flexagon.com/flexdeploy/workflow">
   <ns1:Name>Oracle-Build-SCM</ns1:Name>
   <ns1:Description></ns1:Description>
   <ns0:Inputs>
      <ns0:Variable>
         <ns1:Name>Revert_to_Baseline_ID</ns1:Name>
         <ns1:Description>Baseline to revert to (Leave blank to create a new baseline)</ns1:Description>
         <ns1:Type>Integer</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Revert to Baseline ID</ns1:DisplayName>
         <ns1:Required>false</ns1:Required>
         <ns1:Encrypted>false</ns1:Encrypted>
         <ns1:InitialValueExpression>false</ns1:InitialValueExpression>
         <ns1:Multiselect>false</ns1:Multiselect>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Table_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1=OWNER.OLD_TABLE1,OWNER.TABLE2=OWNER.OLD_TABLE2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Table Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Index_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.INDEX1=OWNER.OLD_INDEX1,OWNER.INDEX2=OWNER.OLD_INDEX2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Index Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Column_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1.COLUMN1=OWNER.TABLE1.OLD_COLUMN1,OWNER.TABLE2.COLUMN2=OWNER.OLD_TABLE2.OLD_COLUMN2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Column Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Trigger_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TRIGGER1=OWNER.OLD_TRIGGER1,OWNER.TRIGGER2=OWNER.OLD_TRIGGER2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Trigger Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Constraint_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.TABLE1.CONSTRAINT1=OWNER.TABLE1.OLD_CONSTRAINT1,OWNER.TABLE2.CONSTRAINT2=OWNER.OLD_TABLE2.OLD_CONSTRAINT2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Constraint Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Synonym_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.SYNONYM1=OWNER.OLD_SYNONYM1,OWNER.SYNONYM2=OWNER.OLD_SYNONYM2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Synonym Renames</ns1:DisplayName>
      </ns0:Variable>
      <ns0:Variable>
         <ns1:Name>Sequence_Renames</ns1:Name>
         <ns1:Description>Format:  OWNER.SEQUENCE1=OWNER.OLD_SEQUENCE1,OWNER.SEQUENCE2=OWNER.OLD_SEQUENCE2</ns1:Description>
         <ns1:Type>String</ns1:Type>
         <ns0:returnAsOutput>false</ns0:returnAsOutput>
         <ns1:isConstant>false</ns1:isConstant>
         <ns1:DisplayName>Sequence Renames</ns1:DisplayName>
      </ns0:Variable>'
	  where 
    WORKFLOW_VERSION_DATA_ID = 140 and
    WORKFLOW_VERSION_ID = 106 and
    SEQUENCE_NUMBER =0;
-- end Oracle Database Read Only Workflow Changes.

begin
update FD.OBJECT_ATTRIBUTE_DEF set DEFAULTS_SCRIPT='APP_SHORT_NAME=MODULE.split('' -'')[0];       
CMD=''cp $SOURCE_FILE '' + TARGET_LOCATION  + '';\n'';      
VAR_EXT=FILE_EXTENSION == '''' || FILE_EXTENSION == null ? '''' : ''.'' + FILE_EXTENSION;
CMD=CMD + ''FNDLOAD $FDEBS_DB_USER/$FDEBS_DB_PASSWORD 0 Y UPLOAD  '' + CONTROL_FILE + '' '' + TARGET_LOCATION + FILE_NAME + VAR_EXT + '' - UPLOAD_MODE='' + UPLOAD_MODE + '' CUSTOM_MODE='' + CUSTOM_MODE + '';'';      
return CMD;' where OBJECT_ATTR_DEF_ID = 239;	
end;
/
commit;