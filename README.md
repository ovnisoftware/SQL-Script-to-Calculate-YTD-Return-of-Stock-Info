# SQL-Script-to-Calculate-YTD-Return-of-Stock-Info
SQL Script that calculates the % return of stocks between entered dates

How to get it to work:

1. Download some .csv stock information using the Yahoo Finance Quote Downloader app I wrote (also on Github here: https://github.com/ovnisoftware/YahooFinanceQuoteDownloader)

2. Run this import script I wrote to import the .csv stock info into SQL Server (also on Github here: https://github.com/ovnisoftware/Bulk-Import-CSV-Stock-Quotes-Into-SQL-Server-Script

3. Open the YTD_Return_Calculation.sql script file and replace the @startDate and @endDate variables with the dates you want to see the returns between.
