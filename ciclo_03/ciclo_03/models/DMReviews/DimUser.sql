select distinct
	"UserId" as user_id,
	upper("ProfileName") as profile_name
	from "ciclo_03_StgReviews"."Reviews"
