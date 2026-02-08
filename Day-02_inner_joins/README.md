## Transaction-Level Activity Filtering Using INNER JOIN

This module demonstrates how INNER JOIN is used in on-chain analytics to isolate real economic activity by retaining only records that exist across multiple datasets.

The focus is on filtering noise, identifying active entities, and constructing reliable behavioral metrics from transaction-level data.

### Analytical Objectives
- Filter inactive or irrelevant wallets from analysis
- Isolate high-value and high-frequency actors
- Attribute transactions to labeled entities and protocols
- Build trustworthy metrics based on confirmed activity

### Methodology
- Use INNER JOIN to retain only matched records across datasets
- Apply aggregation and DISTINCT logic to measure activity intensity
- Emphasize economic relevance over raw transaction counts

### Included Analysis
- Active wallet identification
- High-value (whale) transaction filtering
- Protocol usage measurement
- Entity-to-entity transfer analysis

### Analyst Insight
INNER JOIN is a foundational tool for behavioral analysis. By excluding unmatched records, it ensures that insights are derived only from confirmed, economically meaningful activity.
