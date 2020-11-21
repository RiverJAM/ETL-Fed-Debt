### ETL-Fed-Debt

(main-code-file is jupyter notebooks combined)

### Extract
  This project intends to analyze the possible relationship between the federal interest rate and total consumer debt levels. This analysis will utilize data from 1991 to 2020, and will primarily pull data from the New York Federal Reserve (newyorkfed.org), and an open source, online community of data scientists known as Kaggle (kaggle.com). 
  The data sources were all xlsm files, so we converted them to .csv and transformed the debt data which had x and y axis flipped from '99-'03. We used pandas read_csv to create a pandas dataframe to transform the data. 

### Transform
The data on household debt were transformed seperately from the data on Federal Interest rates.

The data on household debt columns were renamed to match each other and to eliminate the use of capital letters or spaces for ease of use with postgreSQL. Null rows were dropped and rows that were not a part of the data were dropped to format the data correctly. Furthermore, columns that were not of interest were dropped as well (i.e. Credit scores). Student Loan data was not tracked before 2003, so it is marked NaN for those rows. It is not included in other during the time period before 2003.

The initial transformation of the federal interest rate data involved reducing the data set down to our desired range, in this case we used a Pandas operation to select all entries for the years 1999 to 2017. It should be noted that this data range was partly determined by the available data, as the federal interest rates were only provided in a range from July of 1954 to March of 2017. Once this data set was reduced to the relevant entries, we utilized a Python for loop to calculate the quarterized interest rates for our data set. This for loop simply iterated through all months in our data set and grouped them into quarters, calculated the average interest rate for those quarters, and then added the newly calculated interest rate to a new Python list. The final step in this process was to utilize Pandas to convert this list into a dataframe.

### Load

We first created a database in PostgreSQL and tables within the database (fed_df and fedrates_df). Then using a rds connection string to postgres and an engine we checked to see that the tables were there in our Jupyter notebook. Following this we used pandas to send our pandas dataframes into the PostgreSQL tables. Finally, we queried SQL within our Jupyter notebook to make sure both tables were added.
