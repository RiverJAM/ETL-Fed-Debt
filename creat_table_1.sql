drop table FED_df
drop table FEDRates_df

CREATE TABLE FED_df (
    quarter VARCHAR Primary Key,
    mortgage  FLOAT,
    he_revolving FLOAT,
    auto_loan FLOAT,
    credit_card FLOAT,
    other FLOAT,
    total FLOAT,
    student_loan FLOAT

);

CREATE TABLE FEDRates_df (
	quarter VARCHAR Primary Key,
	rate FLOAT
	);