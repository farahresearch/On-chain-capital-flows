-- Wallets that received ETH but never sent ETH
-- Data source: ethereum.transactions (Dune Analytics)
-- Join type: LEFT JOIN

SELECT
  r.to AS wallet_address,
  COUNT(*) AS received_tx_count
FROM ethereum.transactions r
LEFT JOIN ethereum.transactions s
  ON r.to = s.from
WHERE s.from IS NULL
  AND r.value > 0
GROUP BY r.to
ORDER BY received_tx_count DESC
LIMIT 100;
