--Script that calculates % return between 2 dates for all tickers in a table
declare @ticker varchar(max);
declare @startDate varchar(max);
declare @endDate date;

--Enter your dates here
set @startDate ='2015-01-02'
set @endDate = '2015-04-22'

--Checks if #YTDResults table exists and deletes it if it does
if object_id('tempdb..#YTDResults') is not null
begin
drop table #YTDResults
end

CREATE TABLE #YTDResults
(
	Ticker varchar(15),
	YTD_Return decimal (10,4)
)

--Use cursor to loop through all tickers
DECLARE db_cursor CURSOR FOR  
SELECT distinct ticker
from tickerquotes
open db_cursor
fetch next from db_cursor into @ticker
while @@FETCH_STATUS = 0
begin
		insert into #YTDResults (ticker, YTD_Return)
		--Populates Ticker field
		select @ticker, 

		--populates YTD_Return field
		(((select adj_close --Closing Price of End Date
		from tickerquotes
		where ticker = @ticker
		and date = @endDate)
		-
		(select adj_close --Closing Price of Start Date
		from tickerquotes
		where ticker = @ticker
		and date = @startDate))
		/
		((select adj_close --Closing Price of End Date
		from tickerquotes
		where ticker = @ticker
		and date = @endDate)))
  fetch next from db_cursor into @ticker
end
close db_cursor
deallocate db_cursor
select Ticker, convert(decimal(10,2), YTD_Return*100) as [%]
from #YTDResults
order by YTD_Return desc