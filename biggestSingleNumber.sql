--+-------------+------+
--| Column Name | Type |
--+-------------+------+
--| num         | int  |
--+-------------+------+
--This table may contain duplicates (In other words, there is no primary key for this table in SQL).
--Each row of this table contains an integer.
--
--
--A single number is a number that appeared only once in the MyNumbers table.
--
--Find the largest single number. If there is no single number, report null.
--
--The result format is in the following example.
with num_by_count as (
    select count(*) as count, num
    from MyNumbers
    group by num),
single_num as (
    select num
    from num_by_count
    where count = 1)
select MAX(num) as num
from single_num;