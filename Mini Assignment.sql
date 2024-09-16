create database unicorn_companies; 
use unicorn_companies;
CREATE TABLE unicorns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company VARCHAR(255),
    country VARCHAR(255),
    sector VARCHAR(255),
    valuation DECIMAL(10 , 2 ),
    found_year INT,
    investors TEXT
);
INSERT INTO unicorns (company, country, sector, valuation, found_year, investors)
VALUES 
('SpaceX', 'United States', 'Aerospace', 100.3, 2002, 'Fidelity, Founders Fund, Baillie Gifford'),
('Stripe', 'United States', 'FinTech', 95.0, 2010, 'Sequoia Capital, Andreessen Horowitz, Baillie Gifford'),
('ByteDance', 'China', 'Artificial Intelligence', 140.0, 2012, 'Sequoia Capital China, General Atlantic'),
('UiPath', 'United States', 'Robotics', 35.0, 2005, 'Accel, CapitalG, Sequoia Capital'),
('Klarna', 'Sweden', 'FinTech', 46.0, 2005, 'Sequoia Capital, Silver Lake, Dragoneer'),
('Airbnb', 'United States', 'Travel & Hospitality', 76.0, 2008, 'Sequoia Capital, Andreessen Horowitz, Silver Lake'),
('Robinhood', 'United States', 'FinTech', 38.0, 2013, 'Index Ventures, NEA, Ribbit Capital'),
('Nuro', 'United States', 'Autonomous Vehicles', 8.6, 2016, 'Greylock Partners, SoftBank Vision Fund, Lightspeed Venture Partners'),
('DoorDash', 'United States', 'Food Delivery', 75.0, 2013, 'Sequoia Capital, SoftBank Vision Fund, Coatue Management'),
('Palantir Technologies', 'United States', 'Software', 45.0, 2003, 'Founders Fund, Peter Thiel, In-Q-Tel'),
('Databricks', 'United States', 'Big Data', 43.0, 2013, 'Andreessen Horowitz, Microsoft, Coatue Management'),
('SpaceX', 'United States', 'Aerospace', 100.3, 2002, 'Fidelity, Founders Fund, Baillie Gifford'),
('ByteDance', 'China', 'Artificial Intelligence', 140.0, 2012, 'Sequoia Capital China, General Atlantic'),
('UiPath', 'United States', 'Robotics', 35.0, 2005, 'Accel, CapitalG, Sequoia Capital'),
('Klarna', 'Sweden', 'FinTech', 46.0, 2005, 'Sequoia Capital, Silver Lake, Dragoneer'),
('Airbnb', 'United States', 'Travel & Hospitality', 76.0, 2008, 'Sequoia Capital, Andreessen Horowitz, Silver Lake'),
('Robinhood', 'United States', 'FinTech', 38.0, 2013, 'Index Ventures, NEA, Ribbit Capital'),
('Nuro', 'United States', 'Autonomous Vehicles', 8.6, 2016, 'Greylock Partners, SoftBank Vision Fund, Lightspeed Venture Partners'),
('DoorDash', 'United States', 'Food Delivery', 75.0, 2013, 'Sequoia Capital, SoftBank Vision Fund, Coatue Management'),
('Palantir Technologies', 'United States', 'Software', 45.0, 2003, 'Founders Fund, Peter Thiel, In-Q-Tel'),
('Databricks', 'United States', 'Big Data', 43.0, 2013, 'Andreessen Horowitz, Microsoft, Coatue Management');



-- Top 5 Countries by Number of Unicorns
SELECT 
    country, COUNT(country) AS ucount
FROM
    unicorns
GROUP BY country
ORDER BY ucount DESC
LIMIT 5;
-- Could not locate data, therefore, i used data extration from GPT, and there must be some changed answers. 


SELECT 
    sector, ROUND(AVG(valuation)) AS aset
FROM
    unicorns
GROUP BY sector
ORDER BY aset DESC
LIMIT 3;

-- Unicorns Founded After 2010
SELECT DISTINCT
    (company), country, found_year
FROM
    unicorns
WHERE
    found_year > 2010;

-- Total Valuation of Unicorns in the FinTech Sector
SELECT 
    sector, SUM(valuation) AS Total_Valuation
FROM
    unicorns
WHERE
    sector = 'Fintech'
GROUP BY sector;

-- Most Common Investors
SELECT 
    investors, COUNT(*) AS investor_count
FROM
    unicorns
GROUP BY investors
ORDER BY investor_count DESC;


-- Identify Trends: Explore trends in the data, such as the growth of unicorns in specific sectors or countries.
SELECT 
    country, found_year, COUNT(*)
FROM
    unicorns
GROUP BY country , found_year
ORDER BY country , found_year;

SELECT 
    sector, found_year, COUNT(*)
FROM
    unicorns
GROUP BY sector , found_year
ORDER BY sector , found_year;

-- Investor Analysis: Which investors have the most unicorns in their portfolio
SELECT 
    investors, COUNT(*) AS ti_count
FROM
    unicorns
GROUP BY investors
HAVING COUNT(*) > 1
ORDER BY ti_count DESC;

-- Growth Analysis: Compare valuations of companies founded in different decades to understand growth trends.
SELECT 
    FLOOR(found_year / 10) * 10 AS decade,
    AVG(valuation) AS avg_valuation
FROM
    unicorns
GROUP BY decade
ORDER BY decade;




