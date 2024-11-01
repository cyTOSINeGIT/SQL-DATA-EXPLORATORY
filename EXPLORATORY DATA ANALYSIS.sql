SELECT*
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off), MIN(total_laid_off), MIN(percentage_laid_off)
FROM layoffs_staging2;

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT Company, sum(total_laid_off)
FROM layoffs_staging2
group by company;

SELECT Company, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT industry, sum(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT location, max(total_laid_off), min(total_laid_off), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY location
ORDER BY 2 DESC;

SELECT*
FROM layoffs_staging2
WHERE location LIKE 'Iba%';

SELECT `date`
FROM layoffs_staging2;

SELECT `date`,
STR_TO_DATE (`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE (`date`, '%m/%d/%Y');

SELECT year (`date`), max(total_laid_off), min(total_laid_off), sum(total_laid_off)
FROM layoffs_staging2
GROUP BY `date`;

SELECT*
FROM layoffs_staging2;

SELECT YEAR, Sum(total_laid_off)
FROM layoffs_staging2
GROUP BY year
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT YEAR (`date`), Sum(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


SELECT*
FROM layoffs_staging2;

SELECT stage, SUM(percentage_laid_off), ROUND(AVG(percentage_laid_off), 2)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- ROLLING TOTAL
-- MONTH  AND SUM

SELECT SUBSTRING(`date`,1,7) AS `MONTH`,
SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- ROLLING SUM

WITH Rolling_Total AS 
(SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,
SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total; 


---- Company, year and laid_off -----

SELECT Company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company, YEAR(`date`);

---- CTE ----

WITH company_Year ( Company, years, total_laid_off) AS
(
SELECT Company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company, YEAR(`date`)
)
SELECT*, DENSE_RANK () OVER(PARTITION BY YEARS ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY Ranking ASC;

---- CTE 2 -----

WITH company_Year ( Company, years, total_laid_off) AS
(
SELECT Company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY Company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT*, DENSE_RANK () OVER(PARTITION BY YEARS ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT*
FROM Company_Year_Rank
WHERE Ranking <= 5;