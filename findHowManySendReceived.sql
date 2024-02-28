with send_letter as (
    select sender as user_send, count(sender) as num_sent
    from letters
    group by sender),
receive_letter as (
    select receiver as user_receive, count(receiver) as num_received
    from letters
    group by receiver)
select user_send as user_id, num_sent as sent, num_received as received
from send_letter
Inner join receive_letter
on user_send = user_receive
order by user_id;
