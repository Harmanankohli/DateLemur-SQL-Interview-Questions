SELECT advertiser_id, round(CAST(sum(revenue) / sum(spend) as numeric),2) as roas
FROM ad_campaigns 
group by advertiser_id
ORDER BY advertiser_id;
