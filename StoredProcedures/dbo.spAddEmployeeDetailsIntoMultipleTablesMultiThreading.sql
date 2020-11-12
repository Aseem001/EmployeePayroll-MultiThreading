create procedure dbo.spAddEmployeeDetailsIntoMultipleTablesMultiThreading
(
@EmpName varchar(150),
@start_date datetime,
@PhoneNumber bigint,
@address varchar(500),
@department varchar(100),
@gender char(1),
@basic_pay float,
@deductions float,
@taxable_pay float,
@tax float,
@net_pay float
)
as
Begin
     --set nocount on added to prevent extra result sets from
	 --interfering with select statements
Set nocount on;
begin try
Begin transaction
insert into employee_payroll(empname,startdate,gender,phoneno,address,department,basicpay,deductions,taxablepay,tax,netpay) 
values(@EmpName,@start_date,@gender,@PhoneNumber,@address,@department,@basic_pay,@deductions,@taxable_pay,@tax,@net_pay);
DECLARE @lastEmpId AS int;
	SET @lastEmpId = @@IDENTITY;
insert into payroll_details(Empid,basicpay,deductions,taxablepay,tax,netpay) 
values(@lastEmpId,@basic_pay,@deductions,@taxable_pay,@tax,@net_pay);
commit transaction;
return -1;
end try
begin catch
rollback transaction;
end catch
end