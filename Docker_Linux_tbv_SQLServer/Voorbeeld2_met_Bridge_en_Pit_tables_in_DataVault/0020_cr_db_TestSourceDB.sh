# https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash

# create SQL server database owners for DWH databases
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Welkom01" -i "../../cr_DBs_scripts_for_Linux/Vbld2_Bridge_en_Pit_tables_DV/0020_cr_db_TestSource2DB.sql" -o "./0020_cr_db_TestSource2DB.log"
