create procedure dbo.SpAddEmployeeDetails
(	
	@name	varchar(150),
	@start	date,					
	@gender	char(1),	
	@phone_number	int,		
	@address	varchar(150),
	@department	varchar(150),
	@Basic_Pay float,		
	@Deductions	float,	
	@Taxable_pay float,	
	@Income_tax	float,				
	@Net_pay	float		
	)
	as begin
	Insert into employee_payroll values(@name,@start,@gender,@phone_number,@address,@department,@Basic_Pay,@Deductions,@Taxable_pay,@Income_tax,@Net_pay)
	End