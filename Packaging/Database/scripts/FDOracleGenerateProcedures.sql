CREATE OR REPLACE VIEW FD.VTESTAUTOMATIONRESULT
AS select test_run.project_id,
       test_run.environment_id, 
       test_run.instance_id, 
       test_run.project_stream_id, 
       test_run.test_type_id,
       Trunc(test_run.start_time, 'DD') test_date,
       ts.Test_set_id,
       ts.test_set_name,
       td.test_definition_id,
       td.test_definition_name,
       tr.test_case_name,
       tr.status,
       tr.duration,
       tr.MinRespTime,
       tr.MaxRespTime,
       tr.AvgRespTime,
       e.environment_name,
       e.environment_code,
       tdr.start_time,       
       f.folder_name
from Test_result tr, Test_definition_run tdr, Test_definition td, test_set_run tsr, Test_set ts, test_run, environment e, project p, folder f
where tr.test_definition_run_id = tdr.test_definition_run_id and
      tdr.Test_definition_id = td.Test_definition_id and
      tdr.test_set_run_id = tsr.test_set_run_id and
      tsr.test_set_id = ts.test_set_id and
      tsr.Test_run_id = test_run.Test_run_id and
      test_run.environment_id = e.environment_id and
      test_run.project_id = p.project_id and
      p.folder_id = f.folder_id
union all
  select arc_test_run.project_id,
       arc_test_run.environment_id, 
       arc_test_run.instance_id, 
       arc_test_run.project_stream_id, 
       arc_test_run.test_type_id,
       Trunc(arc_test_run.start_time, 'DD') test_date,
       ts.Test_set_id,
       ts.test_set_name,
       td.test_definition_id,
       td.test_definition_name,
       tr.test_case_name,
       tr.status,
       tr.duration,
       tr.MinRespTime,
       tr.MaxRespTime,
       tr.AvgRespTime,
       e.environment_name,
       e.environment_code,
       tdr.start_time,       
       f.folder_name
from arc_Test_result tr, arc_Test_definition_run tdr, Test_definition td, arc_test_set_run tsr, Test_set ts, arc_test_run, environment e, project p, folder f
where tr.test_definition_run_id = tdr.test_definition_run_id and
      tdr.Test_definition_id = td.Test_definition_id and
      tdr.test_set_run_id = tsr.test_set_run_id and
      tsr.test_set_id = ts.test_set_id and
      tsr.Test_run_id = arc_test_run.Test_run_id and
      arc_test_run.environment_id = e.environment_id and
      arc_test_run.project_id = p.project_id and
      p.folder_id = f.folder_id;

CREATE OR REPLACE VIEW FD.VPROJECTTASKTIMELINEALL
AS select we.WorkFlow_execution_id id,
       we.project_id,
       pw.project_workflow_type workflow_type,
       extract (hour from (we.end_time-we.start_time))*60 + extract (minute from (we.end_time-we.start_time))  duration,
       extract (hour from (we.end_time-we.start_time)) duration_hours,
       extract (minute from (we.end_time-we.start_time)) duration_minutes,
       we.start_time,
       we.end_time,
       cast(we.start_time as date) task_date,
       pw.workflow_id,
       Substr(we.execution_status,1,1) status,
       pv.project_version_name  project_version,
       env.environment_code,
       ins.instance_code,
       we.environment_id,
       we.instance_id,
       f.folder_name,
       p.project_name,
       w.workflow_name,
       p.folder_id,
       env_inst.env_inst_id,
       ps.stream_name
from Workflow_execution we, project_workflow pw, project_version pv, environment env, instance ins, folder f, project p, workflow w, environment_Instance env_inst,
     project_stream ps
where we.project_workflow_id = pw.project_workflow_id and
      we.project_version_id = pv.project_version_id and
      we.environment_id = env.environment_id and
      we.instance_id = ins.instance_id and
      we.project_id = p.project_id and
      p.folder_id = f.folder_id and
      pw.workflow_id = w.workflow_id and
      we.environment_id = env_inst.environment_id (+) and
      we.instance_id = env_inst.instance_id (+) and
      we.end_time is not null and
      we.start_time is not null and
      we.parent_workflow_execution_id is null and
      pv.project_stream_id = ps.project_stream_id (+) and
      w.workflow_type in ('BUILD', 'DEPLOY', 'TEST')
union all
  select we.WorkFlow_execution_id id,
       we.project_id,
       pw.project_workflow_type workflow_type,
       extract (hour from (we.end_time-we.start_time))*60 + extract (minute from (we.end_time-we.start_time))  duration,
       extract (hour from (we.end_time-we.start_time)) duration_hours,
       extract (minute from (we.end_time-we.start_time)) duration_minutes,
       we.start_time,
       we.end_time,
       cast(we.start_time as date) task_date,
       pw.workflow_id,
       Substr(we.execution_status,1,1) status,
       pv.project_version_name  project_version,
       env.environment_code,
       ins.instance_code,
       we.environment_id,
       we.instance_id,
       f.folder_name,
       p.project_name,
       w.workflow_name,
       p.folder_id,
       env_inst.env_inst_id,
       ps.stream_name
from ARC_Workflow_execution we, project_workflow pw, ARC_project_version pv, environment env, instance ins, folder f, project p, workflow w, environment_Instance env_inst,
     project_stream ps
where we.project_workflow_id = pw.project_workflow_id and
      we.project_version_id = pv.project_version_id and
      we.environment_id = env.environment_id and
      we.instance_id = ins.instance_id and
      we.project_id = p.project_id and
      p.folder_id = f.folder_id and
      pw.workflow_id = w.workflow_id and
      we.environment_id = env_inst.environment_id (+) and
      we.instance_id = env_inst.instance_id (+) and
      we.end_time is not null and
      we.start_time is not null and
      we.parent_workflow_execution_id is null and
      pv.project_stream_id = ps.project_stream_id (+) and    
      w.workflow_type in ('BUILD', 'DEPLOY', 'TEST');

CREATE OR REPLACE VIEW FD.VPROJECTTASKTIMELINE
AS select "ID","PROJECT_ID","WORKFLOW_TYPE","DURATION","DURATION_HOURS","DURATION_MINUTES","START_TIME","END_TIME","TASK_DATE","WORKFLOW_ID","STATUS","PROJECT_VERSION","ENVIRONMENT_CODE","INSTANCE_CODE","ENVIRONMENT_ID","INSTANCE_ID","FOLDER_NAME","PROJECT_NAME","WORKFLOW_NAME","FOLDER_ID","ENV_INST_ID","STREAM_NAME" from FD.VProjectTaskTimeLineAll
where workflow_type in ('BUILD', 'DEPLOY');

CREATE OR REPLACE VIEW FD.VCURRENTPROJECTTASK
AS select
       we.workflow_execution_id,
       we.project_id,
       we.project_workflow_id,
       we.start_time,
       we.execution_status,
       we.project_version_id,
       we.environment_id,
       we.instance_id,
       we.last_exec_id,
       we.last_exec_start_time,
       we.last_exec_end_time,
       we.last_exec_status,
       we.last_exec_environment_id,
       we.last_exec_instance_id,
       p.project_name,
       pw.workflow_id,
       w.workflow_type,
       w.workflow_name,
       extract (hour from (sysdate-we.start_time)) Duration_hours,
       extract (minute from (sysdate-we.start_time)) Duration_minutes,
       env_inst.env_inst_id,
       env.ENVIRONMENT_NAME,
       ins.instance_name,
       env.ENVIRONMENT_CODE,
       ins.INSTANCE_CODE,
       extract (hour from (we.last_exec_end_time-we.last_exec_start_time)) last_hour_duration,
       extract (minute from (we.last_exec_end_time-we.last_exec_start_time)) last_minute_duration,
       extract (hour from (sysdate - we.last_exec_end_time)) last_hour_ago,
       extract (minute from (sysdate - we.last_exec_end_time)) last_minute_ago,
       substr(we.last_exec_status,1,1) last_exec_state_id,
       last_env.ENVIRONMENT_NAME last_ENVIRONMENT_NAME,
       last_ins.instance_name last_instance_name,
       last_env.ENVIRONMENT_CODE last_ENVIRONMENT_CODE,
       last_ins.INSTANCE_CODE last_INSTANCE_CODE,
       pv.project_version_name project_version,
       f.folder_name,
       f.folder_id,
       (success_last_count/total_last_count)*100 SuccessRatio
from (
select workflow_execution_id,
       project_id,
       project_workflow_id,
       start_time,
       execution_status,
       project_version_id,
       environment_id,
       instance_id,
       LEAD(case when execution_status='Running' then null else workflow_execution_id end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_id,
       LEAD(case when execution_status='Running' then null else start_time end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_start_time,
       LEAD(case when execution_status='Running' then null else end_time end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_end_time,
       LEAD(case when execution_status='Running' then null else execution_status end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_status,
       LEAD(case when execution_status='Running' then null else environment_id end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_environment_id,
       LEAD(case when execution_status='Running' then null else instance_id end) ignore nulls OVER (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc) last_exec_instance_id,
       count(1)  over (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc
                                                                  ROWS BETWEEN CURRENT ROW AND 10 FOLLOWING) total_last_count,
       sum(decode(execution_status,'Failure',0,1)) over (PARTITION BY project_id,  project_workflow_id order by workflow_execution_id desc
                                                                  ROWS BETWEEN CURRENT ROW AND 10 FOLLOWING) success_last_count
from fd.workflow_execution
where parent_workflow_execution_id is null 
) we, fd.project p, fd.project_workflow pw, fd.workflow w, fd.environment_instance env_inst, fd.environment env, fd.instance ins,
      fd.environment last_env, fd.instance last_ins, fd.project_version pv, fd.folder f
where execution_status = 'Running' and
      we.project_id = p.PROJECT_ID AND
      we.project_workflow_id = pw.project_workflow_id and
      pw.workflow_id = w.workflow_id and
      we.environment_id = env.environment_id and
      we.instance_id = ins.instance_id and
      env_inst.environment_id = env.environment_id and
      env_inst.instance_id = ins.instance_id and
      we.last_exec_environment_id = last_env.environment_id (+) and
      we.last_exec_instance_id = last_ins.instance_id (+) and
      we.project_version_id = pv.project_version_id and
      p.folder_id = f.folder_id and
      w.workflow_type in ('BUILD', 'DEPLOY', 'TEST');

CREATE OR REPLACE VIEW FD.VAPPLICATIONSTATISTICS
AS select F.Folder_ID,
       F.FOLDER_NAME,
       Count(1) project_cnt,
       SuccessBuildRatio,
       SuccessDeployRatio
from (
select Folder_id,
       case when SuccessBuildCnt + FailBuildCnt > 0 then
         round((SuccessBuildCnt / (SuccessBuildCnt + FailBuildCnt))*100)
         else 0
       end SuccessBuildRatio,
       case when SuccessDeployCnt + FailDeployCnt > 0 then
         round((SuccessDeployCnt / (SuccessDeployCnt + FailDeployCnt))*100)
         else 0
       end SuccessDeployRatio
from (
select p.Folder_id,
       sum( case when WorkFlow_Type = 'BUILD' then
             decode(v.Status, 'S', 1, 0)
                 else 0
            end ) as SuccessBuildCnt,
       sum( case when WorkFlow_Type = 'BUILD' then
             decode(v.Status, 'F', 1, 0)
                 else 0
            end ) as FailBuildCnt,
       sum( case when WorkFlow_Type = 'DEPLOY' then
             decode(v.Status, 'S', 1, 0)
                 else 0
            end ) as SuccessDeployCnt,
       sum( case when WorkFlow_Type = 'DEPLOY' then
             decode(v.Status, 'F', 1, 0)
                 else 0
            end ) as FailDeployCnt
from VProjectTaskTimeLine v, Project P
where v.project_Id = p.project_id and
      v.status in ('S','F') 
group by p.Folder_id
))
ratio, Project P, Folder F
where p.Folder_Id = ratio.folder_Id (+) and
      p.Folder_Id = F.Folder_Id (+) and
      p.is_Active = 'Y'      
group by F.Folder_ID, F.FOLDER_NAME, SuccessBuildRatio, SuccessDeployRatio;

CREATE OR REPLACE PROCEDURE  FD.FLEX_ARCHIVE_PURGE_DELETE 
(vout_message1  OUT VARCHAR2,
 vout_message2  OUT VARCHAR2,
 vout_message3  OUT VARCHAR2,
 vout_message4  OUT VARCHAR2,
 vout_message5  OUT VARCHAR2,
 vout_message6  OUT VARCHAR2,
 vout_message7  OUT VARCHAR2,
 vout_message8  OUT VARCHAR2,
 vout_message9  OUT VARCHAR2,
 vout_message10 OUT VARCHAR2,
 vout_message11 OUT VARCHAR2,
 vout_message11a OUT VARCHAR2,
 vout_message12 OUT VARCHAR2,
 vout_message13 OUT VARCHAR2,
 vout_message14 OUT VARCHAR2,
 vout_message15 OUT VARCHAR2,
 vout_message16 OUT VARCHAR2,
 vout_message17 OUT VARCHAR2,
 vout_message18 OUT VARCHAR2,
 vout_message19 OUT VARCHAR2,
 vout_message20 OUT VARCHAR2,
 vout_message21 OUT VARCHAR2,
 vout_message22 OUT VARCHAR2,
 vout_message23 OUT VARCHAR2,
 vout_message24 OUT VARCHAR2,
 vout_message25 OUT VARCHAR2,
 vout_message26 OUT VARCHAR2)
IS
BEGIN
    vout_message1 := 'Purge will now delete the old rows from the archive tables, start time = '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');

    delete from FD.ARC_TEST_DEF_QUAL_VALUE b where exists (select b.TEST_DEF_QUALIFIER_VALUE_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr, FD.ARC_TEST_DEFINITION_RUN tdr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
      union
      select distinct   b.TEST_DEF_QUALIFIER_VALUE_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr, FD.ARC_TEST_DEFINITION_RUN tdr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
       );
    vout_message2 := TO_Char(SQL%ROWCOUNT)||' arc_test_def_qual_value rows deleted from archive tables.';
    
    delete from FD.ARC_TEST_RESULT b where exists (select b.TEST_RESULT_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr, FD.ARC_TEST_DEFINITION_RUN tdr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
      union
      select distinct   b.TEST_RESULT_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr, FD.ARC_TEST_DEFINITION_RUN tdr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
       );
    vout_message3 := TO_Char(SQL%ROWCOUNT)||' arc_test_result rows deleted from archive tables.';
    
    delete from FD.ARC_TEST_DEFINITION_RUN b where exists (select b.TEST_DEFINITION_RUN_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_DEFINITION_RUN_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       );
    vout_message4 := TO_Char(SQL%ROWCOUNT)||' arc_test_definition_run rows deleted from archive tables.';
    
    delete from FD.ARC_TEST_SET_QUALIFIER_VALUE b where exists (select b.TEST_SET_QUALIFIER_VALUE_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_SET_QUALIFIER_VALUE_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_TEST_SET_RUN tsr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       );
    vout_message5 := TO_Char(SQL%ROWCOUNT)||' arc_test_set_qualifier_value rows deleted from archive tables.';
    
    delete from FD.ARC_TEST_SET_RUN b where exists (select b.TEST_SET_RUN_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = b.test_run_id
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_SET_RUN_ID
      from FD.ARC_TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = b.test_run_id
       );
    vout_message6 := TO_Char(SQL%ROWCOUNT)||' arc_test_set_run rows deleted from archive tables.';
    
    delete from FD.ARC_TEST_RUN b where exists (select b.TEST_RUN_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_RUN_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
       );
    vout_message7 := TO_Char(SQL%ROWCOUNT)||' arc_test_run rows deleted from archive tables.';
        
    delete from FD.ARC_PLUGIN_EXEC_OUTPUT_VALUE b where exists (select peo.PLUGIN_EXECUTION_OUTPUT_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_PLUGIN_EXECUTION_OUTPUT peo
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and peo.PLUGIN_EXECUTION_OUTPUT_ID = b.PLUGIN_EXECUTION_OUTPUT_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID
       union select peo.PLUGIN_EXECUTION_OUTPUT_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we, FD.ARC_PLUGIN_EXECUTION_OUTPUT peo
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and peo.PLUGIN_EXECUTION_OUTPUT_ID = b.PLUGIN_EXECUTION_OUTPUT_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID);
    vout_message8 := TO_Char(SQL%ROWCOUNT)||' arc_plugin_exec_output_value rows deleted from archive tables.';
    
    
    delete from FD.ARC_PLUGIN_EXECUTION_OUTPUT b where exists (select pe.PLUGIN_EXECUTION_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.plugin_execution_id = b.plugin_execution_id
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID union
       select pe.PLUGIN_EXECUTION_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.plugin_execution_id = b.plugin_execution_id
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID);
    vout_message9 := TO_Char(SQL%ROWCOUNT)||' arc_plugin_execution_output rows deleted from archive tables.';
    
    delete from FD.ARC_PACKAGE_OBJECT_EXECUTION b where exists (select ppvk.package_object_execution_id from
      fd.purge_pkg_version_key ppvk where ppvk.PACKAGE_OBJECT_EXECUTION_ID = b.PACKAGE_OBJECT_EXECUTION_ID);
    vout_message10 := TO_Char(SQL%ROWCOUNT)||' package_object_execution rows deleted from operational tables.';  
      
    delete from FD.ARC_PLUGIN_EXECUTION_LOG b where exists (select pe.PLUGIN_EXECUTION_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = b.PLUGIN_EXECUTION_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID union
       select pe.PLUGIN_EXECUTION_ID
      from FD.ARC_PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = b.PLUGIN_EXECUTION_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID);
    vout_message11 := TO_Char(SQL%ROWCOUNT)||' arc_plugin_execution_log rows deleted from archive tables.';
    
    delete from FD.ARC_PACKAGE_OBJECT b where exists (select ppvk.package_object_id from
      fd.purge_pkg_version_key ppvk where ppvk.package_object_id = b.package_object_id);
    vout_message11a := TO_Char(SQL%ROWCOUNT)||' package_object_execution rows deleted from operational tables.';  
          
    delete from FD.ARC_PLUGIN_EXECUTION b where exists (select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.workflow_execution_id = b.workflow_execution_id union
      select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_REQUEST_ID = we.WORKFLOW_REQUEST_ID and we.workflow_execution_id = b.workflow_execution_id);
    vout_message12 := TO_Char(SQL%ROWCOUNT)||' arc_plugin_execution rows deleted from archive tables.';
    

    delete from FD.ARC_WORKFLOW_EXECUTION_DATA b where exists (select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.ARC_WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
      union select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.ARC_WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID);
    vout_message13 := TO_Char(SQL%ROWCOUNT)||' arc_workflow_execution_data rows deleted from archive tables.';
    
    
    delete from FD.ARC_WORKFLOW_EXECUTION b where exists (select ppv.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
      union
      select pfv.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
      );
    vout_message14 := TO_Char(SQL%ROWCOUNT)||' arc_workflow_execution rows deleted from archive tables.';
    
    
    delete from FD.ARC_WORKFLOW_REQUEST_INST b where exists (select wr.WORKFLOW_REQUEST_ID
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID and wr.workflow_request_id = b.workflow_request_id union
      select wr.WORKFLOW_REQUEST_ID
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.WORKFLOW_REQUEST_ID = pfv.WORKFLOW_REQUEST_ID and wr.workflow_request_id = b.workflow_request_id);
    vout_message15 := TO_Char(SQL%ROWCOUNT)||' arc_workflow_request_inst rows deleted from archive tables.';
    
    
    delete from FD.ARC_WORKFLOW_REQUEST_INPUT b where exists (select wr.WORKFLOW_REQUEST_ID
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID and wr.workflow_request_id = b.workflow_request_id union
      select wr.WORKFLOW_REQUEST_ID
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.WORKFLOW_REQUEST_ID = pfv.WORKFLOW_REQUEST_ID and wr.workflow_request_id = b.workflow_request_id);
    vout_message16 := TO_Char(SQL%ROWCOUNT)||' arc_workflow_request_input rows deleted from archive tables.';
    

    delete from FD.ARC_SCHEDULED_TASK b where exists (select *
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID and wr.workflow_request_id = b.workflow_request_id)
      or exists (select *
      from FD.ARC_FOLDER_REQUEST fr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where fr.folder_version_id = pfv.folder_VERSION_ID and fr.folder_request_id = pfv.folder_request_id
      and fr.folder_request_id = b.folder_request_id);
    vout_message17 := TO_Char(SQL%ROWCOUNT)||' arc_scheduled_task rows deleted from archive tables.';
    
        
    delete from FD.ARC_HUMAN_TASK b where exists (select *
      from FD.ARC_WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID)
      or exists (select *
      from FD.ARC_FOLDER_REQUEST fr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where fr.folder_version_id = pfv.FOLDER_VERSION_ID and fr.folder_request_id = pfv.folder_request_id
      and fr.FOLDER_REQUEST_ID = b.FOLDER_REQUEST_ID);
    vout_message18 := TO_Char(SQL%ROWCOUNT)||' arc_human_task rows deleted from archive tables.';
    
    
    delete from FD.ARC_WORKFLOW_REQUEST b where exists (select ppv.workflow_request_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.workflow_request_id = b.workflow_request_id union
      select pfv.workflow_request_id from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.workflow_request_id = b.workflow_request_id);
    vout_message19 := TO_Char(SQL%ROWCOUNT)||' arc_workflow_request rows deleted from archive tables.';
    
 
     delete from FD.ARC_FOLDER_REQUEST b where exists (select *
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.folder_version_id = b.folder_version_id);
    vout_message20 := TO_Char(SQL%ROWCOUNT)||' arc_folder_request rows deleted from archive tables.';
    

    delete from FD.ARC_FOLDER_PROJECT_VERSION b where exists (select *
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.folder_version_id= b.folder_version_id) 
      or exists (select *
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.project_version_id = b.project_version_id);
    vout_message21 := TO_Char(SQL%ROWCOUNT)||' arc_folder_project_version rows deleted from archive tables.';
    
          
    delete from FD.ARC_FOLDER_VERSION b where exists (select *
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.folder_version_id = b.folder_version_id);
    vout_message22 := TO_Char(SQL%ROWCOUNT)||' arc_folder_version rows deleted from archive tables.';
    
        
    delete from FD.ARC_PROJECT_VERSION_DATA_VAL b where exists (select *
    from FD.ARC_PROJECT_VERSION_DATA pvd, FD.PURGE_PROJ_VERSION_KEY ppv 
    where pvd.project_version_id = ppv.PROJECT_VERSION_ID and pvd.PROJECT_VERSION_DATA_ID = b.PROJECT_VERSION_DATA_ID);
    vout_message23 := TO_Char(SQL%ROWCOUNT)||' arc_project_version_data_val rows deleted from archive tables.';
        

    delete from FD.ARC_PROJECT_VERSION_DATA b where exists (select *
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.project_version_id = b.project_version_id);
    vout_message24 := TO_Char(SQL%ROWCOUNT)||' arc_project_version_data rows deleted from archive tables.';
    
  
    delete from FD.ARC_PROJECT_VERSION b where exists (select *
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.purge_artifacts_only = 'N' and ppv.project_version_id = b.project_version_id);
    vout_message25 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted from archive tables.';
    commit;

    vout_message26 := 'Purge has completed deleting the old rows from the archive tables, end time = '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
   
EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE  FD.FLEX_ARCHIVE_PURGE_IDENTIFY 
(vout_message1  OUT VARCHAR2,
 vout_message2  OUT VARCHAR2,
 vout_message3  OUT VARCHAR2,
 vout_message4  OUT VARCHAR2,
 vout_message5  OUT VARCHAR2,
 vout_message6  OUT VARCHAR2,
 vout_message7  OUT VARCHAR2,
 vout_message8  OUT VARCHAR2,
 vout_message9  OUT VARCHAR2,
 vout_message10 OUT VARCHAR2,
 vout_message10a OUT VARCHAR2,
 vout_message10b OUT VARCHAR2,
 vout_message10c OUT VARCHAR2,
 vout_message10d OUT VARCHAR2,
 vout_message10e OUT VARCHAR2,
 vout_message11 OUT VARCHAR2,
 vout_message12 OUT VARCHAR2,
 vout_message13 OUT VARCHAR2,
 vout_message14 OUT VARCHAR2,
 vout_message15 OUT VARCHAR2)
IS
   v_archive_retention_days      number;
BEGIN
    vout_message1 := 'Purge will now identify the old rows from the archive tables that can be purged, start time = '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    /* Load the parameters that drive the purge */
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_archive_retention_days
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'ARCHIVE_RETENTION_DAYS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'ARCHIVE_RETENTION_DAYS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message2 := 'Purge will retain '|| to_char(v_archive_retention_days) || ' days of data';

   /* Make sure the purge_proj_version_key table is empty */
   delete from FD.purge_proj_version_key;
   commit;
   vout_message3 := 'Purge cleaned up the purge key table';

   delete from FD.purge_pkg_version_key;
   commit;

   delete from FD.purge_folder_version_key;
   commit;
   vout_message4 := 'Purge cleaned up the folder purge key table';

   /* Put all possible project_version_id's as a starting point */
   insert into FD.purge_proj_version_key select
         project_id, environment_id, instance_id, project_version_id, workflow_request_id, null, workflow_execution_id, 'N'
         from FD.arc_workflow_execution union
         select   wr.project_id, wr.environment_id, null, wr.project_version_id, wr.workflow_request_id, null, we.workflow_execution_id, 'N'
         from FD.arc_workflow_request wr left outer join fd.arc_workflow_execution we
         on wr.workflow_request_id = we.workflow_request_id where we.workflow_request_id is null;
   vout_message5 := TO_Char(SQL%ROWCOUNT)||' project_version rows inserted.';
   commit;

   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_proj_version_key set age =
    (select trunc(sysdate) - trunc(coalesce(a.end_time, a.start_time, a.created_on)) from FD.arc_workflow_execution a
      where FD.purge_proj_version_key.workflow_execution_id = a.workflow_execution_id)
      where workflow_execution_id is not null;
    vout_message6 := TO_Char(SQL%ROWCOUNT)||' rows updated with the age in days of the workflow execution end time.';
    commit;

   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_proj_version_key set age =
    (select trunc(sysdate) - trunc(coalesce(a.requested_start_time, a.created_on)) from FD.arc_workflow_request a
      where FD.purge_proj_version_key.workflow_request_id = a.workflow_request_id
      and FD.purge_proj_version_key.workflow_execution_id is null)
    where workflow_execution_id is null;
    vout_message7 := TO_Char(SQL%ROWCOUNT)||' rows updated with the age in days of the workflow execution end time.';
    commit;

  /* Delete all project_versions where the any part of the project_version does not meet the artifact purge age requirement */
   delete from FD.purge_proj_version_key ppv where exists (select distinct project_version_id from
     (select project_version_id, min(age) from FD.purge_proj_version_key group by project_version_id
      having min(age) < v_archive_retention_days ) b where ppv.project_version_id = b.project_version_id);
   vout_message8 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge key table because nothing is eligible to be purged based on age.';
    commit;

  /* delete all project_versions that do not have their artifacts purged */
   delete from FD.purge_proj_version_key ppv where exists (select *
      from FD.arc_project_version b where ARTIFACTS_PURGED ='N' and ppv.project_version_id = b.project_version_id);
   vout_message9 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge key table because artifacts are not purged yet.';
    commit;

  /* Delete all project_versions that have a parent or child workflow that are not being purged */
  delete from FD.PURGE_PROJ_VERSION_KEY b where exists (
   select cwe.WORKFLOW_EXECUTION_ID
   from FD.ARC_WORKFLOW_EXECUTION cwe left outer join FD.PURGE_PROJ_VERSION_KEY child_ppvk
    on cwe.WORKFLOW_EXECUTION_ID = child_ppvk.WORKFLOW_EXECUTION_ID
    left outer join FD.PURGE_PROJ_VERSION_KEY parent_ppvk
    on cwe.PARENT_WORKFLOW_EXECUTION_ID = parent_ppvk.WORKFLOW_EXECUTION_ID
   where cwe.parent_workflow_execution_id is not null and (
    (child_ppvk.WORKFLOW_EXECUTION_ID is null and parent_ppvk.WORKFLOW_EXECUTION_ID is not null) or
    (child_ppvk.WORKFLOW_EXECUTION_ID is not null and parent_ppvk.WORKFLOW_EXECUTION_ID is null)) and cwe.workflow_execution_id = b.workflow_execution_id);
   vout_message10 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because parent or child is not elible.';
    commit;

    /*Populate the package version purge key table */
  insert into FD.purge_pkg_version_key
    select we.workflow_execution_id, we.execution_status, pe.plugin_execution_id, pe.plugin_execution_status,
    poe.package_object_execution_id, poe.execution_status as poe_execution_status,
    po.project_object_id, po.project_version_id, po.sequence_number, po.hash, poe.package_object_id
    from fd.arc_workflow_execution we, fd.arc_plugin_execution pe, fd.arc_package_object_execution poe,
      fd.arc_package_object po, fd.purge_proj_version_key pv
    where we.workflow_execution_id = pe.workflow_execution_id and
    pe.plugin_execution_id = poe.plugin_execution_id and
    poe.package_object_id = po.package_object_id and po.project_version_id = pv.project_version_id
    and we.workflow_execution_id in (select distinct workflow_execution_id from FD.PURGE_PROJ_VERSION_KEY);
  vout_message10a := TO_Char(SQL%ROWCOUNT)||' rows inserted into the purge_pkg_version_key table.';

   /* Keep the last x successfully deployed versions for a given project */
   delete from FD.purge_pkg_version_key ppvk where exists (
         select package_object_execution_id from FD.arc_package_object_execution poe
         where exists (
         select * from (
          select package_object_id, plugin_execution_id,
            RANK () OVER ( PARTITION BY  package_object_id
                      ORDER BY          plugin_execution_id     DESC
                    ) AS rnk
         from (select distinct package_object_id, plugin_execution_id from FD.arc_package_object_execution where execution_status = 'Success')
         order by package_object_id, plugin_execution_id)  a
         where a.rnk <= 5 and a.plugin_execution_id = poe.plugin_execution_id
           and a.package_object_id = poe.package_object_id) and ppvk.plugin_execution_id = poe.plugin_execution_id
           and ppvk.package_object_id = poe.package_object_id);
  vout_message10b := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep last 2 package versions.';
  commit;

  /*Delete package versions that are in different packages */
  delete from FD.purge_pkg_version_key ppvk where  exists (
         select poe.package_object_execution_id from FD.arc_package_object_execution poe, fd.arc_package_object po
         where exists (
         select * from (
          select project_object_id, project_version_id, plugin_execution_id,
            RANK () OVER ( PARTITION BY  project_object_id, project_version_id
                      ORDER BY          plugin_execution_id     DESC
                    ) AS rnk
         from (select distinct b.project_object_id, b.project_version_id, poe.plugin_execution_id
            from FD.arc_package_object_execution poe, fd.arc_package_object po,
           (select project_object_id, project_version_id, count(distinct package_object_id) cnt
           from fd.arc_package_object group by project_object_id, project_version_id
           having count(*) > 1) b
           where poe.execution_status = 'Success' and poe.package_object_id = po.package_object_id
           and po.project_object_id = b.project_object_id and po.project_version_id = b.project_version_id)
         order by project_object_id, project_version_id)  a
         where a.rnk <= 2 and a.plugin_execution_id = poe.plugin_execution_id
           and a.project_object_id = po.project_object_id)
           and ppvk.plugin_execution_id = poe.plugin_execution_id
           and ppvk.package_object_id = poe.package_object_id);
  vout_message10c := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep like packages.';
  commit;

  delete from FD.purge_pkg_version_key ppvk where not exists (select p.workflow_execution_id from
  fd.purge_proj_version_key p where p.workflow_execution_id = ppvk.workflow_execution_id);
  vout_message10d := TO_Char(SQL%ROWCOUNT)||' rows deleted that have workflow_executions that are not elible.';
  commit;

  /* Purge package object where not all package object executions are eligible */
  delete from fd.purge_pkg_version_key where package_object_id in (
    select distinct a.package_object_id from 
    (select poe.package_object_id, count(*) ecnt from fd.arc_package_object_execution poe, (select distinct package_object_execution_id 
    from fd.purge_pkg_version_key) ppvk
    where poe.package_object_execution_id = ppvk.package_object_execution_id group by poe.package_object_id) a,
    (select poe.package_object_id, count(*) pcnt from fd.arc_package_object_execution poe, (select distinct package_object_id from fd.purge_pkg_version_key) ppvk
    where poe.package_object_id = ppvk.package_object_id group by poe.package_object_id) b
    where a.package_object_id = b.package_object_id and ecnt <> pcnt);
  commit;

  /*Remove the project_version because it is needed for a package version */
  delete from fd.purge_proj_version_key pvk where exists (
  select po.project_version_id from fd.arc_package_object po where not exists (select project_version_id from
  fd.purge_pkg_version_key ppvk where ppvk.project_version_id = po.project_version_id) and pvk.project_version_id = po.project_version_id);
  vout_message10e := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep like packages.';
  commit;

    /*Populate the folder_Version purge key table */
  insert into FD.purge_folder_version_key (
   folder_id, folder_version_id, folder_request_id, environment_id, workflow_request_id, WORKFLOW_EXECUTION_ID, project_version_id)
   select fv.folder_id, fv.folder_version_id, fr.folder_request_id, fr.ENVIRONMENT_ID,
       wr.workflow_request_id, we.workflow_execution_id, fpv.project_version_id
    from FD.arc_folder_version fv, FD.arc_folder_request fr,
     FD.arc_workflow_request wr, FD.arc_workflow_execution we,
     FD.arc_folder_project_version fpv
    where fv.FOLDER_VERSION_ID = fr.FOLDER_VERSION_ID
     and fr.folder_request_id = wr.folder_request_id
     and wr.workflow_request_id = we.workflow_request_id
     and fv.folder_version_id = fpv.folder_version_id;
  vout_message11 := TO_Char(SQL%ROWCOUNT)||' rows inserted into the purge folder version key table.';
  commit;

  /*Delete any folder_Version's that can't be purged because pieces of it are not eligible to delete yet */
  delete from FD.purge_folder_version_key b where exists (
    select fv.folder_version_id
    from FD.arc_folder_version fv inner join FD.arc_folder_project_version fpv
    on fv.FOLDER_VERSION_ID = fpv.FOLDER_VERSION_ID left outer join
     FD.purge_proj_version_key ppvk on
     fpv.project_version_id = ppvk.project_version_id
     where ppvk.PROJECT_VERSION_ID is null and b.folder_version_id = fv.folder_version_id);
  vout_message12 := TO_Char(SQL%ROWCOUNT)||' rows deleted from the purge folder version key table because a project version is not eligible to be purged.';
  commit;

   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_folder_version_key set age =
    (select trunc(sysdate) - trunc(coalesce(a.end_time, a.start_time, a.created_on)) from FD.workflow_execution a
      where FD.purge_folder_version_key.workflow_execution_id = a.workflow_execution_id);
    vout_message13 := TO_Char(SQL%ROWCOUNT)||' rows updated with the and age older than the purge criteria.';
    commit;

  /* Delete all folder_versions where the any part of the folder_version does not meet the age requirement */
   delete from FD.purge_folder_version_key b where exists (select distinct folder_version_id from
     (select folder_version_id, min(age) from FD.purge_folder_version_key group by folder_version_id
      having min(age) < v_archive_retention_days) a where b.folder_version_id = a.folder_version_id);
   vout_message14 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because not all rows in the folder_version are elible due to age, end procedure: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    commit;

   update fd.arc_folder_version a set artifacts_purged = 'Y' where exists (select
      folder_version_id from fd.purge_folder_version_key pfv, (
      select project_version_id from fd.project_version pv where artifacts_purged = 'Y'
      union
      select project_version_id from fd.arc_project_version pv where artifacts_purged = 'Y') tt
      where pfv.project_version_id = tt.project_version_id and pfv.folder_version_id = a.folder_version_id)
     ;
     vout_message15 := TO_Char(SQL%ROWCOUNT)||' rows updated on arc_folder_version to indicated that all artifacts are now purged.';
     commit;


EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE   FD.FLEX_PURGE_ARCHIVE 
(vout_message1  OUT VARCHAR2,
 vout_message2  OUT VARCHAR2,
 vout_message3  OUT VARCHAR2,
 vout_message4  OUT VARCHAR2,
 vout_message5  OUT VARCHAR2,
 vout_message6 OUT VARCHAR2,
 vout_message7  OUT VARCHAR2,
 vout_message8  OUT VARCHAR2,
 vout_message9  OUT VARCHAR2,
 vout_message10  OUT VARCHAR2,
 vout_message11 OUT VARCHAR2,
 vout_message12 OUT VARCHAR2,
 vout_message13 OUT VARCHAR2,
 vout_message14 OUT VARCHAR2,
 vout_message15 OUT VARCHAR2,
 vout_message16 OUT VARCHAR2,
 vout_message17 OUT VARCHAR2,
 vout_message18 OUT VARCHAR2,
 vout_message19 OUT VARCHAR2,
 vout_message20 OUT VARCHAR2,
 vout_message21 OUT VARCHAR2,
 vout_message22 OUT VARCHAR2,
 vout_message23 OUT VARCHAR2,
 vout_message24 OUT VARCHAR2,
 vout_message25 OUT VARCHAR2,
 vout_message26 OUT VARCHAR2,
 vout_message27 OUT VARCHAR2,
 vout_message28 OUT VARCHAR2,
 vout_message29 OUT VARCHAR2,
 vout_message30 OUT VARCHAR2,
 vout_message31 OUT VARCHAR2)
IS
   v_retention_days      number;
   v_retention_days_oper number;
   v_keep_count            number;
   v_keep_success          number;
   v_keep_failed           number;
BEGIN
    /* Load the parameters that drive the purge */
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message1 :=  'Purge will retain '|| to_char(v_retention_days) || ' days of data, archiving starting at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days_oper
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS_OPERATIONAL'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS_OPERATIONAL config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message2 :=  'Purge will retain '|| to_char(v_retention_days_oper) || ' days of artifacts in operational tables';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_count
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_COUNT'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_COUNT config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message3 :=  'Purge will retain the last '|| to_char(v_keep_count) || ' successful project version deployments for each project in each environment regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_success
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_SUCCESS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_SUCCESS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message4 := 'Purge will retain the last '|| to_char(v_keep_success) || ' successful project version deployments for each project regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_failed
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_FAILED'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_FAILED config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message5 := 'Purge will retain the last '|| to_char(v_keep_success) || ' failed project version deployments for each project regardless of age';

    update fd.folder_version f set f.artifacts_purged = 'Y' where exists (select 
      * from fd.purge_folder_version_key pfv, (
      select project_version_id from fd.project_version pv where artifacts_purged = 'Y'
      union 
      select project_version_id from fd.arc_project_version pv where artifacts_purged = 'Y') tt
      where pfv.project_version_id = tt.project_version_id and pfv.folder_version_id = f.folder_version_id)
     ;
     commit;
     vout_message6 := TO_Char(SQL%ROWCOUNT)||' rows updated on folder_version to have artifacts_purged of Y because all project version artifacts are purged';
        
    insert into FD.ARC_PROJECT_VERSION (PROJECT_VERSION_ID, PROJECT_ID, PROJECT_VERSION_NAME, IS_ACTIVE, PROJECT_STREAM_ID,
       BUILD_SUCCESS_FLAG, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER, ARTIFACTS_PURGED, PACKAGE_NAME) 
       select distinct pv.project_version_id, pv.project_id, pv.project_version_name, pv.is_active, pv.project_stream_id, 
       pv.build_success_flag, pv.created_on, pv.created_by, pv.updated_on, pv.updated_by, pv.version_number, pv.ARTIFACTS_PURGED,
       pv.package_name
      from FD.PROJECT_VERSION pv, FD.PURGE_PROJ_VERSION_KEY ppv where pv.project_version_id = ppv.PROJECT_VERSION_ID 
       and ppv.purge_artifacts_only = 'N'
      union 
      select distinct pv.project_version_id, pv.project_id, pv.project_version_name, pv.is_active, pv.project_stream_id, 
       pv.build_success_flag, pv.created_on, pv.created_by, pv.updated_on, pv.updated_by, pv.version_number, pv.ARTIFACTS_PURGED,
       pv.package_name
      from FD.PROJECT_VERSION pv, FD.PURGE_FOLDER_VERSION_KEY pfv where pv.project_version_id = pfv.PROJECT_VERSION_ID 
       ;
    vout_message7 := TO_Char(SQL%ROWCOUNT)||' project_version rows inserted into the archive.';
    
    insert into FD.ARC_PROJECT_VERSION_DATA (PROJECT_VERSION_DATA_ID, PROJECT_VERSION_ID, PROJECT_VERSION_DATA_KEY,
      PASS_IN_CONTEXT, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER) select distinct pvd.PROJECT_VERSION_DATA_ID, pvd.PROJECT_VERSION_ID, pvd.PROJECT_VERSION_DATA_KEY,
      pvd.PASS_IN_CONTEXT, pvd.CREATED_ON, pvd.CREATED_BY, pvd.UPDATED_ON, pvd.UPDATED_BY, pvd.VERSION_NUMBER
      from FD.PROJECT_VERSION_DATA pvd, FD.PURGE_PROJ_VERSION_KEY ppv where pvd.project_version_id = ppv.PROJECT_VERSION_ID 
       and ppv.purge_artifacts_only = 'N'
      union 
      select distinct pvd.PROJECT_VERSION_DATA_ID, pvd.PROJECT_VERSION_ID, pvd.PROJECT_VERSION_DATA_KEY,
      pvd.PASS_IN_CONTEXT, pvd.CREATED_ON, pvd.CREATED_BY, pvd.UPDATED_ON, pvd.UPDATED_BY, pvd.VERSION_NUMBER
      from FD.PROJECT_VERSION_DATA pvd, FD.PURGE_FOLDER_VERSION_KEY pfv where pvd.project_version_id = pfv.PROJECT_VERSION_ID 
       ;
    vout_message8 := TO_Char(SQL%ROWCOUNT)||' project_version_data rows inserted into the archive.';

    insert into FD.ARC_PROJECT_VERSION_DATA_VAL (PROJECT_VERSION_DATA_VAL_ID, PROJECT_VERSION_DATA_ID, SEQUENCE_NUMBER,
      PROJECT_VERSION_DATA_VAL, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER) 
      select distinct pvdv.PROJECT_VERSION_DATA_VAL_ID, pvdv.PROJECT_VERSION_DATA_ID, pvdv.SEQUENCE_NUMBER,
      pvdv.PROJECT_VERSION_DATA_VAL_ID, pvdv.CREATED_ON, pvdv.CREATED_BY, pvdv.UPDATED_ON, pvdv.UPDATED_BY, pvdv.VERSION_NUMBER
    from FD.PROJECT_VERSION_DATA_VAL pvdv, FD.PROJECT_VERSION_DATA pvd, FD.PURGE_PROJ_VERSION_KEY ppv 
    where pvd.project_version_id = ppv.PROJECT_VERSION_ID and pvd.PROJECT_VERSION_DATA_ID = pvdv.PROJECT_VERSION_DATA_ID
       and ppv.purge_artifacts_only = 'N'
    union
    select distinct pvdv.PROJECT_VERSION_DATA_VAL_ID, pvdv.PROJECT_VERSION_DATA_ID, pvdv.SEQUENCE_NUMBER,
      pvdv.PROJECT_VERSION_DATA_VAL_ID, pvdv.CREATED_ON, pvdv.CREATED_BY, pvdv.UPDATED_ON, pvdv.UPDATED_BY, pvdv.VERSION_NUMBER
    from FD.PROJECT_VERSION_DATA_VAL pvdv, FD.PROJECT_VERSION_DATA pvd, FD.PURGE_FOLDER_VERSION_KEY pfv 
    where pvd.project_version_id = pfv.PROJECT_VERSION_ID and pvd.PROJECT_VERSION_DATA_ID = pvdv.PROJECT_VERSION_DATA_ID
    ;
    vout_message9 := TO_Char(SQL%ROWCOUNT)||' project_version_data_val rows inserted into the archive.';

    insert into FD.ARC_FOLDER_VERSION (FOLDER_VERSION_ID, FOLDER_ID, FOLDER_VERSION_NAME, IS_ACTIVE, CREATED_ON,
      CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER, ARTIFACTS_PURGED) 
      select distinct fv.FOLDER_VERSION_ID, fv.FOLDER_ID, fv.FOLDER_VERSION_NAME, fv.IS_ACTIVE,
      fv.CREATED_ON, fv.CREATED_BY, fv.UPDATED_ON, fv.UPDATED_BY, fv.VERSION_NUMBER, fv.ARTIFACTS_PURGED
      from FD.FOLDER_VERSION fv, FD.PURGE_FOLDER_VERSION_KEY pfv where fv.folder_version_id = pfv.FOLDER_VERSION_ID;
    vout_message10 := TO_Char(SQL%ROWCOUNT)||' folder_version rows inserted into the archive.';
        
    insert into FD.ARC_FOLDER_PROJECT_VERSION (FOLDER_PROJECT_VERSION_ID, FOLDER_VERSION_ID, PROJECT_VERSION_ID,
      PROJECT_ID, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER) 
      select distinct fpv.FOLDER_PROJECT_VERSION_ID, fpv.FOLDER_VERSION_ID, fpv.PROJECT_VERSION_ID,
      fpv.PROJECT_ID, fpv.CREATED_ON, fpv.CREATED_BY, fpv.UPDATED_ON, fpv.UPDATED_BY, fpv.VERSION_NUMBER
      from FD.FOLDER_PROJECT_VERSION fpv, FD.PURGE_FOLDER_VERSION_KEY pfv where fpv.folder_version_id = pfv.FOLDER_VERSION_ID union
      select distinct fpv.FOLDER_PROJECT_VERSION_ID, fpv.FOLDER_VERSION_ID, fpv.PROJECT_VERSION_ID,
      fpv.PROJECT_ID, fpv.CREATED_ON, fpv.CREATED_BY, fpv.UPDATED_ON, fpv.UPDATED_BY, fpv.VERSION_NUMBER
      from FD.FOLDER_PROJECT_VERSION fpv, FD.PURGE_FOLDER_VERSION_KEY ppv
      where fpv.folder_version_id = ppv.folder_VERSION_ID;
    vout_message11 := TO_Char(SQL%ROWCOUNT)||' folder_project_version rows inserted into the archive.';
        
    insert into FD.ARC_FOLDER_REQUEST (FOLDER_REQUEST_ID, FOLDER_ID, FOLDER_WORKFLOW_TYPE, FOLDER_VERSION_ID,
      ENVIRONMENT_ID, FORCE_DEPLOY, REQUESTED_START_TIME, END_TIME, IS_EXCEPTION, REQUEST_STATUS, CREATED_ON,
      CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER, STOP_ON_ERROR) 
      select distinct fr.FOLDER_REQUEST_ID, fr.FOLDER_ID, fr.FOLDER_WORKFLOW_TYPE, fr.FOLDER_VERSION_ID,
      fr.ENVIRONMENT_ID, fr.FORCE_DEPLOY, fr.REQUESTED_START_TIME, fr.END_TIME, fr.IS_EXCEPTION, fr.REQUEST_STATUS,
      fr.CREATED_ON, fr.CREATED_BY, fr.UPDATED_ON, fr.UPDATED_BY, fr.VERSION_NUMBER, fr.STOP_ON_ERROR
      from FD.FOLDER_REQUEST fr, FD.PURGE_FOLDER_VERSION_KEY pfv where fr.folder_version_id = pfv.FOLDER_VERSION_ID;
    vout_message12 := TO_Char(SQL%ROWCOUNT)||' folder_request rows inserted into the archive.';

    insert into FD.ARC_WORKFLOW_REQUEST (WORKFLOW_REQUEST_ID, FOLDER_REQUEST_ID, FOLDER_ID, PROJECT_VERSION_ID,
      PROJECT_WORKFLOW_ID, ENVIRONMENT_ID, FOLDER_VERSION_ID, FORCE_DEPLOY, REQUESTED_START_TIME, WORKFLOW_VERSION_OVERRIDE,
      IS_EXCEPTION, REQUEST_STATUS, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER, PROJECT_ID,
      PROJECT_STREAM_ID, TRIGGER_TYPE, FLEX_FIELD_1, FLEX_FIELD_2, FLEX_FIELD_3, FLEX_FIELD_4, FLEX_FIELD_5,
      FLEX_FIELD_6, FLEX_FIELD_7, FLEX_FIELD_8, FLEX_FIELD_9, FLEX_FIELD_10, PRIORITY, GROUP_REQUEST_ID, STOP_ON_PKG_ERROR)
      select distinct wr.WORKFLOW_REQUEST_ID, wr.FOLDER_REQUEST_ID, wr.FOLDER_ID, wr.PROJECT_VERSION_ID,
      wr.PROJECT_WORKFLOW_ID, wr.ENVIRONMENT_ID, wr.FOLDER_VERSION_ID, wr.FORCE_DEPLOY, wr.REQUESTED_START_TIME, wr.WORKFLOW_VERSION_OVERRIDE,
      wr.IS_EXCEPTION, wr.REQUEST_STATUS, wr.CREATED_ON, wr.CREATED_BY, wr.UPDATED_ON, wr.UPDATED_BY, wr.VERSION_NUMBER,
      wr.PROJECT_ID, wr.PROJECT_STREAM_ID, wr.TRIGGER_TYPE, wr.flex_field_1, wr.flex_field_2, wr.flex_field_3, wr.flex_field_4,
      wr.flex_field_5, wr.flex_field_6, wr.flex_field_7, wr.flex_field_8, wr.flex_field_9, wr.flex_field_10, wr.priority, wr.GROUP_REQUEST_ID, wr.STOP_ON_PKG_ERROR
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv where wr.workflow_request_id = ppv.workflow_request_id 
       and ppv.purge_artifacts_only = 'N'
              union
      select distinct wr.WORKFLOW_REQUEST_ID, wr.FOLDER_REQUEST_ID, wr.FOLDER_ID, wr.PROJECT_VERSION_ID,
      wr.PROJECT_WORKFLOW_ID, wr.ENVIRONMENT_ID, wr.FOLDER_VERSION_ID, wr.FORCE_DEPLOY, wr.REQUESTED_START_TIME, wr.WORKFLOW_VERSION_OVERRIDE,
      wr.IS_EXCEPTION, wr.REQUEST_STATUS, wr.CREATED_ON, wr.CREATED_BY, wr.UPDATED_ON, wr.UPDATED_BY, wr.VERSION_NUMBER,
      wr.PROJECT_ID, wr.PROJECT_STREAM_ID, wr.TRIGGER_TYPE, wr.flex_field_1, wr.flex_field_2, wr.flex_field_3, wr.flex_field_4,
      wr.flex_field_5, wr.flex_field_6, wr.flex_field_7, wr.flex_field_8, wr.flex_field_9, wr.flex_field_10, wr.priority, wr.GROUP_REQUEST_ID, wr.STOP_ON_PKG_ERROR
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv where wr.workflow_request_id = pfv.workflow_request_id ;
    vout_message13 := TO_Char(SQL%ROWCOUNT)||' workflow_request rows inserted into the archive.';
    
    insert into FD.ARC_HUMAN_TASK (TASK_ID, WORKFLOW_REQUEST_ID, FOLDER_REQUEST_ID, GROUP_ID, ENVIRONMENT_ID,
      TASK_STATUS, ACTION_ON, ACTION_BY, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER, external_id)
      select distinct ht.TASK_ID, ht.WORKFLOW_REQUEST_ID, ht.FOLDER_REQUEST_ID, ht.GROUP_ID,
      ht.ENVIRONMENT_ID, ht.TASK_STATUS, ht.ACTION_ON, ht.ACTION_BY, ht.CREATED_ON, ht.CREATED_BY, ht.UPDATED_ON,
      ht.UPDATED_BY, ht.VERSION_NUMBER, ht.external_id
      from FD.HUMAN_TASK ht, FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = ht.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct ht.TASK_ID, ht.WORKFLOW_REQUEST_ID, ht.FOLDER_REQUEST_ID, ht.GROUP_ID,
      ht.ENVIRONMENT_ID, ht.TASK_STATUS, ht.ACTION_ON, ht.ACTION_BY, ht.CREATED_ON, ht.CREATED_BY, ht.UPDATED_ON,
      ht.UPDATED_BY, ht.VERSION_NUMBER, ht.external_id
      from FD.HUMAN_TASK ht, FD.FOLDER_REQUEST fr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where fr.folder_version_id = pfv.folder_VERSION_ID and fr.folder_REQUEST_ID = ht.folder_REQUEST_ID 
        and fr.folder_request_id = pfv.folder_request_id;
    vout_message14 := TO_Char(SQL%ROWCOUNT)||' human_task rows inserted into the archive.';
    
    insert into FD.ARC_SCHEDULED_TASK (TASK_ID, WORKFLOW_REQUEST_ID, FOLDER_REQUEST_ID, ENVIRONMENT_ID, WINDOW_ID,
      SCHEDULED_TIME, OVERRIDE_FLAG, OVERRIDE_ON, OVERRIDE_BY, TASK_STATUS, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY,
      VERSION_NUMBER) select distinct st.TASK_ID, st.WORKFLOW_REQUEST_ID, st.FOLDER_REQUEST_ID, st.ENVIRONMENT_ID,
      st.WINDOW_ID, st.SCHEDULED_TIME, st.OVERRIDE_FLAG, st.OVERRIDE_ON, st.OVERRIDE_BY, st.TASK_STATUS, st.CREATED_ON, st.CREATED_BY,
      st.UPDATED_ON, st.UPDATED_BY, st.VERSION_NUMBER
      from FD.SCHEDULED_TASK st, FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = st.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N'
     union 
      select distinct st.TASK_ID, st.WORKFLOW_REQUEST_ID, st.FOLDER_REQUEST_ID, st.ENVIRONMENT_ID,
      st.WINDOW_ID, st.SCHEDULED_TIME, st.OVERRIDE_FLAG, st.OVERRIDE_ON, st.OVERRIDE_BY, st.TASK_STATUS, st.CREATED_ON, st.CREATED_BY,
      st.UPDATED_ON, st.UPDATED_BY, st.VERSION_NUMBER
      from FD.SCHEDULED_TASK st, FD.FOLDER_REQUEST fr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where fr.folder_request_id = pfv.FOLDER_request_ID and fr.folder_version_id = pfv.FOLDER_VERSION_ID and
        fr.folder_REQUEST_ID = st.folder_REQUEST_ID;
    vout_message15 := TO_Char(SQL%ROWCOUNT)||' scheduled_task rows inserted into the archive.';
    
    insert into FD.ARC_WORKFLOW_REQUEST_INPUT (WORKFLOW_REQUEST_ID, WORKFLOW_REQUEST_INPUT_KEY,
      WORKFLOW_REQUEST_INPUT_VALUE, CREATED_ON, CREATED_BY, IS_ENCRYPTED) 
      select distinct wri.WORKFLOW_REQUEST_ID, wri.WORKFLOW_REQUEST_INPUT_KEY,
      wri.WORKFLOW_REQUEST_INPUT_VALUE, wri.CREATED_ON, wri.CREATED_BY, wri.IS_ENCRYPTED
      from FD.WORKFLOW_REQUEST_INPUT wri, FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = wri.WORKFLOW_REQUEST_ID and ppv.workflow_request_id = wr.workflow_request_id
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct wri.WORKFLOW_REQUEST_ID, wri.WORKFLOW_REQUEST_INPUT_KEY,
      wri.WORKFLOW_REQUEST_INPUT_VALUE, wri.CREATED_ON, wri.CREATED_BY, wri.IS_ENCRYPTED
      from FD.WORKFLOW_REQUEST_INPUT wri, FD.WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.WORKFLOW_REQUEST_ID = wri.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = pfv.WORKFLOW_REQUEST_ID
      ;
    vout_message16 := TO_Char(SQL%ROWCOUNT)||' workflow_request_input rows inserted into the archive.';
    
    insert into FD.ARC_WORKFLOW_REQUEST_INST (WORKFLOW_REQUEST_ID, INSTANCE_ID, CREATED_ON, CREATED_BY) 
      select distinct wri.WORKFLOW_REQUEST_ID, wri.INSTANCE_ID,
      wri.CREATED_ON, wri.CREATED_BY
      from FD.WORKFLOW_REQUEST_INST wri, FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.WORKFLOW_REQUEST_ID = wri.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = ppv.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N'
       union
       select distinct wri.WORKFLOW_REQUEST_ID, wri.INSTANCE_ID,
      wri.CREATED_ON, wri.CREATED_BY
      from FD.WORKFLOW_REQUEST_INST wri, FD.WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.WORKFLOW_REQUEST_ID = wri.WORKFLOW_REQUEST_ID and wr.WORKFLOW_REQUEST_ID = pfv.WORKFLOW_REQUEST_ID;
    vout_message17 := TO_Char(SQL%ROWCOUNT)||' workflow_request_inst rows inserted into the archive.';
    
    insert into FD.ARC_WORKFLOW_EXECUTION (WORKFLOW_EXECUTION_ID, PARENT_WORKFLOW_EXECUTION_ID, WORKFLOW_REQUEST_ID,
      PROJECT_ID, PROJECT_VERSION_ID, PROJECT_WORKFLOW_ID, WORKFLOW_VERSION_ID, ENVIRONMENT_ID, INSTANCE_ID, 
      EXECUTION_STATUS, START_TIME, END_TIME, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct we.WORKFLOW_EXECUTION_ID, we.PARENT_WORKFLOW_EXECUTION_ID,
      we.WORKFLOW_REQUEST_ID, we.PROJECT_ID, we.PROJECT_VERSION_ID, we.PROJECT_WORKFLOW_ID, we.WORKFLOW_VERSION_ID,
      we.ENVIRONMENT_ID, we.INSTANCE_ID, we.EXECUTION_STATUS, we.START_TIME, we.END_TIME, we.CREATED_ON, we.CREATED_BY,
      we.UPDATED_ON, we.UPDATED_BY, we.VERSION_NUMBER
      from FD.WORKFLOW_EXECUTION we, FD.PURGE_PROJ_VERSION_KEY ppv 
      where we.WORKFLOW_EXECUTION_ID = ppv.WORKFLOW_EXECUTION_ID 
       and ppv.purge_artifacts_only = 'N'
      union
       select distinct we.WORKFLOW_EXECUTION_ID, we.PARENT_WORKFLOW_EXECUTION_ID,
      we.WORKFLOW_REQUEST_ID, we.PROJECT_ID, we.PROJECT_VERSION_ID, we.PROJECT_WORKFLOW_ID, we.WORKFLOW_VERSION_ID,
      we.ENVIRONMENT_ID, we.INSTANCE_ID, we.EXECUTION_STATUS, we.START_TIME, we.END_TIME, we.CREATED_ON, we.CREATED_BY,
      we.UPDATED_ON, we.UPDATED_BY, we.VERSION_NUMBER
      from FD.WORKFLOW_EXECUTION we, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID;
    vout_message18 := TO_Char(SQL%ROWCOUNT)||' workflow_execution rows inserted into the archive.';
    
    insert into FD.ARC_WORKFLOW_EXECUTION_DATA (WORKFLOW_EXECUTION_DATA_ID, WORKFLOW_EXECUTION_ID, SEQUENCE_NUMBER,
      WORKFLOW_EXECUTION_DATA, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct wed.WORKFLOW_EXECUTION_DATA_ID, wed.WORKFLOW_EXECUTION_ID,
      wed.SEQUENCE_NUMBER, wed.WORKFLOW_EXECUTION_DATA, wed.CREATED_ON, wed.CREATED_BY, wed.UPDATED_ON,
      wed.UPDATED_BY, wed.VERSION_NUMBER
      from FD.WORKFLOW_EXECUTION_DATA wed, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = wed.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct wed.WORKFLOW_EXECUTION_DATA_ID, wed.WORKFLOW_EXECUTION_ID,
      wed.SEQUENCE_NUMBER, wed.WORKFLOW_EXECUTION_DATA, wed.CREATED_ON, wed.CREATED_BY, wed.UPDATED_ON,
      wed.UPDATED_BY, wed.VERSION_NUMBER
      from FD.WORKFLOW_EXECUTION_DATA wed, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = wed.WORKFLOW_EXECUTION_ID;
    vout_message19 := TO_Char(SQL%ROWCOUNT)||' workflow_execution_data rows inserted into the archive.';
    
    insert into FD.ARC_PLUGIN_EXECUTION (PLUGIN_EXECUTION_ID, ENDPOINT_ID, WORKFLOW_EXECUTION_ID, PLUGIN_EXECUTION_STATUS,
      PERCENT_PROGRESS, PLUGIN_EXECUTION_ERROR_DATA, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct pe.PLUGIN_EXECUTION_ID, pe.ENDPOINT_ID, pe.WORKFLOW_EXECUTION_ID,
      pe.PLUGIN_EXECUTION_STATUS, pe.PERCENT_PROGRESS, pe.PLUGIN_EXECUTION_ERROR_DATA, pe.CREATED_ON, pe.CREATED_BY,
      pe.UPDATED_ON, pe.UPDATED_BY, pe.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
       union
       select distinct pe.PLUGIN_EXECUTION_ID, pe.ENDPOINT_ID, pe.WORKFLOW_EXECUTION_ID,
      pe.PLUGIN_EXECUTION_STATUS, pe.PERCENT_PROGRESS, pe.PLUGIN_EXECUTION_ERROR_DATA, pe.CREATED_ON, pe.CREATED_BY,
      pe.UPDATED_ON, pe.UPDATED_BY, pe.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID;
    vout_message20 := TO_Char(SQL%ROWCOUNT)||' plugin_execution rows inserted into the archive.';
    
    insert into FD.ARC_PLUGIN_EXECUTION_LOG (PLUGIN_EXECUTION_LOG_ID, PLUGIN_EXECUTION_ID, ENDPOINT_ID, 
      SEQUENCE_NUMBER, PLUGIN_EXECUTION_LOG, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct pel.PLUGIN_EXECUTION_LOG_ID, pel.PLUGIN_EXECUTION_ID,
      pel.ENDPOINT_ID, pel.SEQUENCE_NUMBER, pel.PLUGIN_EXECUTION_LOG, pel.CREATED_ON, pel.CREATED_BY,
      pel.UPDATED_ON, pel.UPDATED_BY, pel.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_LOG pel
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = pel.PLUGIN_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
       union
       select distinct pel.PLUGIN_EXECUTION_LOG_ID, pel.PLUGIN_EXECUTION_ID,
      pel.ENDPOINT_ID, pel.SEQUENCE_NUMBER, pel.PLUGIN_EXECUTION_LOG, pel.CREATED_ON, pel.CREATED_BY,
      pel.UPDATED_ON, pel.UPDATED_BY, pel.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_LOG pel
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = pel.PLUGIN_EXECUTION_ID;
    vout_message21 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_log rows inserted into the archive.';
    
    insert into FD.ARC_PLUGIN_EXECUTION_OUTPUT (PLUGIN_EXECUTION_OUTPUT_ID, PLUGIN_EXECUTION_ID, ENDPOINT_ID,
      OUTPUT_KEY_NAME, INSTANCE_ID, ENVIRONMENT_ID, PROJECT_ID, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY,
      VERSION_NUMBER) select distinct peo.PLUGIN_EXECUTION_OUTPUT_ID, peo.PLUGIN_EXECUTION_ID,
      peo.ENDPOINT_ID, peo.OUTPUT_KEY_NAME, peo.INSTANCE_ID, peo.ENVIRONMENT_ID, peo.PROJECT_ID, peo.CREATED_ON,
      peo.CREATED_BY, peo.UPDATED_ON, peo.UPDATED_BY, peo.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct peo.PLUGIN_EXECUTION_OUTPUT_ID, peo.PLUGIN_EXECUTION_ID,
      peo.ENDPOINT_ID, peo.OUTPUT_KEY_NAME, peo.INSTANCE_ID, peo.ENVIRONMENT_ID, peo.PROJECT_ID, peo.CREATED_ON,
      peo.CREATED_BY, peo.UPDATED_ON, peo.UPDATED_BY, peo.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID;
    vout_message22 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_output rows inserted into the archive.';
    
    insert into FD.ARC_PLUGIN_EXEC_OUTPUT_VALUE (PLUGIN_EXECUTION_OP_VALUE_ID, PLUGIN_EXECUTION_OUTPUT_ID, 
      SEQUENCE_NUMBER, OUTPUT_VALUE, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct peov.PLUGIN_EXECUTION_OP_VALUE_ID, peov.PLUGIN_EXECUTION_OUTPUT_ID,
      peov.SEQUENCE_NUMBER, peov.OUTPUT_VALUE, peov.CREATED_ON, peov.CREATED_BY, peov.UPDATED_ON, peov.UPDATED_BY, peov.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo, FD.PLUGIN_EXECUTION_OUTPUT_VALUE peov
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID
       and peo.PLUGIN_EXECUTION_OUTPUT_ID = peov.PLUGIN_EXECUTION_OUTPUT_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct peov.PLUGIN_EXECUTION_OP_VALUE_ID, peov.PLUGIN_EXECUTION_OUTPUT_ID,
      peov.SEQUENCE_NUMBER, peov.OUTPUT_VALUE, peov.CREATED_ON, peov.CREATED_BY, peov.UPDATED_ON, peov.UPDATED_BY, peov.VERSION_NUMBER
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo, FD.PLUGIN_EXECUTION_OUTPUT_VALUE peov
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID
       and peo.PLUGIN_EXECUTION_OUTPUT_ID = peov.PLUGIN_EXECUTION_OUTPUT_ID;
    vout_message23 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_output_value rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
        
    insert into FD.ARC_TEST_RUN (TEST_RUN_ID, PROJECT_ID, ENVIRONMENT_ID, INSTANCE_ID, PROJECT_STREAM_ID,
      TEST_TYPE_ID, TEST_SET_ID, TEST_DEFINITION_ID, WORKFLOW_EXECUTION_ID, STATUS, START_TIME, END_TIME)
      select distinct tr.test_run_id, tr.PROJECT_ID, tr.ENVIRONMENT_ID, tr.INSTANCE_ID, tr.PROJECT_STREAM_ID,
      tr.TEST_TYPE_ID, tr.TEST_SET_ID, tr.TEST_DEFINITION_ID, tr.WORKFLOW_EXECUTION_ID, tr.STATUS, tr.START_TIME, tr.END_TIME
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct tr.test_run_id, tr.PROJECT_ID, tr.ENVIRONMENT_ID, tr.INSTANCE_ID, tr.PROJECT_STREAM_ID,
      tr.TEST_TYPE_ID, tr.TEST_SET_ID, tr.TEST_DEFINITION_ID, tr.WORKFLOW_EXECUTION_ID, tr.STATUS, tr.START_TIME, tr.END_TIME
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID;
    vout_message24 := TO_Char(SQL%ROWCOUNT)||' test_run rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
        
    insert into FD.ARC_TEST_SET_RUN (TEST_SET_RUN_ID, TEST_SET_ID, STATUS, START_TIME, END_TIME, TEST_RUN_ID)
      select distinct tsr.TEST_SET_RUN_ID, tsr.TEST_SET_ID, tsr.STATUS, tsr.START_TIME, tsr.END_TIME, tsr.TEST_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct tsr.TEST_SET_RUN_ID, tsr.TEST_SET_ID, tsr.STATUS, tsr.START_TIME, tsr.END_TIME, tsr.TEST_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id;
    vout_message25 := TO_Char(SQL%ROWCOUNT)||' test_set_run rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
        
    insert into FD.ARC_TEST_SET_QUALIFIER_VALUE (TEST_SET_QUALIFIER_VALUE_ID, TEST_SET_RUN_ID, TEST_QUALIFIER_ID,
      QUALIFIER_VALUE)
      select distinct tsqv.TEST_SET_QUALIFIER_VALUE_ID, tsqv.TEST_SET_RUN_ID, tsqv.TEST_QUALIFIER_ID, tsqv.QUALIFIER_VALUE
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_SET_QUALIFIER_VALUE tsqv
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tsqv.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct tsqv.TEST_SET_QUALIFIER_VALUE_ID, tsqv.TEST_SET_RUN_ID, tsqv.TEST_QUALIFIER_ID, tsqv.QUALIFIER_VALUE
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_SET_QUALIFIER_VALUE tsqv
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tsqv.TEST_SET_RUN_ID;
    vout_message26 := TO_Char(SQL%ROWCOUNT)||' test_set_qualifier_value rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
        
    insert into FD.ARC_TEST_DEFINITION_RUN (TEST_DEFINITION_RUN_ID, TEST_SET_RUN_ID, TEST_DEFINITION_ID,
      WORKFLOW_EXECUTION_ID, STATUS, START_TIME, END_TIME, ENDPOINT_ID) 
      select distinct tdr.TEST_DEFINITION_RUN_ID, tdr.TEST_SET_RUN_ID, tdr.TEST_DEFINITION_ID,
      tdr.WORKFLOW_EXECUTION_ID, tdr.STATUS, tdr.START_TIME, tdr.END_TIME, tdr.ENDPOINT_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct  tdr.TEST_DEFINITION_RUN_ID, tdr.TEST_SET_RUN_ID, tdr.TEST_DEFINITION_ID,
      tdr.WORKFLOW_EXECUTION_ID, tdr.STATUS, tdr.START_TIME, tdr.END_TIME, tdr.ENDPOINT_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID;
    vout_message27 := TO_Char(SQL%ROWCOUNT)||' test_definition_run rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
    /* NULL is because output_Data is a clob, need to handle in the future */
    insert into FD.ARC_TEST_RESULT (TEST_RESULT_ID, TEST_CASE_NAME, DURATION, STATUS, MESSAGE, OUTPUT_DATA,
      MINRESPTIME, MAXRESPTIME, AVGRESPTIME, TEST_DEFINITION_RUN_ID, EXECUTION_COUNT)
      select distinct tr1.TEST_RESULT_ID, tr1.TEST_CASE_NAME, tr1.DURATION, tr1.STATUS, tr1.MESSAGE, NULL, tr1.MINRESPTIME, 
      tr1.MAXRESPTIME, tr1.AVGRESPTIME, tr1.TEST_DEFINITION_RUN_ID, tr1.EXECUTION_COUNT
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr, FD.TEST_RESULT tr1
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = tr1.TEST_DEFINITION_RUN_ID
      union
      select distinct   tr1.TEST_RESULT_ID, tr1.TEST_CASE_NAME, tr1.DURATION, tr1.STATUS, tr1.MESSAGE, NULL, tr1.MINRESPTIME, 
      tr1.MAXRESPTIME, tr1.AVGRESPTIME, tr1.TEST_DEFINITION_RUN_ID, tr1.EXECUTION_COUNT
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr, FD.TEST_RESULT tr1
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = tr1.TEST_DEFINITION_RUN_ID;
    vout_message28 := TO_Char(SQL%ROWCOUNT)||' test_result rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
        
    insert into FD.ARC_TEST_DEF_QUAL_VALUE (TEST_DEF_QUALIFIER_VALUE_ID, TEST_DEFINITION_RUN_ID,
      TEST_QUALIFIER_ID, QUALIFIER_VALUE) select distinct tdqv.TEST_DEF_QUALIFIER_VALUE_ID, tdqv.TEST_DEFINITION_RUN_ID, 
      tdqv.TEST_QUALIFIER_ID, tdqv.QUALIFIER_VALUE
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr, FD.TEST_DEF_QUALIFIER_VALUE tdqv
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = tdqv.TEST_DEFINITION_RUN_ID
      union
      select distinct   tdqv.TEST_DEF_QUALIFIER_VALUE_ID, tdqv.TEST_DEFINITION_RUN_ID, 
      tdqv.TEST_QUALIFIER_ID, tdqv.QUALIFIER_VALUE
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr, FD.TEST_DEF_QUALIFIER_VALUE tdqv
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = tdqv.TEST_DEFINITION_RUN_ID;
    vout_message29 := TO_Char(SQL%ROWCOUNT)||' test_def_qualifier_value rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');

    insert into FD.ARC_PACKAGE_OBJECT (PACKAGE_OBJECT_ID, PROJECT_OBJECT_ID, PROJECT_VERSION_ID, SEQUENCE_NUMBER, HASH, CREATED_ON, CREATED_BY)
      select distinct po.PACKAGE_OBJECT_ID, po.PROJECT_OBJECT_ID, po.PROJECT_VERSION_ID, po.SEQUENCE_NUMBER, po.HASH, po.CREATED_ON, po.CREATED_BY
      from FD.PACKAGE_OBJECT po, FD.PURGE_PKG_VERSION_KEY ppvk
      where ppvk.PACKAGE_OBJECT_ID = po.PACKAGE_OBJECT_ID
    ;
    vout_message30 := TO_Char(SQL%ROWCOUNT)||' package_object rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
    insert into FD.ARC_PACKAGE_OBJECT_EXECUTION (PACKAGE_OBJECT_EXECUTION_ID, PLUGIN_EXECUTION_ID, ENDPOINT_ID, PACKAGE_OBJECT_ID, 
      EXECUTION_STATUS, START_TIME, END_TIME, CREATED_ON, CREATED_BY, UPDATED_ON, UPDATED_BY, VERSION_NUMBER)
      select distinct poe.PACKAGE_OBJECT_EXECUTION_ID, poe.PLUGIN_EXECUTION_ID, poe.ENDPOINT_ID, poe.PACKAGE_OBJECT_ID, poe.EXECUTION_STATUS, 
      poe.START_TIME, poe.END_TIME, poe.CREATED_ON, poe.CREATED_BY, poe.UPDATED_ON, poe.UPDATED_BY, poe.VERSION_NUMBER
      from FD.PACKAGE_OBJECT_EXECUTION poe, FD.PURGE_PKG_VERSION_KEY ppvk
      where ppvk.PACKAGE_OBJECT_EXECUTION_ID = poe.PACKAGE_OBJECT_EXECUTION_ID
    ;
    vout_message31 := TO_Char(SQL%ROWCOUNT)||' package_object_execution rows inserted into the archive archive completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE  FD.FLEX_PURGE_IDENTIFY 
(vout_message1  OUT VARCHAR2,
 vout_message2  OUT VARCHAR2,
 vout_message3  OUT VARCHAR2,
 vout_message4  OUT VARCHAR2,
 vout_message5  OUT VARCHAR2,
 vout_message6  OUT VARCHAR2,
 vout_message7  OUT VARCHAR2,
 vout_message8  OUT VARCHAR2,
 vout_message9  OUT VARCHAR2,
 vout_message10 OUT VARCHAR2,
 vout_message11 OUT VARCHAR2,
 vout_message12 OUT VARCHAR2,
 vout_message13 OUT VARCHAR2,
 vout_message14 OUT VARCHAR2,
 vout_message15 OUT VARCHAR2,
 vout_message16 OUT VARCHAR2,
 vout_message17 OUT VARCHAR2,
 vout_message18 OUT VARCHAR2,
 vout_message19 OUT VARCHAR2,
 vout_message20 OUT VARCHAR2,
 vout_message21 OUT VARCHAR2,
 vout_message22 OUT VARCHAR2,
 vout_message23 OUT VARCHAR2,
 vout_message24 OUT VARCHAR2,
 vout_message25 OUT VARCHAR2,
 vout_message26 OUT VARCHAR2,
 vout_message27 OUT VARCHAR2,
 vout_message28 OUT VARCHAR2,
 vout_message29 OUT VARCHAR2,
 vout_message30 OUT VARCHAR2,
 vout_message31 OUT VARCHAR2,
 vout_message32 OUT VARCHAR2,
 vout_message33 OUT VARCHAR2,
 vout_message34 OUT VARCHAR2,
 vout_message35 OUT VARCHAR2,
 vout_message36 OUT VARCHAR2,
 vout_message37 OUT VARCHAR2)
IS
   v_retention_days      number;
   v_retention_days_oper number;
   v_keep_count            number;
   v_keep_success          number;
   v_keep_failed           number;
BEGIN
    /* Load the parameters that drive the purge */
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message1 := 'Purge will retain '|| to_char(v_retention_days) || ' days of data; identify starting at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days_oper
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS_OPERATIONAL'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS_OPERATIONAL config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message2 := 'Purge will retain '|| to_char(v_retention_days_oper) || ' days of artifacts in operational tables';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_count
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_COUNT'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_COUNT config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message3 := 'Purge will retain the last '|| to_char(v_keep_count) || ' successful project version deployments for each project in each environment regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_success
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_SUCCESS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_SUCCESS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message4 := 'Purge will retain the last '|| to_char(v_keep_success) || ' successful project version deployments for each project regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_failed
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_FAILED'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_FAILED config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message5 := 'Purge will retain the last '|| to_char(v_keep_failed) || ' failed project version deployments for each project regardless of age';

   /* Make sure the purge_proj_version_key table is empty */
   delete from FD.purge_proj_version_key;
   commit;
   vout_message6 := 'Purge cleaned up the purge key table';
   
   delete from FD.purge_folder_version_key;
   commit;
   vout_message7 := 'Purge cleaned up the folder purge key table';
   
   /* Make sure the artifiacts purged flag is N for any rows missing the value */
   update fd.project_version set artifacts_purged = 'N' where artifacts_purged is null;
   commit;
   vout_message8 := TO_Char(SQL%ROWCOUNT)||' project_version rows artifacts_purged flags set to N because it was null.';

   update fd.folder_version set artifacts_purged = 'N' where artifacts_purged is null;
   commit;
   vout_message9 := TO_Char(SQL%ROWCOUNT)||' folder_version rows artifacts_purged flags set to N because it was null.';
   
   /* Put all possible project_version_id's as a starting point */
   insert into FD.purge_proj_version_key select 
         project_id, environment_id, instance_id, project_version_id, workflow_request_id, null, workflow_execution_id, 'N'
         from FD.workflow_execution where execution_status in ('Success', 'Failure') union
         select   wr.project_id, wr.environment_id, null, wr.project_version_id, wr.workflow_request_id, null, we.workflow_execution_id, 'N'
         from FD.workflow_request wr left outer join fd.workflow_execution we 
         on wr.workflow_request_id = we.workflow_request_id where we.workflow_request_id is null;
   vout_message10 :=  TO_Char(SQL%ROWCOUNT)||' project_version rows inserted.';
   commit;
   
   /* Delete/Keep the workflow_requests that are currently deployed to any environment */
   delete from FD.purge_proj_version_key ppv where exists (
         select a.project_version_id from FD.workflow_execution a, 
          (select project_id, environment_id, instance_id, max(WORKFLOW_REQUEST_ID) as current_wrk_flow_req_id
          from FD.workflow_execution where execution_status = 'Success' group by project_id, environment_id, instance_id
          ) b where a.workflow_request_id = b.current_wrk_flow_req_id and a.project_version_id = ppv.project_version_id);
   vout_message11 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted because they are currently deployed.';
   commit;
   
   /* Delete workflow_executions needs because of package_obj_current_status */
   delete from fd.purge_proj_version_key pvk where exists (
      select w.workflow_execution_id from fd.workflow_execution w where exists 
     (select workflow_execution_id from fd.package_obj_current_status s where s.workflow_execution_id = w.workflow_execution_id)
     and w.workflow_execution_id = pvk.workflow_execution_id);
  commit;

   /* Keep the last x successfully deployed versions for a given project/environment/instance */
   delete from FD.purge_proj_version_key ppv where exists ( 
         select project_version_id from (
          select project_id, environment_id, instance_id, project_version_id, WORKFLOW_REQUEST_ID,
            RANK () OVER ( PARTITION BY  project_id, environment_id, instance_id
                      ORDER BY          end_time     DESC
                    ) AS rnk
         from FD.workflow_execution where execution_status = 'Success') a
         where a.rnk <= v_keep_count and a.project_version_id = ppv.project_version_id);
   vout_message12 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted because they are the last '|| v_keep_count || ' successfully in any environment deployed.';
   commit;

   /* Keep the last x successfully deployed versions for a given project */
   delete from FD.purge_proj_version_key ppv where  exists ( 
         select project_version_id from FD.workflow_execution we
         where exists (
         select WORKFLOW_REQUEST_ID from (
          select project_id, WORKFLOW_REQUEST_ID,
            RANK () OVER ( PARTITION BY  project_id
                      ORDER BY          workflow_request_id     DESC
                    ) AS rnk
         from (select distinct workflow_request_id, project_id from FD.workflow_execution where execution_status = 'Success')
         order by WORKFLOW_REQUEST_ID, project_id)  a
         where a.rnk <= v_keep_success and a.workflow_request_id = we.workflow_request_id) and ppv.project_version_id = we.project_version_id);
   vout_message13 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted because they are the last '|| v_keep_success ||' successfully deployed.';
   commit;

   /* Keep the last x failed project versions for a given project */
   delete from FD.purge_proj_version_key ppv where  exists (
        select project_version_id from FD.workflow_execution we
         where exists (
         select WORKFLOW_REQUEST_ID from (
          select project_id, WORKFLOW_REQUEST_ID, 
            RANK () OVER ( PARTITION BY  project_id
                      ORDER BY          workflow_request_id     DESC
                    ) AS rnk
         from (select distinct project_id, workflow_request_id from FD.workflow_execution where execution_status = 'Failure')
         order by WORKFLOW_REQUEST_ID, project_id) a
         where a.rnk <= v_keep_failed and a.workflow_request_id = we.workflow_request_id) and we.project_version_id = ppv.project_version_id);
   vout_message14 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted because they are the last '||v_keep_failed||' failed deployments.';
   commit;

  /* Delete project versions that have workflow requests that are not completed or failed */
  delete from fd.purge_proj_version_key where project_version_id in (
    select project_version_id from fd.workflow_request where request_status not in ('COMPLETED','FAILED'));
   vout_message15 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted because they are not in a completed or failed status.';
  commit;
    
   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_proj_version_key set age = 
    (select trunc(sysdate) - trunc(coalesce(a.end_time, a.start_time, a.created_on)) from FD.workflow_execution a
      where FD.purge_proj_version_key.workflow_execution_id = a.workflow_execution_id)
    where workflow_execution_id is not null;
    vout_message16 := TO_Char(SQL%ROWCOUNT)||' rows updated with the age in days of the workflow execution end time.';
    commit;
 
   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_proj_version_key set age = 
    (select trunc(sysdate) - trunc(coalesce(a.requested_start_time, a.created_on)) from FD.workflow_request a
      where FD.purge_proj_version_key.workflow_request_id = a.workflow_request_id
      and FD.purge_proj_version_key.workflow_execution_id is null)
    where workflow_execution_id is null;
    vout_message17 := TO_Char(SQL%ROWCOUNT)||' rows updated with the age in days of the workflow request end time.';
    commit;
    
  /* Delete all project_versions where the any part of the project_version does not meet the artifact purge age requirement */
   delete from FD.purge_proj_version_key ppv where exists (select distinct project_version_id from 
     (select project_version_id, min(age) from FD.purge_proj_version_key group by project_version_id
      having min(age) < v_retention_days_oper ) a where a.project_version_id = ppv.project_version_id);
   vout_message18 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge key table because nothing is eligible to be purged based on age.';
    commit;
    
  /* Update all project_versions to indicate which ones will have the operational artifacts purged */
   update FD.purge_proj_version_key ppv set PURGE_ARTIFACTS_ONLY ='Y' where exists (select distinct project_version_id from 
     (select project_version_id, min(age) from FD.purge_proj_version_key group by project_version_id
      having min(age) < v_retention_days ) a where a.project_version_id = ppv.project_version_id );
   vout_message19 := TO_Char(SQL%ROWCOUNT)||' rows updated to indicate the only the artifacts are eligible to be purged.';
    commit;
    
  /* Delete all project_versions that have a parent or child workflow that are not being purged */
  delete from FD.PURGE_PROJ_VERSION_KEY ppv where exists (
   select cwe.WORKFLOW_EXECUTION_ID
   from FD.WORKFLOW_EXECUTION cwe left outer join FD.PURGE_PROJ_VERSION_KEY child_ppvk
    on cwe.WORKFLOW_EXECUTION_ID = child_ppvk.WORKFLOW_EXECUTION_ID
    left outer join FD.PURGE_PROJ_VERSION_KEY parent_ppvk
    on cwe.PARENT_WORKFLOW_EXECUTION_ID = parent_ppvk.WORKFLOW_EXECUTION_ID
   where cwe.parent_workflow_execution_id is not null and (
    (child_ppvk.WORKFLOW_EXECUTION_ID is null and parent_ppvk.WORKFLOW_EXECUTION_ID is not null) or
    (child_ppvk.WORKFLOW_EXECUTION_ID is not null and parent_ppvk.WORKFLOW_EXECUTION_ID is null)) and cwe.workflow_execution_id = ppv.workflow_execution_id);
   vout_message20 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because parent or child is not elible.';
    commit;
    
  delete from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.purge_artifacts_only = 'Y' and exists (select
    * from fd.project_version a where a.artifacts_purged = 'Y' and a.project_version_id = ppv.project_version_id);
  vout_message21 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge key table because artifacts already purged and only artifacts are eligible.';
    commit;
    
  /*Populate the package version purge key table */
  insert into FD.purge_pkg_version_key 
    select distinct we.workflow_execution_id, we.execution_status, pe.plugin_execution_id, pe.plugin_execution_status,
    poe.package_object_execution_id, poe.execution_status as poe_execution_status,
    po.project_object_id, po.project_version_id, po.sequence_number, po.hash, poe.package_object_id
    from fd.workflow_execution we, fd.plugin_execution pe, fd.package_object_execution poe, fd.package_object po, fd.purge_proj_version_key pv
    where we.workflow_execution_id = pe.workflow_execution_id and
    pe.plugin_execution_id = poe.plugin_execution_id and
    poe.package_object_id = po.package_object_id and po.project_version_id = pv.project_version_id;
  vout_message22 := TO_Char(SQL%ROWCOUNT)||' rows inserted into the purge_pkg_version_key table.';
  
   /* Keep the last x successfully deployed versions for a given project */
   delete from FD.purge_pkg_version_key ppvk where exists ( 
         select package_object_execution_id from FD.package_object_execution poe
         where exists (
         select * from (
          select package_object_id, plugin_execution_id,
            RANK () OVER ( PARTITION BY  package_object_id
                      ORDER BY          plugin_execution_id     DESC
                    ) AS rnk
         from (select distinct package_object_id, plugin_execution_id from FD.package_object_execution where execution_status = 'Success')
         order by package_object_id, plugin_execution_id)  a
         where a.rnk <= 2 and a.plugin_execution_id = poe.plugin_execution_id
           and a.package_object_id = poe.package_object_id) and ppvk.plugin_execution_id = poe.plugin_execution_id
           and ppvk.package_object_id = poe.package_object_id);
  vout_message23 := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep last 2 package versions.';
  commit;
  
  /*Delete package versions that are in different packages */
  delete from FD.purge_pkg_version_key ppvk where  exists ( 
         select poe.package_object_execution_id from FD.package_object_execution poe, fd.package_object po
         where exists (
         select * from (
          select project_object_id, project_version_id, plugin_execution_id,
            RANK () OVER ( PARTITION BY  project_object_id, project_version_id
                      ORDER BY          plugin_execution_id     DESC
                    ) AS rnk
         from (select distinct b.project_object_id, b.project_version_id, poe.plugin_execution_id 
            from FD.package_object_execution poe, fd.package_object po, 
           (select project_object_id, project_version_id, count(distinct package_object_id) cnt
           from fd.package_object group by project_object_id, project_version_id
           having count(*) > 1) b
           where poe.execution_status = 'Success' and poe.package_object_id = po.package_object_id
           and po.project_object_id = b.project_object_id and po.project_version_id = b.project_version_id)
         order by project_object_id, project_version_id)  a
         where a.rnk <= 2 and a.plugin_execution_id = poe.plugin_execution_id
           and a.project_object_id = po.project_object_id) 
           and ppvk.plugin_execution_id = poe.plugin_execution_id
           and ppvk.package_object_id = poe.package_object_id);
  vout_message24 := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep like packages.';
  commit;
  
  delete from FD.purge_pkg_version_key ppvk where not exists (select p.workflow_execution_id from
  fd.purge_proj_version_key p where p.workflow_execution_id = ppvk.workflow_execution_id);
  vout_message25 := TO_Char(SQL%ROWCOUNT)||' rows deleted to that have workflow_executions that are not elible.';
  commit;
  
  /* Purge package object where not all package object executions are eligible */
  delete from fd.purge_pkg_version_key where package_object_id in (
    select distinct a.package_object_id from 
    (select poe.package_object_id, count(*) ecnt from fd.package_object_execution poe, (select distinct package_object_execution_id from fd.purge_pkg_version_key) ppvk
    where poe.package_object_execution_id = ppvk.package_object_execution_id group by poe.package_object_id) a,
    (select poe.package_object_id, count(*) pcnt from fd.package_object_execution poe, (select distinct package_object_id from fd.purge_pkg_version_key) ppvk
    where poe.package_object_id = ppvk.package_object_id group by poe.package_object_id) b
    where a.package_object_id = b.package_object_id and ecnt <> pcnt);
  commit;
  
  delete from fd.purge_proj_version_key where project_version_id in (
   select a.project_version_id from
   (select distinct pv.project_version_id from fd.project_version pv, fd.package_object po where pv.project_version_id = po.project_version_id) a left outer join
   (select distinct project_version_id from fd.purge_pkg_version_key) b on a.project_version_id = b.project_version_id where b.project_version_id is null);
  commit;

  /*Remove the project_version because it is needed for a package version */
  delete from fd.purge_proj_version_key pvk where exists (           
  select po.project_version_id from fd.package_object po where not exists (select project_version_id from
  fd.purge_pkg_version_key ppvk where ppvk.project_version_id = po.project_version_id) and pvk.project_version_id = po.project_version_id);
  vout_message26 := TO_Char(SQL%ROWCOUNT)||' rows deleted to keep like packages.';
  commit;
  
  /*Populate the folder_Version purge key table */
  insert into FD.purge_folder_version_key (
   folder_id, folder_version_id, folder_request_id, environment_id, workflow_request_id, WORKFLOW_EXECUTION_ID, project_version_id)
   select fv.folder_id, fv.folder_version_id, fr.folder_request_id, fr.ENVIRONMENT_ID,
       wr.workflow_request_id, we.workflow_execution_id, coalesce(wr.project_version_id, fpv.project_version_id) as project_version_id
    from FD.folder_version fv inner join FD.folder_request fr on fv.FOLDER_VERSION_ID = fr.FOLDER_VERSION_ID 
     inner join FD.workflow_request wr on fr.folder_request_id = wr.folder_request_id
     inner join FD.workflow_execution we on wr.workflow_request_id = we.workflow_request_id and we.execution_status in ('Success', 'Failure')
     left outer join FD.folder_project_version fpv on fv.folder_version_id = fpv.folder_version_id
   union
   select fv.folder_id, fv.folder_version_id, fr.folder_request_id, fr.ENVIRONMENT_ID,
       null, null, fpv.project_version_id as project_version_id
    from FD.folder_version fv inner join FD.folder_request fr on fv.FOLDER_VERSION_ID = fr.FOLDER_VERSION_ID and fr.request_status in ('REJECTED') 
     left outer join FD.folder_project_version fpv on fv.folder_version_id = fpv.folder_version_id;
  vout_message27 := TO_Char(SQL%ROWCOUNT)||' rows inserted into the purge folder version key table.';
  commit;
  
  /*Delete any folder_Version's that can't be purged because pieces of it are still active in an environment */
  delete from FD.purge_folder_version_key pfv where exists (
    select a.folder_version_id from (select fv.folder_version_id
    from FD.folder_version fv inner join FD.folder_project_version fpv
    on fv.FOLDER_VERSION_ID = fpv.FOLDER_VERSION_ID left outer join
     FD.purge_proj_version_key ppvk on
     fpv.project_version_id = ppvk.project_version_id and ppvk.PURGE_ARTIFACTS_ONLY = 'N'
     where ppvk.PROJECT_VERSION_ID is null
   union
    select fv.folder_version_id
    from FD.folder_version fv inner join FD.folder_request fr
    on fv.FOLDER_VERSION_ID = fr.FOLDER_VERSION_ID inner join
    fd.workflow_request wr on fr.folder_request_id = wr.folder_request_id left outer join
     FD.purge_proj_version_key ppvk on
     wr.project_version_id = ppvk.project_version_id and ppvk.PURGE_ARTIFACTS_ONLY = 'N'
     where ppvk.PROJECT_VERSION_ID is null) a where pfv.folder_version_id = a.folder_version_id);
  vout_message28 := TO_Char(SQL%ROWCOUNT)||' rows deleted from the purge folder version key table because a project version is not eligible to be purged.';
  commit;
  
  /* Delete folder versions that have folder requests that are not completed or failed */
  delete from fd.purge_folder_version_key where folder_version_id in (
    select folder_version_id from fd.folder_request where request_status not in ('COMPLETED','FAILED'));
  vout_message29 := TO_Char(SQL%ROWCOUNT)||' rows deleted from the purge folder version key table because they are not in completed or failed status.';
  commit;
  
   /* Stamp rows on the purge table that meet the age constraint */
   update FD.purge_folder_version_key set age = 
    (select trunc(sysdate) - trunc(coalesce(a.end_time, a.start_time, a.created_on)) from FD.workflow_execution a
      where FD.purge_folder_version_key.workflow_execution_id = a.workflow_execution_id);
  vout_message30 := TO_Char(SQL%ROWCOUNT)||' rows updated with the and age older than the purge criteria.';
    commit;

  /* Delete all folder_versions where the any part of the folder_version does not meet the age requirement */
   delete from FD.purge_folder_version_key pfv where exists (select distinct folder_version_id from 
     (select folder_version_id, min(age) from FD.purge_folder_version_key group by folder_version_id
      having min(age) < v_retention_days) a where a.folder_version_id = pfv.folder_version_id);
   vout_message31 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because not all rows in the folder_version are elible due to age';
    commit;
    
  /* Delete all folder_versions where there are still scheduled deployments */
    delete from fd.purge_folder_version_key pfv where exists (select folder_version_id from 
       fd.folder_request fr, fd.human_task ht where pfv.folder_version_id = fr.folder_version_id and 
       fr.folder_request_id = ht.folder_request_id and ht.workflow_request_id is null and fr.request_status = 'SCHEDULED');
    vout_message32 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because human tasks are not completed.';
    commit;
    
    delete from fd.purge_folder_version_key pfv where exists (select folder_version_id from 
       fd.folder_request fr, fd.scheduled_task st where pfv.folder_version_id = fr.folder_version_id and 
       fr.folder_request_id = st.folder_request_id and st.workflow_request_id is null and fr.request_status = 'SCHEDULED');
    vout_message33 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because scheduled tasks are not completed.';
    commit;
    
    /* Delete all folder keys that do not have the associated project_versions being purged */
    delete from fd.purge_folder_version_key pfvk where pfvk.folder_version_id in (select pfvk2.folder_version_id
      from fd.purge_folder_version_key pfvk2 left outer join
      FD.PURGE_PROJ_VERSION_KEY ppvk on pfvk2.project_version_id = ppvk.project_Version_id
      where ppvk.project_version_id is null and pfvk.project_version_id = pfvk2.project_version_id);
    vout_message34 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because not all rows in the folder_version are elible due to project versions not eligible.';
    commit;
    
    /* Delete all folder versions where not all requests are being purged */
    delete from fd.purge_folder_version_key pfvk where pfvk.folder_version_id in 
     (select a.folder_version_id from
     (select folder_version_id, count(distinct folder_request_id) req_cnt from fd.purge_folder_version_key group by folder_version_id) a,
     (select fv.folder_version_id, count(distinct fr.folder_request_id) req_cnt from fd.folder_version fv, fd.folder_request fr
     where fv.folder_version_id = fr.folder_version_id group by fv.folder_version_id) b
     where a.folder_version_id = b.folder_version_id and a.req_cnt < b.req_cnt);
    vout_message35 := TO_Char(SQL%ROWCOUNT)||' rows delete from purge key table because not all requests are being purged.';
    commit;
    
    /* Delete all project versions that have folder versions that are not being archived. */
    delete from fd.purge_proj_version_key ppvk where exists (
      select * from (
      select pfv.folder_version_id, ppv.project_version_id from fd.purge_proj_version_key ppv inner join fd.folder_project_version fpv on fpv.project_version_id = ppv.project_version_id 
      left outer join fd.purge_folder_version_key pfv on pfv.folder_version_id = fpv.folder_version_id
      where pfv.folder_version_id is null
      union 
      select pfv.folder_version_id, ppv.project_version_id from fd.purge_proj_version_key ppv inner join fd.workflow_request wr on wr.workflow_request_id = ppv.workflow_request_id
      inner join fd.folder_request fr on fr.folder_request_id = wr.folder_request_id
      inner join fd.folder_version fv on fr.folder_version_id = fv.folder_version_id
      left outer join fd.purge_folder_version_key pfv on pfv.folder_version_id = fv.folder_version_id
      where pfv.folder_version_id is null) a where a.project_version_id = ppvk.project_version_id);
    vout_message36 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge_proj_version_key table because folder_version is not eligible';
      commit;
      
    delete from fd.PURGE_FOLDER_VERSION_KEY where project_version_id in (
     select pfvk.project_version_id from fd.workflow_request wr inner join fd.PURGE_FOLDER_VERSION_KEY pfvk
     on wr.project_version_id = pfvk.project_version_id left outer join FD.PURGE_PROJ_VERSION_KEY ppvk on wr.project_version_id = ppvk.project_version_id
     where ppvk.project_version_id is null);
    vout_message37 := TO_Char(SQL%ROWCOUNT)||' rows deleted from purge_folder_version_key table because folder_version is not eligible, identify completed at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
       commit;
          
EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE   FD.FLEX_PURGE_OPERATIONAL_DELETE 
(vout_message1  OUT VARCHAR2,
 vout_message2  OUT VARCHAR2,
 vout_message3  OUT VARCHAR2,
 vout_message4  OUT VARCHAR2,
 vout_message5  OUT VARCHAR2,
 vout_message6  OUT VARCHAR2,
 vout_message7  OUT VARCHAR2,
 vout_message8  OUT VARCHAR2,
 vout_message9  OUT VARCHAR2,
 vout_message10 OUT VARCHAR2,
 vout_message11 OUT VARCHAR2,
 vout_message12 OUT VARCHAR2,
 vout_message13 OUT VARCHAR2,
 vout_message14 OUT VARCHAR2,
 vout_message15 OUT VARCHAR2,
 vout_message15a OUT VARCHAR2,
 vout_message16 OUT VARCHAR2,
 vout_message17 OUT VARCHAR2,
 vout_message18 OUT VARCHAR2,
 vout_message19 OUT VARCHAR2,
 vout_message20 OUT VARCHAR2,
 vout_message21 OUT VARCHAR2,
 vout_message22 OUT VARCHAR2,
 vout_message23 OUT VARCHAR2,
 vout_message24 OUT VARCHAR2,
 vout_message25 OUT VARCHAR2,
 vout_message26 OUT VARCHAR2,
 vout_message27 OUT VARCHAR2,
 vout_message28 OUT VARCHAR2,
 vout_message29 OUT VARCHAR2)
IS
   v_retention_days      number;
   v_retention_days_oper number;
   v_keep_count            number;
   v_keep_success          number;
   v_keep_failed           number;
BEGIN
    /* Load the parameters that drive the purge */
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message1 := 'Purge will retain '|| to_char(v_retention_days) || ' days of data, purge starting at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_retention_days_oper
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'RETENTION_DAYS_OPERATIONAL'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'RETENTION_DAYS_OPERATIONAL config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message2 := 'Purge will retain '|| to_char(v_retention_days_oper) || ' days of artifacts in operational tables';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_count
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_COUNT'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_COUNT config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message3 := 'Purge will retain the last '|| to_char(v_keep_count) || ' successful project version deployments for each project in each environment regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_success
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_SUCCESS'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_SUCCESS config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message4 := 'Purge will retain the last '|| to_char(v_keep_success) || ' successful project version deployments for each project regardless of age';

    BEGIN
      select to_number(dpd.DB_PROPERTIES_VALUE) into v_keep_failed
        from ff.db_properties dp, FF.DB_PROPERTIES_DATA dpd 
        where dp.db_properties_name = 'PURGE' and dp.db_properties_key = 'KEEP_FAILED'
        and dp.DB_PROPERTIES_ID = dpd.DB_PROPERTIES_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'KEEP_FAILED config value was not found - '||SQLCODE||' -ERROR- '||SQLERRM);
    END;
    vout_message5 := 'Purge will retain the last '|| to_char(v_keep_success) || ' failed project version deployments for each project regardless of age';

    delete from FD.TEST_DEF_QUALIFIER_VALUE b where exists (select b.TEST_DEF_QUALIFIER_VALUE_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
      union
      select distinct   b.TEST_DEF_QUALIFIER_VALUE_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
       ) and exists (select * from FD.ARC_TEST_DEF_QUAL_VALUE a where a.TEST_DEF_QUALIFIER_VALUE_ID = b.TEST_DEF_QUALIFIER_VALUE_ID);
    vout_message6 := TO_Char(SQL%ROWCOUNT)||' test_def_qualifier_value rows deleted from operational tables.';
    
    delete from FD.TEST_RESULT b where exists (select b.TEST_RESULT_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N' and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
      union
      select distinct   b.TEST_RESULT_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr, FD.TEST_DEFINITION_RUN tdr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = tdr.TEST_SET_RUN_ID
      and tdr.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID
       ) and exists (select * from FD.ARC_TEST_RESULT a where a.TEST_RESULT_ID = b.TEST_RESULT_ID);
    vout_message7 := TO_Char(SQL%ROWCOUNT)||' test_result rows deleted from operational tables.';
    
    delete from FD.TEST_DEFINITION_RUN b where exists (select b.TEST_DEFINITION_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_DEFINITION_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       ) and exists (select * from FD.ARC_TEST_DEFINITION_RUN a where a.TEST_DEFINITION_RUN_ID = b.TEST_DEFINITION_RUN_ID);
    vout_message8 := TO_Char(SQL%ROWCOUNT)||' test_definition_run rows deleted from operational tables.';
    
    delete from FD.TEST_SET_QUALIFIER_VALUE b where exists (select b.TEST_SET_QUALIFIER_VALUE_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_SET_QUALIFIER_VALUE_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.TEST_SET_RUN tsr
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = tsr.test_run_id and tsr.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID
       ) and exists (select * from FD.ARC_TEST_SET_QUALIFIER_VALUE a where a.TEST_SET_QUALIFIER_VALUE_ID = b.TEST_SET_QUALIFIER_VALUE_ID);
    vout_message9 := TO_Char(SQL%ROWCOUNT)||' test_set_qualifier_value rows deleted from operational tables.';
    
    delete from FD.TEST_SET_RUN b where exists (select b.TEST_SET_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = b.test_run_id
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_SET_RUN_ID
      from FD.TEST_RUN tr, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = tr.WORKFLOW_EXECUTION_ID and tr.test_run_id = b.test_run_id
       ) and exists (select * from FD.ARC_TEST_SET_RUN a where a.TEST_SET_RUN_ID = b.TEST_SET_RUN_ID);
    vout_message10 := TO_Char(SQL%ROWCOUNT)||' test_set_run rows deleted from operational tables.';
    
    delete from FD.TEST_RUN b where exists (select b.TEST_RUN_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N'
      union
      select distinct   b.TEST_RUN_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
       ) and exists (select * from FD.ARC_TEST_RUN a where a.TEST_RUN_ID = b.TEST_RUN_ID);
    vout_message11 := TO_Char(SQL%ROWCOUNT)||' test_run rows deleted from operational tables.';
    
    delete from FD.PLUGIN_EXECUTION_OUTPUT_VALUE b where exists (select peo.PLUGIN_EXECUTION_OUTPUT_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and peo.PLUGIN_EXECUTION_OUTPUT_ID = b.PLUGIN_EXECUTION_OUTPUT_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID and ppv.purge_artifacts_only = 'N' 
       union
       select peo.PLUGIN_EXECUTION_OUTPUT_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we, FD.PLUGIN_EXECUTION_OUTPUT peo
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and peo.PLUGIN_EXECUTION_OUTPUT_ID = b.PLUGIN_EXECUTION_OUTPUT_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = peo.PLUGIN_EXECUTION_ID
       ) and exists (select * from fd.arc_plugin_exec_output_value a where a.plugin_execution_op_value_id = b.plugin_execution_op_value_id);
    vout_message12 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_output_value rows deleted from operational tables.';
    
    delete from FD.PLUGIN_EXECUTION_OUTPUT b where exists (select pe.PLUGIN_EXECUTION_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv, FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.plugin_execution_id = b.plugin_execution_id
       union select pe.PLUGIN_EXECUTION_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.plugin_execution_id = b.plugin_execution_id
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and ppv.purge_artifacts_only = 'N' ) 
       and exists (select * from fd.ARC_PLUGIN_EXECUTION_OUTPUT a where a.plugin_execution_output_id = b.plugin_execution_output_id);
    vout_message13 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_output rows deleted from operational tables.';

    delete from FD.PLUGIN_EXECUTION_LOG b where exists (select pe.PLUGIN_EXECUTION_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_PROJ_VERSION_KEY ppv, FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID 
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = b.PLUGIN_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N' union select pe.PLUGIN_EXECUTION_ID
      from FD.PLUGIN_EXECUTION pe, FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and pe.PLUGIN_EXECUTION_ID = b.PLUGIN_EXECUTION_ID
       and we.WORKFLOW_EXECUTION_ID = pe.WORKFLOW_EXECUTION_ID) and exists
       (select * from fd.arc_plugin_execution_log a where a.plugin_execution_log_id = b.plugin_execution_log_id);
    vout_message14 := TO_Char(SQL%ROWCOUNT)||' plugin_execution_log rows deleted from operational tables.';
    
    delete from FD.PACKAGE_OBJECT_EXECUTION b where exists (select ppvk.package_object_execution_id from
      fd.purge_pkg_version_key ppvk where ppvk.PACKAGE_OBJECT_EXECUTION_ID = b.PACKAGE_OBJECT_EXECUTION_ID)
      and exists (select * from fd.arc_package_object_execution a where a.package_object_execution_id = b.package_object_execution_id);
    vout_message15 := TO_Char(SQL%ROWCOUNT)||' package_object_execution rows deleted from operational tables.';  
      
    delete from FD.PACKAGE_OBJECT b where exists (select ppvk.package_object_id from
      fd.purge_pkg_version_key ppvk where ppvk.package_object_id = b.package_object_id)
      and exists (select * from fd.arc_package_object a where a.package_object_id = b.package_object_id);
    vout_message15a := TO_Char(SQL%ROWCOUNT)||' package_object_execution rows deleted from operational tables.';  
      
    delete from FD.PLUGIN_EXECUTION b where exists (select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv,
        FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.workflow_execution_id = b.workflow_execution_id
       and ppv.purge_artifacts_only = 'N' union select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,
        FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.workflow_execution_id = b.workflow_execution_id) 
      and exists (select * from fd.arc_plugin_execution a where a.plugin_execution_id = b.plugin_execution_id);
    vout_message16 := TO_Char(SQL%ROWCOUNT)||' plugin_execution rows deleted from operational tables.';

    delete from FD.WORKFLOW_EXECUTION_DATA b where exists (select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv, FD.WORKFLOW_EXECUTION we
      where ppv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID
       and ppv.purge_artifacts_only = 'N' union select we.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv,  FD.WORKFLOW_EXECUTION we
      where pfv.WORKFLOW_EXECUTION_ID = we.WORKFLOW_EXECUTION_ID and we.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID) 
      and exists (select * from fd.arc_workflow_execution_data a where a.workflow_execution_data_id = b.workflow_execution_data_id);
    vout_message17 := TO_Char(SQL%ROWCOUNT)||' workflow_execution_data rows deleted from operational tables.';
    
    delete from FD.WORKFLOW_EXECUTION b where exists (select ppv.WORKFLOW_EXECUTION_ID
      from FD.PURGE_PROJ_VERSION_KEY ppv 
      where ppv.purge_artifacts_only = 'N' and ppv.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID union select pfv.WORKFLOW_EXECUTION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.WORKFLOW_EXECUTION_ID = b.WORKFLOW_EXECUTION_ID) and exists 
      (select * from fd.arc_workflow_execution a where a.workflow_execution_ID = b.workflow_execution_ID);
    vout_message18 := TO_Char(SQL%ROWCOUNT)||' workflow_execution rows deleted from operational tables.';
    
    delete from FD.WORKFLOW_REQUEST_INST b where exists (select wr.WORKFLOW_REQUEST_ID
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.workflow_request_id = ppv.workflow_request_ID and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N' union select wr.WORKFLOW_REQUEST_ID
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.workflow_request_id = pfv.workflow_request_ID and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID) and exists
      (select * from fd.arc_workflow_request_inst a where a.workflow_request_id = b.workflow_request_id and a.instance_ID = b.instance_ID);
    vout_message19 := TO_Char(SQL%ROWCOUNT)||' workflow_request_inst rows deleted from operational tables.';
    
    delete from FD.WORKFLOW_REQUEST_INPUT b where exists (select wr.WORKFLOW_REQUEST_ID
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.workflow_request_id = ppv.workflow_request_id and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N'
       union
       select wr.WORKFLOW_REQUEST_ID
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_FOLDER_VERSION_KEY pfv 
      where wr.workflow_request_id = pfv.workflow_request_id and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID) 
      and exists 
      (select * from fd.arc_workflow_request_input a where a.workflow_request_ID = b.workflow_request_ID
       and a.workflow_request_input_key = b.workflow_request_input_key);
    vout_message20 := TO_Char(SQL%ROWCOUNT)||' workflow_request_input rows deleted from operational tables.';

    delete from FD.SCHEDULED_TASK b where (exists (select *
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.workflow_request_id = ppv.workflow_request_id and wr.workflow_request_id = b.workflow_request_id
       and ppv.purge_artifacts_only = 'N')
      or exists (select *
      from fd.folder_request fr, fd.purge_folder_version_key pfv
      where fr.folder_version_id = pfv. folder_version_id and fr.folder_request_id = b.folder_request_id and
        fr.folder_request_id = pfv.folder_request_id)) and exists (select * from fd.arc_scheduled_task a where a.task_id = b.task_id);
    vout_message21 := TO_Char(SQL%ROWCOUNT)||' scheduled_task rows deleted from operational tables.';
        
    delete from FD.HUMAN_TASK b where (exists (select *
      from FD.WORKFLOW_REQUEST wr, FD.PURGE_PROJ_VERSION_KEY ppv 
      where wr.workflow_request_id = ppv.workflow_request_id and wr.WORKFLOW_REQUEST_ID = b.WORKFLOW_REQUEST_ID
       and ppv.purge_artifacts_only = 'N')
      or exists (select * from
      fd.folder_request fr, fd.purge_folder_version_key pfv
      where fr.folder_version_id = pfv.folder_version_id and fr.folder_request_id = b.folder_request_id
      and fr.folder_request_id = pfv.folder_request_id)) and exists (select * from fd.arc_human_task a where a.task_id = b.task_id);
    vout_message22 := TO_Char(SQL%ROWCOUNT)||' human_task rows deleted from operational tables.';
    
    delete from FD.WORKFLOW_REQUEST b where exists (select workflow_request_id
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.purge_artifacts_only = 'N' and ppv.workflow_request_id = b.workflow_request_id 
      union
      select workflow_request_id from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.workflow_request_id = b.workflow_request_id) and exists 
      (select * from fd.arc_workflow_request a where a.workflow_request_id = b.workflow_request_id);
    vout_message23 := TO_Char(SQL%ROWCOUNT)||' workflow_request rows deleted from operational tables.';
 
     delete from FD.FOLDER_REQUEST b where exists (select pfv.FOLDER_VERSION_ID
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.FOLDER_VERSION_ID = b.folder_version_id) 
      and exists (select * from fd.arc_folder_request a where a.folder_request_id = b.folder_request_id);
    vout_message24 := TO_Char(SQL%ROWCOUNT)||' folder_request rows deleted from operational tables.';

    delete from FD.FOLDER_PROJECT_VERSION b where (exists (select *
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.FOLDER_VERSION_ID = b.folder_version_id) or 
      exists (select distinct project_version_id from
      FD.PURGE_PROJ_VERSION_KEY ppv where ppv.project_version_id = b.project_version_id)) 
      and  exists (select * from fd.arc_folder_project_version a where a.folder_project_version_id = b.folder_project_version_id);
    vout_message25 := TO_Char(SQL%ROWCOUNT)||' folder_project_version rows deleted from operational tables.';
          
    delete from FD.FOLDER_VERSION b where exists (select *
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.FOLDER_VERSION_ID = b.FOLDER_VERSION_ID)  and exists 
      (select * from fd.arc_folder_version a where a.folder_version_id = b.folder_version_id);
    vout_message26 := TO_Char(SQL%ROWCOUNT)||' folder_version rows deleted from operational tables.';
        
    delete from FD.PROJECT_VERSION_DATA_VAL b where exists (select ppv.project_version_id
    from FD.PROJECT_VERSION_DATA pvd, FD.PURGE_PROJ_VERSION_KEY ppv 
    where pvd.project_version_id = ppv.PROJECT_VERSION_ID and pvd.project_version_data_id = b.project_version_data_id
       and ppv.purge_artifacts_only = 'N'
	 union select pfv.project_version_id
    from FD.PROJECT_VERSION_DATA pvd, FD.PURGE_FOLDER_VERSION_KEY pfv 
    where pvd.project_version_id = pfv.PROJECT_VERSION_ID and pvd.project_version_data_id = b.project_version_data_id) and exists (select * from fd.arc_project_version_data_val a
       where a.project_version_data_val_id = b.project_version_data_val_id);
    vout_message27 := TO_Char(SQL%ROWCOUNT)||' project_version_data_val rows deleted from operational tables.';

    delete from FD.PROJECT_VERSION_DATA b where exists (select ppv.project_version_id
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.purge_artifacts_only = 'N' and ppv.PROJECT_VERSION_ID = b.PROJECT_VERSION_ID
	  union select pfv.project_version_id
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.PROJECT_VERSION_ID = b.PROJECT_VERSION_ID)
	   and exists (select * from fd.arc_project_version_data a where a.project_version_data_id = b.project_version_data_id);
    vout_message28 := TO_Char(SQL%ROWCOUNT)||' project_version_data rows deleted from operational tables.';
  
    delete from FD.PROJECT_VERSION b where exists (select ppv.project_version_id
      from FD.PURGE_PROJ_VERSION_KEY ppv where ppv.purge_artifacts_only = 'N' and ppv.project_version_id = b.project_version_id
	  union select pfv.project_version_id
      from FD.PURGE_FOLDER_VERSION_KEY pfv where pfv.project_version_id = b.project_version_id)
	   and exists (select * from fd.arc_project_version a where a.project_version_id = b.project_version_id);
    vout_message29 := TO_Char(SQL%ROWCOUNT)||' project_version rows deleted from operational tables, purge complete at: '|| to_char(sysdate,'mm-dd-yyyy-hh24:mi:ss');
    
EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;
/
