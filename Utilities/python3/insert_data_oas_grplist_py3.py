# Filenaam: insert_data_oas_grplist_py3.py
# Functie:  werkend python3 script om data via odbc in SQL server database te importeren.
# Gebruikte python versie: 3.8.2
# Referenties: https://www.got-it.ai/solutions/sqlquerychat/sql-help/data-manipulation/read-and-write-data-to-and-from-sql-server-using-pandas-library-in-python-querychat/
# Opmerking:
#             Requirements Windows:
#             - Zorg dat mbv het script install_python_env.cmd de environment is geinstalleerd
#             - Install odbc driver voor sql server (driver 17) 64-bits versie
#             - Zorg dat met odbc-gegevensbronbeheer 64-bits de volgende Gebruikers-DSNs zijn aangemaakt
#               met connectie gegevens naar de SQL Server databases:
#               - localhost_db_TestSourceDB3
#               - localhost_db_TestStagingDB3
#               - localhost_db_TestIntegrationDB3
#               - localhost_db_TestPresentationDB3
#               Draai dit script vanuit Microsoft Visual Code mbv de rechter muis optie "Run Python file in terminal"
#               Zorg dat in Visual code de python interpreter wordt gebruikt uit virtual env env_python3_DWH
#
#  Letop: Dit voorbeeld werkt zowel met de textfiles
#         testtextfile.csv en testtextfile_quoted.csv.
#         In beide gevallen verdwijnen nog de voorloop nullen van het veld id.
#         Ook worden alle velden als varchar velden ingelezen in de database.
#         Ook de datum velden.

import pyodbc
import pandas as pd

# werkt 
# Voor verwerken van datum velden in CSV
# zie https://kite.com/python/answers/how-to-import-dates-in-a-csv-file-as-datetimes-in-a-pandas-dataframe-in-python
# datum_kolommen = ["Geboortedatum"]
#data = pd.read_csv("testtextfile_quoted.csv"


# data = pd.read_csv("testtextfile.csv"
#                   ,skiprows=6
#                   ,sep=';'
#                   ,skip_blank_lines=True
#                   ,parse_dates=datum_kolommen, dayfirst=True )


data = pd.read_csv("C:\\tmp\\weg\Data\\20200330data_dwh_stg_oas_grplist_recs_262628.csv"
                   ,skiprows=0
                   ,sep=','
                   ,skip_blank_lines=True)

# zorg dat de kolommen zijn ge-quote en kolommen gescheiden zijn obv ;
#data = pd.read_csv("C:\tmp\weg\Data\query_data_brontabel_oas_himlist.data", skiprows=6, sep=';', skip_blank_lines=True)

# Preview the first 5 lines of the loaded data
print("Toon Eerste 5 records van de ingelezen set:")  
print(data.head(5))
# print(data)
# print (type(data))
# print("Aantal gelezen records: ", data.shape)
print("Aantal gelezen kolommen: ", data.shape[1])
print("Aantal gelezen records : ", data.shape[0])

# Debug Toon DSN info
# dsn_desc = pyodbc.dataSources()
# print (dsn_desc)

# *** Schrijf de Data weg naar een SQL server database obv een odbc dsn ***
# zie ook connect_azuresqldb_v005.py
#         pyodbc_voorbeeld_naar_sqlserver_py3.py
sql_conn = pyodbc.connect('DSN=localhost_db_TestSourceDB3;UID=sa;PWD=Welkom01')
cursor = sql_conn.cursor() 

# Maak de tabel leeg, voor het geval al data bevat
cursor.execute("truncate table [codafin12].[oas_grplist]")

# Lees de data uit de textfile in de database 
for index, row in data.iterrows(): 
  print(row) 
  # oas_grplist
  cursor.execute("INSERT INTO [codafin12].[oas_grplist](\
                     [cmpcode] \
                    ,[code] \
                    ,[elmlevel] \
	                 ,[lstseqno] \
                    ,[grpcode] \
                 )\
                 values(?,?,?,?,?)",
                    row['cmpcode']
                   ,row['code']
                   ,row['elmlevel']
                   ,row['lstseqno']                   
                   ,row['grpcode']) 
sql_conn.commit() 
cursor.close() 
sql_conn.close() 


print("Einde verwerking")