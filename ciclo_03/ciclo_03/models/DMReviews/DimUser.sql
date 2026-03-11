select distinct
	"UserId" as user_id,
	upper(trim("ProfileName")) as profile_name
from {{ source('StgReviews', 'reviews') }} -- from "ciclo_03_StgReviews".reviews r
