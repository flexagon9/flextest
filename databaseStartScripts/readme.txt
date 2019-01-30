This file as well as
server.config
startDatabases.sh
startup.sql

are deployed by FlexDeploy on fdglp01 and are installed in the /home/oracle folders of servers that have databases.
The project and environment instances should be updated on that server as needed.

Cron jobs need to be manually setup on the database servers.
When that is done, record it in this file.

Changes to add new servers and databases to manage should happen in server.config.

If you need to make changes to any of the files, do so in SVN and then build and deploy to all instances.
Thanks!
