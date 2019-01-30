delete from  FD.PLUGIN_VERSION_JAR where PLUGIN_VERSION_ID in(select PLUGIN_VERSION_ID from fd.plugin_version where (plugin_id, plugin_version_id ) in (
select plugin_id, plugin_version_id from (
select plugin_id, plugin_version_id, rank() over (partition by plugin_id order by installed_on desc) as rank from fd.plugin_version
) where rank > 5 and (plugin_id, plugin_version_id) not in (select distinct plugin_id, active_plugin_version_id from fd.plugin)));

delete from FD.PLUGIN_VERSION_DATA pvd where PLUGIN_VERSION_ID not in(select distinct PLUGIN_VERSION_ID from fd.PLUGIN_VERSION_JAR);

delete from fd.plugin_version pv where PLUGIN_VERSION_ID not in(select distinct PLUGIN_VERSION_ID from fd.PLUGIN_VERSION_JAR);

commit;