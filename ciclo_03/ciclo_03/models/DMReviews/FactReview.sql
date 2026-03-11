select distinct
	"Id" as review_id,
	"UserId" as user_id,
	"ProductId" as product_id,
	"HelpfulnessNumerator" as helpfulness_numerator,
	"HelpfulnessDenominator" as helpfulness_denominator,
	"HelpfulnessNumerator" / case when "HelpfulnessDenominator" = 0 then 1 else "HelpfulnessDenominator" end as helpfulness_fraction,
	"Score" as score,
	to_timestamp("Time") as datetime
from {{ source('StgReviews', 'reviews') }} -- from "ciclo_03_StgReviews".Reviews r
