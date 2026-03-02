-- ==========================================
-- 1️ Gyms Table Creation
-- ==========================================
CREATE TABLE gyms (
    id INT IDENTITY(1,1) PRIMARY KEY,
    place_id NVARCHAR(255) UNIQUE NOT NULL,
    name NVARCHAR(255),
    rating FLOAT,
    review_count INT,
    latitude FLOAT,
    longitude FLOAT,
    address NVARCHAR(500),
    created_at DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- 2️ Quick Summary of All Gyms
-- ==========================================
SELECT 
    COUNT(*) AS total_gyms,
    AVG(rating) AS avg_rating,
    AVG(review_count) AS avg_reviews
FROM gyms;

-- ==========================================
-- 3️ Top 10 Gyms by Review Count
-- ==========================================
SELECT TOP 10
    name,
    rating,
    review_count
FROM gyms
ORDER BY review_count DESC;

-- ==========================================
-- 4️ Add Area Column for Target Geography
-- ==========================================
ALTER TABLE gyms
ADD area NVARCHAR(100);

UPDATE gyms
SET area = 
    CASE 
        WHEN address LIKE '%Markham%' THEN 'Markham'
        WHEN address LIKE '%Richmond Hill%' THEN 'Richmond Hill'
        WHEN address LIKE '%Scarborough%' THEN 'Scarborough'
        ELSE 'Other'
    END;

-- ==========================================
-- 5️ Remove Gyms Outside Target Areas
-- ==========================================
DELETE FROM gyms 
WHERE area = 'Other';

-- ==========================================
-- 6️ Summary Stats by Area
-- ==========================================
SELECT 
    area,
    COUNT(*) AS gym_count,
    AVG(rating) AS avg_rating,
    AVG(review_count) AS avg_reviews
FROM gyms
GROUP BY area
ORDER BY gym_count DESC;

-- ==========================================
-- 7️ Remove Gyms with No Reviews or Ratings
-- ==========================================
DELETE
FROM gyms
WHERE review_count <= 0
   OR rating <= 0;

-- ==========================================
-- 8️ Remove Non-Competitive Facilities
-- Only keep: Commercial Gyms, Strength & Conditioning, CrossFit, Personal Training
-- ==========================================
-- Inspect remaining names and areas
SELECT 
    name, 
    area
FROM gyms
ORDER BY name;

-- Delete non-gym/irrelevant facilities
DELETE FROM gyms
WHERE LOWER(name) LIKE '%yoga%'
   OR LOWER(name) LIKE '%pilates%'
   OR LOWER(name) LIKE '%martial%'
   OR LOWER(name) LIKE '%muay%'
   OR LOWER(name) LIKE '%karate%'
   OR LOWER(name) LIKE '%taekwondo%'
   OR LOWER(name) LIKE '%climb%'
   OR LOWER(name) LIKE '%badminton%'
   OR LOWER(name) LIKE '%gymnastics%'
   OR LOWER(name) LIKE '%dance%'
   OR LOWER(name) LIKE '%boulder%';

-- ==========================================
-- 9️ Create Rating Tier Summary by Area
-- ==========================================
SELECT
    area,
    CASE 
        WHEN rating >= 4.5 THEN 'High Tier (4.5+)'
        WHEN rating >= 4.0 THEN 'Mid Tier (4.0–4.49)'
        WHEN rating IS NULL THEN 'No Rating'
        ELSE 'Low Tier (<4.0)'
    END AS rating_tier,
    COUNT(*) AS gym_count
FROM gyms
GROUP BY 
    area,
    CASE 
        WHEN rating >= 4.5 THEN 'High Tier (4.5+)'
        WHEN rating >= 4.0 THEN 'Mid Tier (4.0–4.49)'
        WHEN rating IS NULL THEN 'No Rating'
        ELSE 'Low Tier (<4.0)'
    END
ORDER BY 
    area, 
    rating_tier;

-- ==========================================
-- 10️ Create View for Clean Analysis
-- ==========================================
CREATE VIEW vw_gyms_analysis AS
SELECT
    place_id,
    name,
    rating,
    review_count,
    latitude,
    longitude,
    address,
    area,
    CASE 
        WHEN rating >= 4.5 THEN 'High Tier (4.5+)'
        WHEN rating >= 4.0 THEN 'Mid Tier (4.0–4.49)'
        WHEN rating < 4.0 THEN 'Low Tier (<4.0)'
        ELSE NULL
    END AS rating_tier
FROM gyms;

-- ==========================================
-- 11️⃣ Inspect View
-- ==========================================
SELECT * FROM vw_gyms_analysis;