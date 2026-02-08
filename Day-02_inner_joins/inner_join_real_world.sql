-- =========================================================
-- TRANSACTION-LEVEL ACTIVITY FILTERING USING INNER JOIN
-- Purpose:
-- Use INNER JOIN to isolate confirmed on-chain activity
-- by retaining only records that exist across datasets.
--
-- Analyst Use Cases:
-- - Active wallet identification
-- - Whale transaction filtering
-- - Protocol usage measurement
-- - Entity-attributed transfer analysis
-- =========================================================
-- 1) Active Wallets identification
-- Wallets that have actually sent transactions
SELECT
  w.address,
  w.label,
  t.value
FROM wallets w
INNER JOIN transactions t
  ON w.address = t.from_address;


-- 2) High-Value Transactions Filtering (Whale Activity)
SELECT
  w.label,
  t.from_address,
  t.value
FROM wallets w
INNER JOIN transactions t
  ON w.address = t.from_address
WHERE t.value >= 10
ORDER BY t.value DESC;


-- 3) Active Wallets by Total Volume
SELECT
  w.label,
  SUM(t.value) AS total_value
FROM wallets w
INNER JOIN transactions t
  ON w.address = t.from_address
GROUP BY w.label
HAVING SUM(t.value) > 100;


-- 4) Protocol Usage Analysis
SELECT
  p.name AS protocol_name,
  COUNT(tx.tx_hash) AS tx_count
FROM protocols p
INNER JOIN transactions tx
  ON p.protocol_id = tx.protocol_id
GROUP BY p.name;


-- 5) User Spending Behavior
SELECT
  u.name,
  SUM(o.amount) AS total_spent
FROM users u
INNER JOIN orders o
  ON u.user_id = o.user_id
GROUP BY u.name;


-- 6) Transactions With USD Value
SELECT
  t.tx_hash,
  t.value,
  p.price_usd
FROM transactions t
INNER JOIN prices p
  ON t.block_time = p.block_time;


-- 7) Labeled Entity Transfers
SELECT
  a.entity,
  t.from_address,
  t.to_address,
  t.value
FROM addresses a
INNER JOIN transactions t
  ON a.address = t.from_address;


-- 8) Entity-to-Entity Transfers
SELECT
  sender.entity AS sender_entity,
  receiver.entity AS receiver_entity,
  t.value
FROM transactions t
INNER JOIN addresses sender
  ON t.from_address = sender.address
INNER JOIN addresses receiver
  ON t.to_address = receiver.address;


-- 9) Login Activity (Distinct + Join)
SELECT
  u.country,
  COUNT(DISTINCT l.device_id) AS unique_devices
FROM users u
INNER JOIN logins l
  ON u.user_id = l.user_id
GROUP BY u.country;


-- =========================================================
-- ANALYST RULE:
-- INNER JOIN keeps only records that exist in BOTH tables.
-- Used to filter for real activity and meaningful behavior.
-- =========================================================
