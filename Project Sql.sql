CREATE DATABASE Library;

    CREATE TABLE Staff (
	   A_username varchar(255) NOT NULL,
       Password varchar(255),
       FirstName varchar(255),
	   LastName varchar(255) NOT NULL,    
       Email varchar(255),
       Phone_Number int,
	   Post varchar(255),
	   Branch_ID int,
	   PRIMARY KEY (A_username)	  
    );

    CREATE TABLE Students(
       FirstName varchar(255),
	   LastName varchar(255),
       S_username varchar(255),
       Password varchar(255),
       Email varchar(255),
       Phone_Number int,
       Age int,
       DOB date,
	   PRIMARY KEY (S_username)
    );

	CREATE TABLE Publisher(
       Publisher_ID int NOT NULL,
       Address varchar(255),
       Name varchar(255)
	   PRIMARY KEY (Publisher_ID),
    );

	 CREATE TABLE Book(
        Book_Id int NOT NULL,
	    Title varchar(255),
        Genre varchar(255),
        ISBN int NOT NULL,
        Author varchar(255),
		CONSTRAINT PK_Book PRIMARY KEY (Book_Id,ISBN),
    );
	
	CREATE TABLE Book_2(
	   Book_Id int NOT NULL,
	   Title varchar(255),
	   Price int,
	   PRIMARY KEY (Book_Id)
	);

	CREATE TABLE Book_3(
	   Book_Id int NOT NULL,
	   Publisher_ID int,
	   FOREIGN KEY (Publisher_Id) REFERENCES Publisher(Publisher_Id)
	);

    CREATE TABLE Report (
       S_username varchar(255),
       Book_Id int NOT NULL,
	   ISBN int NOT NULL,
       Registration varchar(255),
       Issue_date date,
       Return_date date,
	   CONSTRAINT PK_Report PRIMARY KEY (Book_ID,ISBN)
    );

	CREATE TABLE Report_2(
	   Book_Id varchar(255) NOT NULL,
	   ISBN int NOT NULL,
	   S_username varchar(255),
	   DelayFIne int,
	   CONSTRAINT PK_Report_2 PRIMARY KEY (Book_ID,ISBN),
	);


    CREATE TABLE Authentication_1(
       A_username varchar(255),
	   Password varchar(255),
       OTP_varification int,
	   CHECK (OTP_varification > 1000 AND OTP_varification < 9999),
	   FOREIGN KEY (A_username) REFERENCES Staff(A_username)	   
    );

	CREATE TABLE Authentication_2(
       S_username varchar(255),
	   Password varchar(255),
       OTP_varification int,
	   CHECK (OTP_varification > 1000 AND OTP_varification < 9999),
	   FOREIGN KEY (S_username) REFERENCES Students(S_username)
    );

    CREATE TABLE Book_copies(
       Book_Id int NOT NULL,
       Branch_Id int NOT NULL,
       No_of_Copies int,
	   FOREIGN KEY (Branch_Id) REFERENCES Library_Branch(Branch_ID)
    );

	ALTER TABLE Book_copies
	ADD CHECK (No_of_Copies > 5)

    CREATE TABLE Library_Branch(
       Branch_Id int,
       Address varchar(255),
       Branch_Name varchar(255)
	   PRIMARY KEY (Branch_Id)
    );
	

	CREATE VIEW StudentDetails AS
    SELECT Students.Firstname, Students.LastName, Report.Book_Id, Report.Issue_date
    FROM Students, Report
    WHERE Students.S_username = Report.S_username;

	SELECT * FROM StudentDetails
	
	CREATE VIEW BookDetails AS
    SELECT Book_copies.Book_ID, Book_copies.No_of_Copies, Library_Branch.Branch_Name
	FROM  Book_copies, Library_Branch
    WHERE Book_copies.Branch_Id = Library_Branch.Branch_Id 
	

	SELECT * FROM BookDetails

	CREATE VIEW BookDetail AS
    SELECT Book.Author, Book.Title, Book_3.Book_Id, Book_3.Publisher_ID
	FROM  Book, Book_3
    WHERE Book.Book_Id = Book_3.Book_Id 

	SELECT * FROM BookDetail

    CREATE VIEW BookPrice AS
    SELECT Book.Title, Book.Genre, Book_2.Price
	FROM  Book, Book_2
    WHERE Book.Book_Id = Book_2.Book_Id 

	SELECT * FROM BookPrice

	CREATE VIEW OTP AS
    SELECT Staff.FirstName, Staff.LastName, Authentication_1.OTP_varification
	FROM  Staff, Authentication_1
    WHERE Staff.A_Username = Authentication_1.A_Username 

	SELECT * FROM OTP

	SELECT Students.FirstName, Students.LastName, Report.Book_Id
    FROM Students
    INNER JOIN Report
    ON Students.S_username = Report.S_username

    SELECT Book_copies.Book_ID, Book_copies.No_of_copies, Library_Branch.Branch_Name
    FROM Book_copies
    LEFT JOIN Library_branch
    ON Book_copies.Branch_Id = Library_Branch.Branch_Id
	Where (No_of_copies > 14)

	SELECT Book.Book_Id, Book.Title, Book_3.Publisher_ID
    FROM Book
    RIGHT JOIN Book_3
    ON Book.Book_Id = Book_3.Book_Id
	WHERE Publisher_Id = 4000
	
	SELECT  Authentication_1.A_username,  Authentication_1.Password, Authentication_2.S_username,  Authentication_2.Password
    FROM  Authentication_1
    FULL OUTER JOIN  Authentication_2
    ON Authentication_1.OTP_varification =  Authentication_2.OTP_varification

	SELECT Firstname, LastName, Phone_Number FROM Staff
	UNION ALL
	SELECT Firstname, LastName, Phone_Number FROM Students
	ORDER BY Phone_Number

	SELECT Staff.FirstName, Staff.LastName, Staff.Post, Library_Branch.Branch_Name, Library_Branch.Branch_Id
    FROM Staff
    INNER JOIN Library_Branch 
    ON Staff.Branch_ID = Library_Branch.Branch_Id
	ORDER BY Branch_Name


    


    

    
	

   
	
    



	
	
    


	




	
	

	


	


	

	



	 