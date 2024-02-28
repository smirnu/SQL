with sender_with_name as (
	select user_sender.country as country_sender, user_receiver.country as country_receiver
  	from letters
	inner join users as user_sender
	on letters.sender = user_sender.user_id
	inner join users as user_receiver
	on letters.receiver = user_receiver.user_id),
send_letter as (
  	select country_sender as user, count(country_sender) as num_sent_total
  	from sender_with_name
  	group by country_sender),
send_xborder_letter as (
  	select country_sender as user, count(country_sender) as num_sent_xborder
 	from sender_with_name
  	where country_sender != country_receiver
  	group by country_sender)
select send_letter.user as user_id, round(num_sent_xborder * 1.0 / num_sent_total, 4) as status
from send_letter
inner join send_xborder_letter using (user)
order by status;