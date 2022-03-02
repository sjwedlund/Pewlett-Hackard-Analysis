# Pewlett-Hackard Analysis

## Overview of The Analysis
The purpose of this analysis is to determine the number of retiring employees at Pewlett-Hackard, and to identify employees who are eligible to participate in a mentorship program. 

## Results
In Deliverables 1 & 2, I have created the following tables:

- Retirement Titles table
- Unique Titles table
- Retiring Titles table
- Mentorship Eligibility table

### Retirement Titles
I performed an inner join from the employees and titles tables on the primary key into a new table called retirement_titles. I filtered the data on birth_date column to retrieve the employees who were born between 1952 and 1955 and then ordered the data by employee number.  

<img width="789" alt="retirement_titles" src="https://user-images.githubusercontent.com/85920136/156281939-9a3a74a0-f414-4e33-a7b1-e227bf2c36b1.png">

### Unique Titles
After creating the retirement_titles table and importing the CSV file, there were duplicate entries for those employees who had switched titles over the years. I cleaned the data to remove the duplicate titles in order to keep only the most recent title of each employee. I retrieved the employee number, first and last name, and title columns fromt the Retirement Titles table to be used in the new table holding the most recent title of each employee. I used the DISTINCT ON statement to retrieve the first occurence of the employee number for each set of rows. Then I created a Unique Titles table using the INTO clause, and sorted it in ascending order by employee number and descending order by the last date of most recent title. 

<img width="626" alt="unique_titles" src="https://user-images.githubusercontent.com/85920136/156283142-8d35b572-518d-4a49-8bc8-cc0ed2051f64.png">


### Retiring Titles
### Mentorship Eligibility 

## Summary

