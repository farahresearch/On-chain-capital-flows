 -- Day 1: SQL Foundations for On-Chain Analysis
-- Focus: Whale identification using basic SQL commands

-- 1. Filter large (whale) transactions
SELECT
    tx_hash,
    from_address,
    to_address,
    token_symbol,
    amount
FROM whale_transactions
WHERE amount > 50;

-- 2. Count transactions per wallet
SELECT
    from_address AS wallet,
    COUNT(*) AS transaction_count
FROM whale_transactions
GROUP BY from_address;

-- 3. Total value moved per wallet
SELECT
    from_address AS wallet,
    SUM(amount) AS total_transferred
FROM whale_transactions
GROUP BY from_address;

-- 4. Rank wallets by total transferred value
SELECT
    from_address AS wallet,
    SUM(amount) AS total_transferred
FROM whale_transactions
GROUP BY from_address
ORDER BY total_transferred DESC;

-- 5. Focus on top whale wallets
SELECT
    from_address AS wallet,
    SUM(amount) AS total_transferred
FROM whale_transactions
GROUP BY from_address
ORDER BY total_transferred DESC
LIMIT 5;
