select 
	f.review_id,
	u.user_id,
	u.profile_name,
	p.product_id,
	p.product_name,
	t.summary,
	f.score,
	f.datetime,
    f.helpfulness_numerator
from        {{ ref('FactReview') }} f
left join   {{ ref('DimReviewText') }} t on t.review_id = f.review_id
left join   {{ ref('DimUser') }}       u on u.user_id = f.user_id
left join   {{ ref('DimProduct') }}    p on p.product_id = f.product_id
order by f.score desc
