Create View Reviews_data as 
select
o.order_id,
r.review_score,
DATEDIFF(day,r.review_creation_date,r.review_answer_timestamp) as support_response_time,

case 
     when r.review_score in (4,5) then 'Positive'
     when r.review_score =3 then 'Neutral'
     when r.review_score in (1,2) then 'Negative'
     else 'UnKnown'
   end as customer_feedback_category ,


case 
     when review_comment_message is null and review_score in(4,5) then 'Positive_NoComment'
     when review_comment_message is null and review_score =3 then 'Neutral_NoComment'
     when review_comment_message is null and review_score in(1,2) then 'Negative_NoComment'
     else 'Has_Comment'
   end as review_engagement_segment,

   case
     when DATEDIFF(day,r.review_creation_date,r.review_answer_timestamp) in(0,1) then 'Fast'
     when DATEDIFF(day,r.review_creation_date,r.review_answer_timestamp) between 2 and 7 then 'Medium'
     when DATEDIFF(day,r.review_creation_date,r.review_answer_timestamp) between 7 and 30 then 'Slow'
     else 'Critical Failure'
   end as Response_time_category

   from orders o
left join order_reviews r
on r.order_id = o.order_id