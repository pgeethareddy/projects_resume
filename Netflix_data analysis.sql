use project;
-- 1.How many total records are there in the Netflix dataset?
select count(*) as total_rows from netflix_data;
-- 2.In which months is content most frequently added?
SELECT 
  MONTHNAME(STR_TO_DATE(date_added, '%m/%d/%Y')) AS month_name,
  COUNT(*) AS total_titles_added
FROM netflix_data
WHERE date_added IS NOT NULL AND date_added != ''
GROUP BY month_name
ORDER BY total_titles_added DESC;
-- 3. What is the count of titles for each age-based rating category?
select rating_age,count(*) as rating_ages from netflix_data group by rating_age order by rating_ages desc;
-- 4. Which TV show has the longest duration in minutes?
select title,duration_mins from netflix_data where type="tv show" and duration_mins=(select max(duration_mins) as duration_maxxx from netflix_data where type="tv show");
select distinct director from netflix_data;
-- 5.How many movies or TV shows has each director worked on?
SELECT director, COUNT(*) AS total_titles
FROM netflix_data
WHERE director IS NOT NULL AND director != ''
GROUP BY director
ORDER BY total_titles DESC;
-- 6.how many total number of titles are available on netflix?
select count(title) as total_titles from netflix_data;
-- 7.HOW MANY titles are movies vls shows?
select type,count(type) as total_count from netflix_data group by type;
-- 8.what are the top 10 frequent genres categories listed?
select listed_in,count(*) as count from netflix_data group by listed_in order by count desc limit 10;
-- 9.how many show were added each year?
SELECT EXTRACT(YEAR FROM STR_TO_DATE(date_added, '%m/%d/%Y')) AS year_added, COUNT(*) AS tv_show_count FROM netflix_data WHERE type = 'TV Show' AND date_added IS NOT NULL GROUP BY year_added ORDER BY year_added;
-- 10.what is the distribution of contant across different ratings?
SELECT rating, COUNT(*) AS total_titles FROM netflix_data WHERE rating IS NOT NULL AND rating != '' GROUP BY rating ORDER BY total_titles DESC;
-- 11.what is the average duration of movies in minutes?
SELECT AVG(duration_mins) AS average_movie_duration FROM netflix_data WHERE type = 'Movie' AND duration_mins IS NOT NULL;
-- 12.which movie has the longest duration?
SELECT title, duration_mins FROM netflix_data WHERE type = 'Movie' AND duration_mins IS NOT NULL ORDER BY duration_mins DESC LIMIT 1;
-- 13.WHICH TV SHOW HAS THE HIGHEST NO.OF SEASONS?
SELECT title, duration FROM netflix_data WHERE type = 'TV Show' AND duration IS NOT NULL ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC LIMIT 1;
