-- STEP 1: DATA CLEANING & RE-TABLE CREATION
CREATE OR REPLACE TABLE `your_project.your_dataset.cleaned_funnel_data` AS
SELECT DISTINCT
  user_pseudo_id,
  event_name,
  PARSE_DATE('%Y%m%d', event_date) AS date,
  device.category AS device_type,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'transaction_id') AS transaction_id
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
  AND user_pseudo_id IS NOT NULL
  AND device.category IN ('mobile', 'desktop', 'tablet');

-- STEP 2: FUNNEL METRICS GENERATION
SELECT
  device_type,
  COUNT(DISTINCT CASE WHEN event_name = 'session_start' THEN user_pseudo_id END) AS sessions,
  COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END) AS product_views,
  COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END) AS cart_adds,
  COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END) AS checkouts,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END) AS purchases,
  
  ROUND(COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END) / 
    NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'session_start' THEN user_pseudo_id END), 0) * 100, 2) AS session_to_view_pct,
    
  ROUND(COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END) / 
    NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END), 0) * 100, 2) AS view_to_cart_pct,
    
  ROUND(COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END) / 
    NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END), 0) * 100, 2) AS cart_to_checkout_pct,
    
  ROUND(COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END) / 
    NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END), 0) * 100, 2) AS checkout_to_purchase_pct
FROM `your_project.your_dataset.cleaned_funnel_data`
GROUP BY 1
ORDER BY sessions DESC;
