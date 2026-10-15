-- Here the source is from source that we have defined in the __sources.yml file.
-- The source is raw and the table is reviews.

SELECT
    r.review_id,
    r.order_id,
    r.user_id::NUMBER AS customer_id,
    r.restaurant_id::STRING AS restaurant_id,
    r.rating::NUMBER AS rating,
    r.comment::STRING AS comment,
    r.review_date::DATE AS review_date,
    res.city AS city,
FROM {{ source('raw', 'reviews') }} AS r
LEFT JOIN {{ ref('stg_restaurants') }} AS res
    ON r.restaurant_id::STRING = res.restaurant_id
WHERE r.comment IS NOT NULL