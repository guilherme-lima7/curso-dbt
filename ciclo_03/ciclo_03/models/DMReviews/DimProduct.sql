select distinct
	"ProductId" as product_id,
	md5(random()::text) as product_name
from {{ source('StgReviews', 'reviews') }} -- from "ciclo_03_StgReviews".Reviews r
