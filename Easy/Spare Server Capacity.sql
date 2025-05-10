SELECT d.datacenter_id,  (d.monthly_capacity - sum(f.monthly_demand)) as spare_capacity
FROM datacenters d
LEFT JOIN forecasted_demand f
on d.datacenter_id = f.datacenter_id
Group by d.datacenter_id, d.monthly_capacity
order by d.datacenter_id;
