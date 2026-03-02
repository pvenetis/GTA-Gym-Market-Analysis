# GTA Gym Market Analysis – Unionville Athletic Club

**Project Type:** Client Deliverable  
**Tools Used:** SQL Server, Python (pandas), Power BI, Excel
**Data Source:** Google Places API (public data)  

---

## Executive Summary

This report analyzes the competitive landscape for gyms in the Greater Toronto Area (GTA), focusing on **Markham, Richmond Hill, and Scarborough**, and presents insights for **Unionville Athletic Club**.

Key takeaways:

- The GTA gym market contains 56 target facilities after cleaning and filtering for relevant commercial gyms.  
- Average rating across the market: **4.34**, average reviews: **375**.  
- Top-rated gyms exist in each area, but many high-review gyms are low-tier, indicating opportunities for quality-focused competitors.  
- Unionville Athletic Club is a mid-tier competitor (4.3 rating, 255 reviews) with moderate visibility, positioned for growth.

---

## Project Objective

- Provide actionable insights into the competitive landscape of gyms in the GTA.  
- Identify market density, quality tiers, and top competitors.  
- Position Unionville Athletic Club relative to competitors to inform strategic decision-making.  
- Deliver a professional, client-ready dashboard.

---

## Methodology

### 1. Data Collection
- Pulled public gym data from **Google Places API** for Markham, Richmond Hill, and Scarborough.  
- Initial dataset: 86 facilities including gyms, yoga studios, martial arts, and other fitness-related businesses.

### 2. Data Cleaning
- Removed gyms outside target areas (Stouffville, Thornhill, North York, Maple).  
- Converted zero ratings/review counts to `NULL`.  
- Removed 21 non-competitive facilities (e.g., yoga, pilates, climbing, martial arts).  
- Final dataset: **56 gyms** across the target areas.

### 3. Feature Engineering
- Added `area` column based on address.  
- Created `rating_tier` to classify gyms:
  - **High Tier (4.5+)**  
  - **Mid Tier (4.0–4.49)**  
  - **Low Tier (<4.0)**

### 4. Analysis & Visualizations
- Summarized gyms by **area** and **rating tier**.  
- Created **Power BI dashboard** with:
  - Market density map by area & rating tier  
  - Rating vs. review count scatter to visualize quality vs. engagement  
  - Stacked bar chart showing gyms by rating tier per area  
  - Top 5 competitors by review volume  

---

## Key Results

### Market Overview
| Area            | Gym Count | Avg Rating | Avg Reviews |
|-----------------|-----------|------------|------------|
| Markham         | 25        | 4.32       | 409        |
| Scarborough     | 18        | 4.30       | 436        |
| Richmond Hill   | 13        | 4.42       | 224        |

### Rating Tier Distribution
- **High Tier (4.5+)**: 27 gyms (48%)  
- **Mid Tier (4.0–4.49)**: 15 gyms  
- **Low Tier (<4.0)**: 14 gyms  

### Competitive Positioning
- **Unionville Athletic Club**: Rating 4.3, 255 reviews (mid-tier, moderate visibility).  
- Many high-review gyms are low-tier, suggesting quality-focused competitors have opportunities to differentiate.  
- Scatter plot analysis shows Unionville in the **upper-left quadrant**: higher rating relative to some high-volume competitors but trailing in engagement.

---

## Dashboard Highlights

### Market Density Map
![Market Density Map](Dashboard/map_density.png)  
*Shows concentration of gyms by area and rating tier.*

### Quality vs Engagement Scatter
![Quality vs Engagement Scatter](Dashboard/scatter_quality_vs_engagement.png)  
*Highlights Unionville Athletic Club relative to competitors.*

### Gyms by Rating Tier per Area
![Rating Tier Bar Chart](Dashboard/tier_bar_chart.png)  
*Displays composition of High, Mid, and Low tier gyms across areas.*

### Top Competitors by Review Volume
![Top Competitors Bar Chart](Dashboard/top5_bar_chart.png)  
*Identifies the gyms with highest visibility in terms of review count.*

---

## Insights & Recommendations

1. **Visibility vs Quality Gap**
   - Some high-review gyms are low-rated, creating opportunities for Unionville to capture attention with higher-quality positioning.

2. **Strategic Positioning for Unionville**
   - Strengthen review volume through targeted campaigns, referrals, and local SEO.  
   - Maintain service quality to preserve mid-to-high rating.  
   - Consider community engagement initiatives to increase brand awareness without compromising rating.

3. **Area-Specific Insights**
   - Markham has the largest number of gyms and slightly lower average rating than Richmond Hill, indicating both competition and opportunity.  
   - Scarborough shows a mix of high-visibility low-tier gyms — a potential target market for quality differentiation.

---

## Conclusion

This dashboard and analysis provide a **professional, client-ready view of the GTA gym market**. Unionville Athletic Club is well-positioned to leverage its mid-tier rating into stronger visibility and competitive advantage.

---

## Repository Contents

- **Dashboard/** – Power BI file and screenshots  
- **Report/** – Figures and markdown write-up  
- **Data/** – Cleaned and raw data (public)  
- **Notebooks/** – Python analysis scripts (optional)