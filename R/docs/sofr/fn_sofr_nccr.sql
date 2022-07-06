CREATE or replace FUNCTION fn_sofr_nccr(v_start_date text, v_end_date text, v_amount numeric) returns numeric 
AS $$
DECLARE
	v_nccr_interest numeric;
	v_key numeric;
begin 
	
	SELECT EXTRACT(EPOCH FROM current_timestamp(0)) into strict v_key;
	
	/******************************************************************************/
	
	delete from sofr_nccr;

	/******************************************************************************/
	
	insert into sofr_nccr (seq, date, effective_date) 
	select 1 seq
	     , T1.date
	     , max(T2.effective_date) over (rows between unbounded preceding and current row) effective_date
	from (select generate_series(v_start_date::date , v_end_date::date, '1 day'::interval)::date date) T1 
	     left outer join sofr_rate T2 
	     on T1.date = T2.date;
	
	/******************************************************************************/
	
	insert into sofr_nccr 
	select 2 seq
	     , sn.date
	     , to_char(sn.date, 'Dy') wday
	     , sr.effective_date
	     , sr.rate_type
	     , sr.rate
	     , count(*) over (partition by sn.effective_date) n1
	     , row_number(*) over (partition by sn.effective_date) n2
	  from sofr_nccr sn
	       left outer join sofr_rate sr
	       on sn.effective_date = sr.effective_date
	       and sn.seq = 1;
	
	/******************************************************************************/
	
	insert into sofr_nccr  
	select 3 seq 
	     , date, wday, effective_date, rate_type, rate, n1, n2
	     , case when n2 = 1 then n1 else 0 end n3 
	     , sum(case when n2 = 1 then n1 else 0 end)
	           over (rows between unbounded preceding and current row) n4
	  from sofr_nccr sn 
	 where seq = 2;
	
	/******************************************************************************/
	
	insert into sofr_nccr  
	select 4 seq 
	     , date, wday, effective_date, rate_type, rate, n1, n2, n3, n4
	     , rate * n3 / 360 rate_day
	  from sofr_nccr sn 
	 where seq = 3;
	
	/******************************************************************************/
	
	insert into sofr_nccr
	select 5 seq 
	     , date, wday, effective_date, rate_type, rate, n1, n2, n3, n4, rate_day
	     , exp(rate2) - 1 prod_rate1
	from (select sn.*, sum(ln(rate_day + 1)) over (rows between unbounded preceding and current row) rate2
	        from sofr_nccr sn 
	       where seq = 4) T1;
	
	/******************************************************************************/
	
	insert into sofr_nccr
	select 6 seq
	     , date, wday, effective_date, rate_type, rate, n1, n2, n3, n4, rate_day, prod_rate1
	     , prod_rate1 * 360 / n4 prod_rate2
	     , round((prod_rate1 * 360 / n4)::numeric, 6) ccr_year
	     , round((prod_rate1 * 360 / n4)::numeric, 6) * n4 / 360 ccr_day
	  from sofr_nccr sn 
	 where seq = 5;
	
	/******************************************************************************/
	
	insert into sofr_nccr
	select 7 seq
	     , T1.*
	     , T1.ccr_day - T1.prev_ccr_day nccr_day
	  from (select date, wday, effective_date, rate_type, rate, n1, n2, n3, n4, rate_day, prod_rate1, prod_rate2, ccr_year, ccr_day     
	             , COALESCE(lag(ccr_day, 1) over (), 0) prev_ccr_day
	          from sofr_nccr sn 
	         where seq = 6) T1;
	 
	/******************************************************************************/
	
	insert into sofr_nccr
	select 0 seq
	     , date, wday, effective_date, rate_type, rate, n1, n2, n3, n4, rate_day
	     , prod_rate1, prod_rate2, ccr_year, ccr_day, prev_ccr_day, nccr_day
	     , round(v_amount * nccr_day::numeric, 2)  nccr_interest
	  from sofr_nccr sn 
	 where seq = 7;
	
	/******************************************************************************/
	
--	delete from sofr_nccr where seq <= 7;
	
	select sum(nccr_interest) into strict v_nccr_interest from sofr_nccr sn where seq = 0;
	return v_nccr_interest;

	/******************************************************************************/
end;
$$ LANGUAGE plpgsql;




--DROP function public.fn_sofr_nccr();

select fn_sofr_nccr('2022-03-31', '2022-04-21', 25364062.44);
select fn_sofr_nccr('2022-03-31', '2022-04-30', 25364062.44);
select fn_sofr_nccr('2022-03-31', '2022-04-21', 10000000);


select * from sofr_nccr sn;

SELECT table_name, column_name, udt_name 
FROM information_schema.columns
WHERE table_name = 'sofr_nccr';



