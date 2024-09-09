-- question 1
select count(*) from taxi
where lpep_dropoff_datetime<'2019-09-19 00:00:00' and lpep_pickup_datetime>='2019-09-18 00:00:00'

-- question 2
select lpep_pickup_datetime from taxi
where trip_distance in (select max(trip_distance) from taxi)

-- question 3
select sum(total_amount), PULocationID from taxi
group by PULocationID
having lpep_dropoff_datetime<'2019-09-19 00:00:00' and lpep_pickup_datetime>='2019-09-18 00:00:00'

-- question 4
select sum(total_amount), "Borough"
from taxi
left join location
on taxi."PULocationID"=location."LocationID"
where  lpep_dropoff_datetime<'2019-09-19 00:00:00' and lpep_pickup_datetime>='2019-09-18 00:00:00'
group by  "Borough"
order by sum(total_amount) desc
limit 3

-- question 5
select max(tip_amount), "Borough"
from taxi
left join location
on taxi."DOLocationID"=location."LocationID"
where  lpep_dropoff_datetime=<'2019-09-30 00:00:00' and lpep_pickup_datetime>='2019-09-01 00:00:00'
group by  "Borough"