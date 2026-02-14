select 
	"Id" as review_id,
	"UserId" as user_id,
	"ProductId" as product_id,
	"HelpfulnessNumerator" as helpfulness_numerator,
	"HelpfulnessDenominator" as helpfulness_denominator,
	"Score" as score,
	to_timestamp("Time") as datetime
from "ciclo_03_StgReviews"."Reviews"
