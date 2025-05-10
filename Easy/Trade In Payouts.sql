SELECT tt.store_id, SUM(tp.payout_amount) as payout_total
FROM trade_in_transactions tt
LEFT JOIN trade_in_payouts tp
ON tt.model_id = tp.model_id
GROUP BY tt.store_id
ORDER BY payout_total DESC;
