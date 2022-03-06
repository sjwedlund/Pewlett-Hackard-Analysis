# Pewlett Hackard Analysis

## Overview of The Analysis
The purpose of this analysis is to help Pewlett Hackard prepare for the upcoming "Silver Tsunami" by determining the number of retiring employees at the company, born between 1952 and 1955, and to identify employees who are eligible to participate in a mentorship program. 

## Results
In Deliverables 1 & 2, I have created the following tables:

- Retirement Titles table
- Unique Titles table
- Retiring Titles table
- Mentorship Eligibility table

### Retirement Titles
I performed an inner join from the employees and titles tables on the primary key into a new table called retirement_titles. I filtered the data to retrieve the employees who were born between 1952 and 1955 and then ordered the data by employee number.  

<img width="789" alt="retirement_titles" src="https://user-images.githubusercontent.com/85920136/156281939-9a3a74a0-f414-4e33-a7b1-e227bf2c36b1.png">

### Unique Titles
After creating the retirement_titles table and importing the CSV file, there were duplicate entries for those employees who had switched titles over the years. I cleaned the data to remove the duplicate titles in order to keep only the most recent title of each employee. I retrieved the employee number, first and last name, and title columns fromt the Retirement Titles table to be used in the new table holding the most recent title of each employee. I used the DISTINCT ON statement to retrieve the first occurence of the employee number for each set of rows. Then I created a Unique Titles table using the INTO clause, and sorted it in ascending order by employee number and descending order by the last date of most recent title. 

<img width="626" alt="unique_titles" src="https://user-images.githubusercontent.com/85920136/156283142-8d35b572-518d-4a49-8bc8-cc0ed2051f64.png">


### Retiring Titles
Next, I wrote another query to retrieve the number of employees by their most recent job title who are about to retire. I retrieved the number of titles from the Unique Titles table. Then, I created a Retiring Titles table to hold the required information. I grouped the table by title and sorted the count column in descending order. The table below shows that there are 57,668 Senior Engineers and Senior Staff combined, out of 90,398 total employees retiring, which accounts for approximately 64% of all retirees. 

<img width="366" alt="retiring_titles" src="https://user-images.githubusercontent.com/85920136/156283960-428fe7eb-12e3-43e8-a9d4-fdeccea5d6da.png">


### Mentorship Eligibility 
I wrote a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program. I performed an inner join using DISTINCT ON to join columns from the Employees table with columns from the Department Employee table along with the title column of the Titles table. Then I filtered the data to show all current employees born in 1965, in order by employee number. 

<img width="876" alt="mentorship_eligibility" src="https://user-images.githubusercontent.com/85920136/156284652-085154b5-d95a-4763-a44e-e65926d6bd3f.png">


## Summary
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
- Query for younger employees
- Pre-retirement Table

There is a total of 240,214 current employees with the company, and there are 90,398 roles that will need to be filled as older employees start to retire. That accounts for approximately 38% of PH employees who are approaching retirement. At the moment, there are 1549 employees born in 1965 who are qualified to participate in the mentorship program. 

Looking at the CSV file of current employees that I created, there don't appear to be any birthdates after 1965. Performing a query for anyone born after 1965 did not return any results. PH is going to have to hire some fresh faces to fill the void caused by retiring employees. 

If the retiring employees are born between 1952 and 1955, and the upcoming mentees are born in 1965, how many employees are born between 1964 and 1956? I wrote a query to construct a table, below, of pre-retirement employees who would not need mentorship because they are on their way to retirement themselves. That query turned up 129,432 employees. 

<img width="931" alt="pre-retirement" src="https://user-images.githubusercontent.com/85920136/156908546-86440eea-d9c7-4700-873e-8ceeafb29201.png">


