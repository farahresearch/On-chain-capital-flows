-- Analysis: Whale Wallet Identification
-- Objective:
-- Identify high-impact wallets based on value transferred,
-- prioritizing economic significance over raw activity.

-- Dataset Assumption:
-- whale_transactions represents token transfers above a
-- predefined economic threshold.

-- Step 1: Filter economically significant transactions
SELECT
    tx_hash,
    from_address,
    to_address,
    token_symbol,
    amount
FROM whale_transactions
WHERE amount > 50;

-- Step 2: Aggregate whale behavior by wallet
SELECT
    from_address AS wallet,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_transferred
FROM whale_transactions
GROUP BY from_address;

-- Step 3: Rank wallets by capital dominance
SELECT
    from_address AS wallet,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_transferred
FROM whale_transactions
GROUP BY from_address
ORDER BY total_transferred DESC
LIMIT 20;

