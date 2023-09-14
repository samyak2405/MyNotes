# Database

## 1. Types of Databases
1. Relational Databases
    - Use when your data is structured and consistent
	- support ACID transactions and complex queries
	- Eg: MySQL, PostgreSQL, Oracle
2. Key-Value Store
	- Use when data model is based on key-value pairs and requires high scalability and availability
	- Provides lightning-fast data retrieval and high throughput
	- Eg: Aerospike, DynamoDB
3. Document DB
	- Handles semi-structured data with varying fields
	- Provides schema flexibility and horizontal scaling
	- Eg: MongoDB, Couchbase
4. Graph DB
	- Perfect for data with complex relationships
	- Used in applications like social networks and recommendation engines.
	- Eg: Neo4j, Amazon Neptune
5. Columnar DB
	- Data is stored by columns instead of rows to optimize reading from a column
	- Great for applications that involve storing massive data sets and running analytical queries
	- Eg: HBase, Redshift
6. Time-Series Databases
	- Opt for this when dealing with time-series data like IOT sensor readings or server logs.
	- Great for efficient storage and retrieval of time-stamped data
		Eg: InfluxDB, Prometheus
7. In-Memory DB
	- When speed is of the essence, and you can afford to sacrifice persistence.
	- Ideal for caching, real-time analytics and high-frequency trading.
	- Eg: Redis and Memcached
8. Wide-Column Stores
	- use in applications with large volumes of data and high write throughput.
	- Best suited for read-heavy, analytical workloads.
	- Eg: Apache Cassandra
9. Search Engines
	- When your primary use case revolves around full-text search_condition
	- Essential for applications that require searching of data content.
	- Eg: Elasticsearch. Solr
10. Spatial DB
	- Used to store geographical and location-based data.
	- Choose for applications that require Spatial indexing, geospatial analytics.
	- Eg: PostGIS, CartoDB
11. Blob DB
    - Use in applications that requires storing large documents, images, audio and video files
	- Provides high availability, durability and cost effective storage
	- Eg: HDFS, Amazon S3
12. Ledger DB
	- Used for maintaining a transparent, immutable and cryptographically verifiable transaction log.
	- Useful for applications dealing with financial transactions and supply chain systems
	- Eg: Amazon QLDB, Azure SQL Ledger

## 2. Execution Sequence
    FROM -> WHERE -> SELECT -> DISTINCT -> ORDER BY

## 3. Querying Data
- SELECT FROM
- SELECT:  means that you can have a SELECT statement without the FROM clause

```
Syntax: SELECT select_list;
		Eg. SELECT 1+1;
		OUTPUT:  1+1
		          2
```
- MySQL has many built-in functions like string, date, and Math functions. And you can use the SELECT statement to execute these functions
- Eg: SELECT NOW(); ->current date and time
	- Use the dual table if you want to use the FROM clause but don’t want to reference a table.
    - Eg: SELECT select_list FROM dual;
	- Assign an alias to a column to make it more readable
	- Eg: SELECT expression AS column_alias;

## 4. Sorting data
- ORDER BY
  ```
	Syntax: 
		SELECT select_list
		FROM table_name
		ORDER BY 
			column1 [ASC|DESC], 
			column2 [ASC|DESC],
			...;
  ```

## 5. Filtering Data
- WHERE
- SELECT DISTINCT
- AND
- OR
IN: - The IN operator allows you to determine if a value matches any value in a list of values. Here’s the syntax of the IN operator:
	- syntax: value IN (value1, value2, value3,...)
	- The IN operator returns 1 (true) if the value equals any value in the list (value1, value2, value3,…). Otherwise, it returns 0.
	- The IN operator is functionally equivalent to the combination of multiple OR operators: value = value1 OR value = value2 OR value = value3 OR ...
	- NOT IN: - The NOT operator negates the IN operator
	- BETWEEN: - The BETWEEN operator is a logical operator that specifies whether a value is in a range or not. Here’s the syntax of the - BETWEEN operator:
		- sytnax: value BETWEEN low AND high;
		- The BETWEEN operator returns 1 if: value >= low AND value <= high
		- Otherwise, it returns 0.
	- LIKE: - The LIKE operator is a logical operator that tests whether a string contains a specified pattern or not.
		- Syntax: expression LIKE pattern ESCAPE escape_character
		- In this syntax, if the expression matches the pattern, the LIKE operator returns 1. Otherwise, it returns 0.
		- MySQL provides two wildcard characters for constructing patterns: percentage % and underscore _ .
		- The percentage ( % ) wildcard matches any string of zero or more characters.
		- The underscore ( _ ) wildcard matches any single character.
		- For example, s% matches any string starts with the character s such as sun and six. The se_ matches any string starts with  se and is followed by any character such as see and sea.
		- When the pattern contains the wildcard character and you want to treat it as a regular character, you can use the ESCAPE clause.
LIMIT - The LIMIT clause is used in the SELECT statement to constrain the number of rows to return. 
		- syntax: SELECT select_list FROM table_name LIMIT [offset,] row_count;
		- The offset specifies the offset of the first row to return. The offset of the first row is 0, not 1.
        - The row_count specifies the maximum number of rows to return.
IS NULL - To test whether a value is NULL or not, you use the  IS NULL operator. Here’s the basic syntax of the IS NULL operator:
		- syntax: value IS NULL
		- If the value is NULL, the expression returns true. Otherwise, it returns false.
			
## 6. Joining Tables
Inner Join: - The INNER JOIN matches each row in one table with every row in other tables and allows you to query rows that contain columns from both tables.
			- The INNER JOIN is an optional clause of the SELECT statement. It appears immediately after the FROM clause. Here is the syntax of the INNER JOIN clause:

	Syntax: SELECT select_list FROM t1 INNER JOIN t2 ON join_condition1 INNER JOIN t3 ON join_condition2 ...;
					
					
## 7. Stored Procedures
- When we issue query to MySQL Server, MySQL processes the query and returns the result set. If you want to save this query on the database server for execution later,
	  one way to do it is to use a stored procedure.
- It is a segment of declarative SQL statements stored inside the MySQL Server.
- First time when a stored procedure's code is invoked, MySQL looks up for the name in the database catalog, compiles the stored procedure's code, place it in a memory area known as a cache and execute the stored procedure.
- If you invoke the same stored procedurein the same session again, MySQL execute the stored procedure from the cache without having to recompile it.
- Can have parameters so you can pass values to it and get the result back.
- May contain control flow statements such as IF, CASE and LOOP that allow you to implement the code in the procedural way.
- Can call other stored procedures or stored functions
	
### Advantages
1. Reduce network traffic
2. Centralize business logic in the DB
3. Make database more secure

### Disadvantages
1. Resource usages
2. Troubleshooting
3. Maintenances
		
**a. MySQL CREATE PROCEDURE statement**

```
SELECT * FROM PRODUCTS;
or
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN 
	SELECT * FROM products;
END //
DELIMITER;
	
Syntax: 
	DELIMITER //   --> Changes the default delimiter to //
	CREATE PROCEDURE procedure_name(parameter_list)  -> Creates a procedure
	BEGIN
		statements;
		.
		.
		.
	END //
	DELIMITER ;  --> Changes to default delimiter
```	

**To execute these statements**
	1. Launch MySQL workbench
	2. Create a SQL tab for executing queries
	3. Enter the statements
	4. Execute the statements
	5.Check the stored procedure by opening the stored Procedure node
	
Executing a stored procedure
	```CALL stored_procedure_name(argument_list);```
			
1. MySQL DROP PROCEDURE statement
```		
Syntax: DROP PROCEDURE [IF EXISTS] stored_procedure_name;
	- deletes a stored procedure
```		
2. MySQL Stored Procedure Variables
	
	a. Declaring variables
	```
		Syntax: DECLARE variable_name datatype(size) [DEFAULT default_value];
		Eg: 1. DECLARE totalScale DEC(10,2) DEFAULT 0.0;
		    2. DECLARE x,y INT DEFAULT 0;
	```	
	b. Assigning variables
	```
		Syntax: SET variable_name = value;
		Eg: 1. DECLARE total INT DEFAULT 0;
		       SET total = 10;
	  
		    2. DECLARE productCount INT DEFAULT 0;
		       SELECT COUNT(*)
                   INTO productCount
		       FROM products;
				   
		Eg: Declare and use a variable in a stored procedure
			DELIMITER $$
			CREATE PROCEDURE GetTotalOrder()
			BEGIN
				DECLARE totalOrder INT DEFAULT 0;
					SELECT COUNT(*)
					INTO totalOrder
					FROM orders;
					SELECT totalOrder;
			END $$
			DELIMITER ;
			CALL GetTotalOrder()
				
			Output: totalOrder
				       326
	```		
3. MySQL Stored Procedure Parameters
A parameter in a stored procedure has one of three modes:
	1. IN parameters
		- When you define an IN parameter in a stored procedure, the calling program has to pass an argument to the stored procedure
		- IN parameter is protected
		- If we change the value of IN parameter inside the stored procedure, its original value is unchanged after the stored procedure ends.
		- The stored procedure only works on the copy of the IN parameter.
			
	2. OUT parameters
		- value of an OUT parameter can be changed inside the stored procedure and its new value is passed back to the calling program
		- stored procedure cannot access the initial value of the OUT parameter when it starts
			
	3. INOUT parameters
		- Combination of IN and OUT parameters.
		- Calling program may pass the argument and the stored procedure can modify the INOUT parameter, and pass the new value back to the calling program.
	
	```
	Syntax: [IN | OUT | INOUT] parameter_name datatype[(length)]
	Eg:
	1. DELIMITER //
		CREATE PROCEDURE GetOfficeByCountry(
			IN countryName VARCHAR(255)
			)
			BEGIN
				SELECT *
				FROM offices
				WHERE country = countryName;
				END//
	   DELIMITER ;
	   CALL GetOfficeByCountry('France')
	
	2. DELIMITER $$
		CREATE PROCEDURE GetOrderCountByStatus(
			IN orderStatus VARCHAR(25),
			OUT total INT
			)
			BEGIN
				SELECT COUNT(orderNumber)
				INTO total
				FROM orders
				WHERE status = orderStatus;
			END$$
	   DELIMITER ;
	   CALL GetOrderCountByStatus('Shipped',@total);
	   SELECT @total; // total: the OUT parameter that stores the number of orders in a specific status
				
	3. DELIMITER $$
		CREATE PROCEDURE SetCounter(
			INOUT counter INT,
			IN inc INT
			)
			BEGIN
				SET counter = counter+inc;
			END$$
			DELIMITER ;
				
			SET @counter = 1;
			CALL SetCounter(@counter,1); //2
			CALL SetCounter(@counter,1); //3
			CALL SetCounter(@counter,5); //8
			SELECT @counter; //8
	```			
4. Listing Stored Procedures
	```	
	Syntax: SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition]
	```	
	
5. MySQL IF Statement
```	
1. IF-THEN
Syntax: 
	IF condition THEN
	   statements;
	END IF;
	Eg:
	    DELIMITER $$
	    CREATE PROCEDURE GetCustomerLevel(
			IN pCustomerNumber INT,
			OUT pCustomerLevel VARCHAR(20)
			)
			BEGIN
				DECLARE credit DECIMAL(10,2) DEFAULT 0;
				SELECT creditLimit
				INTO credit
				FROM customers
				WHERE customerNumber = pCustomerNumber;
					
				IF credit > 50000 THEN
					SET pCustomerLevel = 'PLATINUM';
				END IF;
			END$$		
		DELIMITER ;
		
2. IF-THEN-ELSE
	Syntax:
		IF condition THEN
			statements;
		ELSE
			else-statements;
		END IF;
			
		Eg:
		DELIMITER $$
			CREATE PROCEDURE GetCustomerLevel(
				IN pCustomerNumber INT,
				OUT pCustomerLevel VARCHAR(20)
			)
			BEGIN
				DECLARE credit DECIMAL(10,2) DEFAULT 0;
					
				SELECT creditLimit
				INTO credit
				FROM customers
				WHERE customerNumber = pCustomerNumber;
					
				IF credit > 50000 THEN
					SET pCustomerLevel = 'PLATINUM';
				ELSE
					SET pCustomerLevel = 'NOT PLATINUM';
				END IF;
			END$$
		DELIMITER ;
	
3. IF-THEN-ELSEIF-ELSE 
	Syntax:
		IF condition THEN
			statements;
		ELSEIF elseif-condition THEN
			elseif-statements;
		...
		ELSE
			else-statements;
		END IF;
			
	Eg:
		DELIMITER $$
		CREATE PROCEDURE GetCustomerLevel(
			IN pCustomerNumber INT,
			OUT pCustomerLevel VARCHAR(20)
			)
		BEGIN
			DECLARE credit DECIMAL(10,2) DEFAULT 0;
			SELECT creditLimit
			INTO credit
			FROM customers
			WHERE customerNumber = pCustomerNumber;
					
			IF credit > 50000 THEN
				SET pCustomerLevel = 'PLATINUM';
			ELSEIF credit <= 50000 AND credit > 10000 THEN
				SET pCustomerLevel = 'GOLD';
			ELSE
				SET pCustomerLevel = 'SILVER';
			END IF;
		END$$
		DELIMITER ;
		CALL GetCustomerLevel(447, @level); 
		SELECT @level; //GOLD
				
4. MySQL CASE Statement
	Syntax:
		CASE case_value
			WHEN when_value1 THEN statements
			WHEN when_value2 THEN statements
			...
			[ELSE else-statements]
		END CASE;
					
The simple CASE statement tests for equality ( =), you cannot use it to test equality with NULL; because NULL = NULL returns FALSE

Eg:
	DELIMITER $$
		CREATE PROCEDURE GetCustomerShipping(
			IN pCustomerNumber INT,
			OUT pShipping VARCHAR(50)
			)
		BEGIN
			DECLARE customerCountry VARCHAR(100);
			SELECT
				country
			INTO customerCountry FROM
				customers
			WHERE
				customerNumber = pCustomerNumber;
				CASE customerCountry
					WHEN 'USA' THEN
						SET pShipping = '2-day Shipping';
					WHEN 'Cannada' THEN
						SET pShipping = '3-day Shipping';
					ELSE
						SET pShipping = '5-day Shipping';
				END CASE;
		END$$
	DELIMITER ;
	CALL GetCustomerShipping(112,@shipping);
	SELECT @shipping; //2-day Shipping
```

6. MySQL LOOPs
- Loop is terminated when  condition is satisfied by using the LEAVE statement
```
	Syntax: 
		1. [begin_label:] LOOP
			statement_list
		   END LOOP [end_label]
		2.  [label]: LOOP
			...
			-- terminate the loop
				IF condition THEN
					LEAVE [label];
				END IF;
				...
			END LOOP;
			
	Eg:
		DROP PROCEDURE LoopDemo;
				
		DELIMITER $$
			CREATE PROCEDURE LoopDemo()
			BEGIN
				DECLARE x INT;
				DECLARE str varchar(255);
				SET x = 1;
				SET str = '';
				loop_lable: LOOP
					IF x > 10 THEN
						LEAVE loop_label;
					END IF;
						
					SET x = x+1;
					IF (x mod 2) THEN
						ITERATE loop_label;
					ELSE
						SET str = CONCAT(str,x,',');
					END IF;
				END LOOP;
				SELECT str;
			END$$
		DELIMITER ;
		CALL LoopDemo();
				
1. MySQL WHILE Loop
	Syntax:
		[begin_label:] WHILE search_condition DO
			statement_list
		END WHILE [end_label]
	Eg:
		DELIMITER $$
			CREATE PROCEDURE InsertCalendar(dt DATE)
				BEGIN
					INSERT INTO calendars(
						fulldate,
						day,
						month,
						quarter,
						year
					)
					VALUES(
						dt, 
						EXTRACT(DAY FROM dt),
						EXTRACT(MONTH FROM dt),
						EXTRACT(QUARTER FROM dt),
						EXTRACT(YEAR FROM dt)
					);
				END$$
		DELIMITER ;
				
		DELIMITER $$
			CREATE PROCEDURE LoadCalendars(
				startDate DATE,
				day INT
				)
				BEGIN
					DECLARE counter INT DEFAULT 1;
					DECLARE dt DATE DEFAULT startDate;
					
					WHILE counter<= day DO
						CALL InsertCalendar(dt);
						SET counter = counter+1;
						SET dt = DATE_ADD(dt,INTERVAL 1 day);
					END WHILE;
				END$$
		DELIMITER ;
		CALL LoadCalendars('2019-01-01',31);
		
2.  MySQL REPEAT LOOP
	REPEAT
		SET result = CONCAT(result,counter,',');
		SET counter = counter + 1;
		UNTIL counter >= 10
	END REPEAT;
```
	
7. MySQL Cursor
	To handle a result set inside a stored procedure, you use a cursor.
	A cursor allows you to iterate a set of rows returned by a query and process each row individually.
	Cursor is
		- Read-only: can't update data in the underlying table through the cursor
		- Non-scrollable: Only fetch rows in the order determined by the SELECT statement
	Two types of cursors
		1. Asensitive cursor: points to the actual data
		2. Insensitive cursor: Uses a temporary copy of data.
	```
	1. Declaring a cursor
		Syntax: DECLARE cursor_name CURSOR FOR SELECT_statement;
			NOTE: Cursor declaration must be after any variable declaration. If you declare a cursor before the variable declaration, it will throw error.
			Cursor must always associate with a SELECT statement
		
		2. Open the cursor
			Syntax: OPEN cursor_name;
			- Initializes the result set for the cursor
			- must call OPEN statement before fetching rows from the result set.
			
		3. Retrieve the next row
			Syntax: FETCH cursor_name INTO variables list;
			- Retrieve the next row pointed by the cursor and move the cursor to the next row 
		
		4. close cursor
			Syntax: CLOSE cursor_name;
	```		

How MySQL cursor works?

	1. DECLARE
	2. OPEN
	3. FETCH
	4. IF not EMPTY
		Go back to step 3
	   ELSE 
		CLOSE
```
	Eg:
		DELIMITER $$
			CREATE PROCEDURE createEmailList(
				INOUT emailList varchar(4000)
			)
			BEGIN
				DECLARE finished INTEGER DEFAULT 0;
				DECLARE emailAddress varchar(100) DEFAULT "";
				DECLARE curEmail
					CURSOR FOR 
							SELECT email FROM employees;
				DECLARE CONTINUE HANDLER
				FOR NOT FOUND SET finished = 1;
				OPEN curEmail;
				getEmail: LOOP
						FETCH curEmail INTO emailAddress;
						IF finished = 1 THEN
							LEAVE getEmail;
						END IF;
						SET emailList = CONCAT(emailAddress,";",emailList);
				END LOOP getEmail;
				CLOSE curEmail;
			END$$
		DELIMITER ;
		SET @emailList = "";
		CALL createEmailList(@emailList);
		SELECT @emailList;
```
## 8. MySQL Triggers

![MySQL Triggers](https://www.mysqltutorial.org/wp-content/uploads/2019/09/MySQL-Triggers.png)

- Stored program invoked automatically in response to an event such as insert, update or delete occurring on table.
Eg: Trigger that is invoked automatically when a row is inserted.
Types of triggers
	1. Row-level triggers: Activated for each row that is inserted, updated or deleted.
	2. Statement-level trigger: Executed once for each transaction regardless of how many rows are inserted, updated or deleted.
- MySQL supports row-level triggers and not statement-level triggers.
  
### Advantages
1. Provide another way to check the integrity of data.
2. Handle errors from the database layer.
3. Triggers give an alternative way to run scheduled tasks. 
4. Don’t have to wait for the scheduled events to run because the triggers are invoked automatically before or after a change is made to the data in a table.
5. Triggers can be useful for auditing the data changes in tables.

### Disadvantages
1. Triggers can only provide extended validations, not all validations. For simple validations, you can use the NOT NULL, UNIQUE, CHECK and FOREIGN KEY constraints.
2. Triggers can be difficult to troubleshoot because they execute automatically in the database, which may not be visible to the client applications.
3. Triggers may increase the overhead of the MySQL server.

### 1. Create Triggers
Syntax
```
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;
```

- To distinguish between the value of the columns BEFORE and AFTER the DML has fired, you use the NEW and OLD modifiers.
Eg:  If you update the column description, in the trigger body, you can access the value of the description before the update *OLD.description* and the new value *NEW.description*

| Trigger Event | OLD | NEW |
| ----------- | -----|------ |
| INSERT | NO | YES |
| UPDATE | YES | YES |
| DELETE | YES | NO  |

MySQL Trigger Example
1. Create Employee Table
![Employee Table](https://www.mysqltutorial.org/wp-content/uploads/2019/08/employees.png)

2. Create table employees_audit
```
CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);
```

3. Create a BEFORE UPDATE trigger(Invoked before a change is made)
```
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
 INSERT INTO employees_audit
 SET action = 'update',
     employeeNumber = OLD.employeeNumber,
     lastname = OLD.lastname,
     changedat = NOW();
```
	- OLD keyword is used to access the value of columns employeeNumber and lastname of the row affected by the trigger.

4. Show triggers in database
```
SHOW TRIGGERS;
```

5. Update a row in employees table
```
UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
```

6. Query the employees_audit table to check if the trigger was fired by the UPDATE statement
```
SELECT * FROM employees_audit;
```

### 2. MySQL DROP Trigger
Syntax
```
DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name;
```
NOTE: If you drop a table, MySQL will automatically drop all triggers associated with the table

### 3. MySQL BEFORE INSERT Trigger
- Automatically fired before an insert event occurs on the table.
Syntax
```
CREATE TRIGGER trigger_name
    BEFORE INSERT
    ON table_name FOR EACH ROW
trigger_body;
```
- If you have multiple statements in the trigger_body, you have to use the BEGIN END block and change the default delimiter
```
DELIMITER $$
CREATE TRIGGER trigger_name
    BEFORE INSERT
    ON table_name FOR EACH ROW
BEGIN
    -- statements
END$$    
DELIMITER ;
```
NOTE: In a BEFORE INSERT trigger, you can access and change the NEW values. However, you cannot access the OLD values because OLD values obviously do not exist.
![BEFORE TRIGGER](https://www.mysqltutorial.org/wp-content/uploads/2019/09/MySQL-BEFORE-INSERT-Trigger.png)

Example

1. Create table WorkCenters
```
DROP TABLE IF EXISTS WorkCenters;

CREATE TABLE WorkCenters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);
```

2. Create Table WorkCenterStats
```
DROP TABLE IF EXISTS WorkCenterStats;
CREATE TABLE WorkCenterStats(
    totalCapacity INT NOT NULL
);
```

3. Creating BEFORE INSERT Trigger 
```
DELIMITER $$
CREATE TRIGGER before_workcenters_insert
BEFORE INSERT
ON WorkCenters FOR EACH ROW
BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 
END $$
DELIMITER ;
```

4. Test Trigger
```
INSERT INTO WorkCenters(name, capacity)
VALUES('Mold Machine',100);
```

### 4. MySQL AFTER INSERT Trigger



