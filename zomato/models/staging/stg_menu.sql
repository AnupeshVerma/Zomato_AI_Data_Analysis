-- Here the source is from source that we have defined in the __sources.yml file.
-- The source is raw and the table is menu.

SELECT
    menu_id,
    TRY_TO_NUMBER(r_id) AS restaurant_id,
    f_id,
    cuisine,
    TRY_TO_DECIMAL(price, 10, 2) AS price,
FROM {{ source('raw', 'menu') }}
WHERE TRY_TO_NUMBER(r_id) IS NOT NULL