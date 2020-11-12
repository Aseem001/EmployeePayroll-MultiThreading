CREATE PROCEDURE dbo.spUpdateSalary
(	
@EmpName varchar(150),
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
Update A set 
A.BasicPay = @basic_pay,A.Deductions=@deductions,A.TaxablePay=@taxable_pay,A.Tax=@tax,A.NetPay=@net_pay
from employee_payroll A inner join payroll_details B on A.EmpID=B.EmpID
where A.EmpName=@EmpName;
Update B set 
B.BasicPay = @basic_pay,B.Deductions=@deductions,B.TaxablePay=@taxable_pay,B.Tax=@tax,B.NetPay=@net_pay
from payroll_details B inner join employee_payroll A on B.EmpID=A.EmpID
where A.EmpName=@EmpName;
commit transaction;
return -1;
end try
begin catch
rollback transaction;
end catch
end