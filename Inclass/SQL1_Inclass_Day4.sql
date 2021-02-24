# Pre-Requsites
# Assuming Candidates are familiar with “Group by” and “Grouping functions” because these are used along with JOINS in the questionnaire. 

# Create below DB objects 
use Inclass;
CREATE TABLE BANK_CUSTOMER ( customer_id INT ,
             	customer_name VARCHAR(20),
             	Address 	VARCHAR(20),
             	state_code  VARCHAR(3) ,    	 
             	Telephone   VARCHAR(10)	);
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",  	"CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow", 	"NY" , "1897614000");

CREATE TABLE BANK_CUSTOMER_EXPORT ( customer_id CHAR(10),
customer_name CHAR(20),
Address CHAR(20),
state_code  CHAR(3) ,    	 
Telephone  CHAR(10));
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123001 ","Oliver", "225-5, Emeryville", "CA" , "1897614500") ;
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123002 ","George", "194-6,New brighton","MN" , "189761700");

CREATE TABLE Bank_Account_Details(Customer_id INT,           	 
                             	Account_Number VARCHAR(19),
                              	Account_type VARCHAR(25),
                           	    Balance_amount INT,
                               	Account_status VARCHAR(10),             	 
                               	Relationship_type varchar(1) ) ;
INSERT INTO Bank_Account_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , 200000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123001, "5000-1700-3456", "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO Bank_Account_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS", 400000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" ,750000,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123004, "5000-1700-6091", "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123004, "4000-1956-3401",  "SAVINGS" , 655000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123005, "4000-1956-5102",  "SAVINGS" , 300000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, "4000-1956-5698",  "SAVINGS" , 455000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , 355000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S");
INSERT INTO Bank_Account_Details  VALUES (123007, "9000-1700-7777-4321",  "Credit Card"	,0  ,"INACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123007, '5900-1900-9877-5543', "Add-on Credit Card" ,   0   ,"ACTIVE", "S");
INSERT INTO Bank_Account_Details  VALUES (123008, "5000-1700-7755",  "SAVINGS"   	,0   	,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5800-1700-9800-7755', "Credit Card"   ,0   	,"ACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5890-1970-7706-8912', "Add-on Credit Card"   ,0   	,"ACTIVE", "S");

# CREATE Bank_Account Table:
# Create Table
CREATE TABLE BANK_ACCOUNT ( Customer_id INT, 		   			  
	                Account_Number VARCHAR(19),
		     Account_type VARCHAR(25),
		     Balance_amount INT ,
			Account_status VARCHAR(10), Relation_ship varchar(1) ) ;
# Insert records:
INSERT INTO BANK_ACCOUNT  VALUES (123001, "4000-1956-3456",  "SAVINGS"            , 200000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO BANK_ACCOUNT  VALUES (123002, "4000-1956-2001",  "SAVINGS"            , 400000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123003, "4000-1956-2900",  "SAVINGS"            ,750000,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "4000-1956-3401",  "SAVINGS"            , 655000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123005, "4000-1956-5102",  "SAVINGS"            , 300000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123006, "4000-1956-5698",  "SAVINGS"            , 455000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "5000-1700-9800",  "SAVINGS"            , 355000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "9000-1700-7777-4321",  "CREDITCARD"    ,0      ,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123008, "5000-1700-7755",  "SAVINGS"            ,NULL   ,"INACTIVE","P"); 




# CREATE TABLE Bank_Account_Relationship_Details

CREATE TABLE Bank_Account_Relationship_Details
                             	( Customer_id INT,
								Account_Number VARCHAR(19),
                            	Account_type VARCHAR(25),
                             	Linking_Account_Number VARCHAR(19));
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , "");
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" , "4000-1956-3456");  
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" , "4000-1956-2001" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-7791",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, "9000-1700-7777-4321",  "Credit Card" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5900-1900-9877-5543', 'Add-on Credit Card', '9000-1700-7777-4321' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5800-1700-9800-7755', 'Credit Card', '4000-1956-5698' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5890-1970-7706-8912', 'Add-on Credit Card', '5800-1700-9800-7755' );



# CREATE TABLE BANK_ACCOUNT_TRANSACTION

CREATE TABLE BANK_ACCOUNT_TRANSACTION (  
              	Account_Number VARCHAR(19),
              	Transaction_amount Decimal(18,2) ,
              	Transcation_channel VARCHAR(18) ,
             	Province varchar(3) ,
             	Transaction_Date Date) ;


INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3456",  -2000, "ATM withdrawl" , "CA", "2020-01-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -4000, "POS-Walmart"   , "MN", "2020-02-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -1600, "UPI transfer"  , "MN", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -6000, "Bankers cheque", "CA", "2020-03-23");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -3000, "Net banking"   , "CA", "2020-04-24");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  23000, "cheque deposit", "MN", "2020-03-15");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-6091",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-7791",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3401",   8000, "Cash Deposit"  , "NY", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5102",  -6500, "ATM withdrawal" , "NY", "2020-03-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5698",  -9000, "Cash Deposit"  , "NY", "2020-03-27");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-9977",  50000, "ECS transfer"  , "NY", "2020-01-16");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -5000, "POS-Walmart", "NY", "2020-02-17");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -8000, "Shopping Cart", "MN", "2020-03-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -2500, "Shopping Cart", "MN", "2020-04-21");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5800-1700-9800-7755", -9000, "POS-Walmart","MN", "2020-04-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( '5890-1970-7706-8912', -11000, "Shopping Cart" , "NY" , "2020-03-12") ;



# CREATE TABLE BANK_CUSTOMER_MESSAGES

CREATE TABLE BANK_CUSTOMER_MESSAGES (  
              	Event VARCHAR(24),
              	Customer_message VARCHAR(75),
              	Notice_delivery_mode VARCHAR(15)) ;


INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Adhoc", "All Banks are closed due to announcement of National strike", "mobile" ) ;
INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Transaction Limit", "Only limited withdrawals per card are allowed from ATM machines", "mobile" );

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    10000.00     ,'ECS transfer',     'MN' ,    '2020-02-16' ) ;

-- inserted for queries after 17th  
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    40000.00     ,'ECS transfer',     'MN' ,    '2020-03-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    60000.00     ,'ECS transfer',     'MN' ,    '2020-04-18' ) ;

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    20000.00     ,'ECS transfer',     'MN' ,    '2020-03-20' ) ;

-- inserted for queries after 24th 

INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    49000.00     ,'ECS transfer',     'MN' ,    '2020-06-18' ) ;




# CREATE TABLE BANK_INTEREST_RATE

CREATE TABLE BANK_INTEREST_RATE(  
            	account_type varchar(24),
              	interest_rate decimal(4,2),
            	month varchar(2),
            	year  varchar(4)
             	);

INSERT  INTO BANK_INTEREST_RATE VALUES ( "SAVINGS" , 0.04 , '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES ( "RECURRING DEPOSITS" , 0.07, '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES   ( "PRIVILEGED_INTEREST_RATE" , 0.08 , '02' , '2020' );


# Bank_holidays:

Insert into bank_holidays values( '2020-05-20', now(), now() ) ;

Insert into bank_holidays values( '2020-03-13' , now(), now() ) ;


############################################ Questions ############################################
# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all 
# of his/her accounts in the bank.

select bc.customer_id,bc.customer_name,avg(bcd.Balance_amount) All_acc_total_balance from bank_customer bc 
join bank_account_details bcd 
on bc.customer_id=bcd.customer_id 
group by bc.customer_id,bc.customer_name;


# Question 2:
# 2) Print customer_id , account_number and balance_amount , 
# condition that if balance_amount is nil then assign transaction_amount  for account_type = "Credit Card"

select Customer_id,bcd.Account_Number,
if(ifnull(balance_amount,0)=0,Transaction_amount,balance_amount) as balance_amount 
from bank_account_details bcd 
join bank_account_transaction bct
on bcd.Account_Number=bct.Account_Number 
and account_type='Credit Card';


# Question 3:
# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from Bank_Account_Details and 
# bank_account_transaction for all the transactions occurred during march,2020 and april, 2020.

select bct.account_number,balance_amount,transaction_amount,transaction_date 
from bank_account_details bcd 
join bank_account_transaction bct 
on bcd.account_number=bct.account_number 
and year(transaction_date)=2020
and month(transaction_date) in (3,4);


# Question 4:
# 4) Print all of the customer id, account number,  balance_amount, transaction_amount , Transaction_Date 
# from bank_customer, Bank_Account_Details and bank_account_transaction tables where excluding 
# all of their transactions in march, 2020  month

select bad.customer_id,bad.account_number,balance_amount,transaction_amount,transaction_date 
from bank_account_details bad
left join bank_account_transaction bat
on bad.account_number=bat.account_number
and date_format(bat.transaction_date,'%Y-%m')<>'2020-03';


# Question 5:
# 5) Print only the customer id, account_number, balance_amount,transaction_amount ,transaction_date who did transactions 
# during the first quarter. Do not display the accounts if they have not done any transactions in the first quarter.

select bad.customer_id,bad.account_number,balance_amount,transaction_amount,transaction_date 
from bank_account_details bad
join bank_account_transaction bat
on bad.account_number=bat.account_number
and bat.transaction_date between '2020-01-01' and '2020-03-31';


# Question 6:
# 6) Print account_number, Event and Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to 
# display an “Adhoc" Event for all customers who have  “SAVINGS" account_type account.

select account_number,Event,Customer_message from bank_account_details bcd
cross join bank_customer_messages bcm where Event='Adhoc' and Account_type='Savings'; 


# Question 7:
# 7) Print all Customer_id, Account_Number, Account_type, and display deducted balance_amount by  
# subtracting only negative transaction_amounts for Relationship_type =
#  "P" ( P - means  Primary , S - means Secondary ) .

select customer_id,bcd.Account_number,Account_type,(balance_amount+Transaction_amount) as deducted_balance_amount
from bank_account_details bcd 
left join bank_account_transaction bct
on bcd.Account_number=bct.Account_number 
and Relationship_type='P' 
and Transaction_amount<0;


# Question 8:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types.

select b1.account_number as primary_account,b1.account_type as primary_account_type,
b2.account_number as seconday_account,b2.account_type as seconday_account_type
from bank_account_relationship_details b1  
left join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number;


# Question 9:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  
# transaction amount of accounts appeared  in another column.

select b1.account_number as primary_account,b1.account_type as primary_account_type,
b2.account_number as seconday_account,b2.account_type as seconday_account_type,transaction_amount as prim_acc_tran_amount
from bank_account_relationship_details b1  
left join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
left join bank_account_transaction bat
on bat.account_number=b1.account_number;


# Question 10:
# 10) Display all saving account holders have “Add-on Credit Cards" and “Credit cards"

select b1.account_number as primary_account,b1.account_type as primary_account_type,
b2.account_number as seconday_account,b2.account_type as seconday_account_type
from bank_account_relationship_details b1
left join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
and b2.account_type like '%credit card%';


# Question 11:
# 11)  Display  records of “SAVINGS” account linked with “Credit cards" account_type and its credit
# aggregate sum of transaction amount.

# Ref: Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 

select b1.account_number as primary_account,b1.account_type as primary_account_type,
b2.account_number as seconday_account,b2.account_type as seconday_account_type,sum(bat.transaction_amount)
from bank_account_relationship_details b1  
join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
join bank_account_transaction bat
on bat.account_number=b2.account_number
where b2.account_type ='credit card'
group by b1.account_number,b1.account_type,b2.account_number,b2.account_type;


# Question 12:
# 12) Display all type of “Credit cards”  accounts including linked “Add-on Credit Cards" 
# type accounts with their respective aggregate sum of transaction amount.

# Ref: Check linking relationship in bank_transaction_relationship_details.
        # Check transaction_amount in bank_account_transaction. 

select b1.account_number as primary_account,b1.account_type as primary_account_type,
b2.account_number as seconday_account,b2.account_type as seconday_account_type,sum(bat.transaction_amount)
from bank_account_relationship_details b1  
join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
and b1.account_type like '%credit card%'
join bank_account_transaction bat
on bat.account_number=b2.account_number
group by b1.account_number,b1.account_type,b2.account_number,b2.account_type;


# Question 13:
# 13) Display “SAVINGS” accounts and their corresponding aggregate sum of transaction amount 
# of all recurring deposits

select b1.account_number as primary_account,b1.account_type as primary_account_type,sum(bat.transaction_amount)
from bank_account_relationship_details b1  
join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
join bank_account_transaction bat
on bat.account_number=b2.account_number
and b2.account_type like '%recurring deposits%'
group by b1.account_number,b1.account_type;


# Question 14:
# 14) Display recurring deposits and their transaction amounts in  Feb 2020  along with 
# associated SAVINGS account_number , balance

select b1.account_number as primary_account,b1.account_type as primary_account_type,
sum(bat.transaction_amount),bat.transaction_date
from bank_account_relationship_details b1  
join bank_account_relationship_details b2
on b1.account_number=b2.linking_account_number
join bank_account_transaction bat
on bat.account_number=b2.account_number
and b2.account_type like '%recurring deposits%'
and date_format(bat.transaction_date,'%m-%Y')='02-2020'
group by b1.account_number,b1.account_type;


# Question 15:
# 15) Compare the aggregate sum transaction amount of current month versus aggregate transaction 
# with previous months.Display account_number, transaction_amount , 
-- sum of current month transaction amount ,
-- current month transaction date , 
-- sum of previous month transaction amount , 
-- previous month transaction date.

select bat1.account_number as primary_account_number,
date_format(bat2.transaction_date , '%Y-%m') as next_month_transac_date,
sum(bat2.transaction_amount) as current_month_tran,
date_format(bat1.transaction_date , '%Y-%m') as previous_month_transac_date,
sum(bat1.transaction_amount) as prev_month_tran
from bank_account_transaction bat1
join bank_account_transaction bat2
on bat2.account_number = bat1.account_number
and date_format(bat2.transaction_date , '%Y-%m') > date_format(bat1.transaction_date , '%Y-%m')
group by bat2.account_number,date_format(bat2.transaction_date , '%Y-%m'),date_format(bat1.transaction_date , '%Y-%m');


# Question 16:
# 16) Display individual accounts absolute transaction of every next month is greater than the previous months .

select bat2.account_number as primary_account_number,
bat2.transaction_date as current_tran_date,sum(bat2.transaction_amount) as current_month_tran,
bat1.transaction_date as prev_tran_date,sum(bat1.transaction_amount) as prev_month_tran 
from bank_account_transaction bat1
join bank_account_transaction bat2
on bat1.account_number = bat2.account_number and bat2.transaction_date > bat1.transaction_date
group by bat2.account_number,bat2.transaction_date,bat1.transaction_date
having abs(sum(bat2.transaction_amount)) > abs(sum(bat1.transaction_amount));


# Question 17:
# 17) Display the customer names who have all three account types - 
# savings, recurring and credit card account holders

select customer_name,bad.account_number as savings_account_number,
bad.account_type as savings_account_type,bard1.account_number as recurring_deposit_account_number,
bard1.account_type as recurring_deposit_account_type,
bard2.account_number as credit_card_account_number,bard2.account_type as credit_card_account_type
from bank_account_details bad
join bank_customer bc
on bad.customer_id=bc.customer_id
join bank_account_relationship_details bard1
on bad.account_number=bard1.linking_account_number 
and (bard1.account_type like '%recurring deposits%')
join bank_account_relationship_details bard2
on bad.account_number = bard2.linking_account_number 
and (bard2.account_type like '%Credit%');


# Question 18:
# 18) Display savings accounts and its corresponding Recurring deposits transactions are more than 4 times.

Select bard1.Account_Number as savings_account_number,
bard1.Account_type as savings_account_type,
bard2.Account_Number as recurring_deposit_account_number,
bard2.Account_type as recurring_deposit_account_type,
count(bat.transaction_date) as transaction_date 
from bank_account_relationship_details bard1
join bank_account_relationship_details bard2
on bard1.Account_Number = bard2.Linking_Account_Number
join bank_account_transaction bat
on bard1.Account_Number = bat.Account_Number
and bard1.Account_type like '%recurring deposits%'
group by bard1.Account_Number,bard1.Account_type,bard2.Account_Number,bard2.Account_type  
having count(bat.transaction_date)>4;


# Question 19:
# 19) Display savings accounts and its recurring deposits account with their aggregate 
# transactions per month occurs in 3 different months.

select ba.Account_Number savings_account_number,
ba.Account_type   savings_account_type,
br.Account_Number recurring_deposit_account_number,
br.Account_type   recurring_deposit_account_type,
sum(bat.transaction_amount) Transaction_amount,
count(distinct date_format(bat.Transaction_Date, '%Y-%m')) as different_transaction_months
from bank_account ba
join bank_account_relationship_details br
on ba.Account_Number = br.Linking_Account_Number
join bank_account_transaction bat
on br.Account_Number = bat.Account_Number
and br.Account_type   = 'RECURRING DEPOSITS'
group by ba.Account_Number,ba.Account_type ,br.Account_Number,br.Account_type  
having count(distinct date_format(bat.Transaction_Date,'%Y-%m'))>=3;


# Question 20:
# 20) Find the no. of transactions of credit cards including add-on Credit Cards

select bard1.account_number as credit_card_account_number,bard1.Account_type as credit_card_account_type,
count(bat.transaction_amount) count_of_transaction_amount from bank_account_relationship_details bard1
left join bank_account_relationship_details bard2
on bard1.account_number=bard2.linking_account_number
join bank_account_transaction bat
on bard1.account_number=bat.account_number
and bard1.account_type like '%credit card%'
group by bard1.account_number,bard1.account_type;
