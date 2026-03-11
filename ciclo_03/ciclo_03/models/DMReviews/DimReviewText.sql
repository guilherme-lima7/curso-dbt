select distinct
	"Id" as review_id,
	upper(trim("Summary")) as summary,
	upper(trim("Text")) as long_text
from {{ source('StgReviews', 'reviews') }} -- from "ciclo_03_StgReviews".Reviews r
