CREATE TABLE [Customerdetail] (
  [CustomerdetID] int identity(200,2),
  [CustomerFname] varchar(30),
  [CustomerLname] varchar(50),
  [City] varchar(30),
  [Address] varchar(250),
  [Email] varchar(50),
  [PhoneNo] varchar(15),
  PRIMARY KEY ([CustomerdetID])
);

CREATE TABLE [Customer] (
  [CustomerID] int identity(100,1),
  [CustomerdetID] int,
  [GDPR] char(1),
  [Status] varchar(8),
  PRIMARY KEY ([CustomerID]),
  CONSTRAINT [FK_Customer.CustomerdetID]
	FOREIGN KEY ([CustomerdetID])
		REFERENCES [Customerdetail]([CustomerdetID])
);

CREATE TABLE [Employee] (
  [EmployeeID] int identity(1000,5),
  [EmployeeFname] varchar(30),
  [EmployeeLname] varchar(50),
  [Email] varchar(50),
  [PhoneNo] varchar(15),
  [JobRole] varchar(50),
  [Qualification] varchar(50),
  PRIMARY KEY ([EmployeeID])
);

CREATE TABLE [Invoice] (
  [InvoiceNo] int identity(500,1),
  [CustomerID] int,
  [EmployeeId] int,
  [RegistrationNo] varchar(15),
  [SalesDate] datetime,
  [Quantity] char(4),
  [Total] float,
  PRIMARY KEY ([InvoiceNo]),
  CONSTRAINT [FK_Invoice.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([CustomerID]),
  CONSTRAINT [FK_Invoice.EmployeeId]
    FOREIGN KEY ([EmployeeId])
      REFERENCES [Employee]([EmployeeID])
);

CREATE TABLE [Car] (
  [RegistrationNo] varchar(15),
  [Make] varchar(15),
  [Model] varchar(15),
  [Year] char(4),
  [Color] varchar(15),
  PRIMARY KEY ([RegistrationNo])
);

CREATE TABLE [ServiceTicket] (
  [TicketNo] int identity(2022,2),
  [EmployeeID] int,
  [ServiceDate] datetime,
  [ServiceType] varchar(10),
  [PartsId] varchar(20),
  [PartsQty] int,
  PRIMARY KEY ([TicketNo]),
  CONSTRAINT [FK_ServiceTicket.EmployeeID]
    FOREIGN KEY ([EmployeeID])
      REFERENCES [Employee]([EmployeeID])
);

CREATE TABLE [Receipt] (
  [ReceiptNo] int identity(100,2),
  [TicketNo] int,
  [RegistrationNo] varchar(15),
  [CustomerID] int,
  [ServiceOrRepair] varchar(20),
  [PartsId] varchar(20),
  [Total cost] float,
  PRIMARY KEY ([ReceiptNo]),
  CONSTRAINT [FK_Receipt.TicketNo]
	FOREIGN KEY ([TicketNo])
		REFERENCES [ServiceTicket]([TicketNo]),
  CONSTRAINT [FK_Receipt.RegistrationNo]
	FOREIGN KEY ([RegistrationNo])
		REFERENCES [Car]([RegistrationNo]),
  CONSTRAINT [FK_Receipt.CustomerID]
	FOREIGN KEY ([CustomerID])
		REFERENCES [Customer]([CustomerID])
);

insert into Customerdetail
values ('Joe', 'Higgins', 'Dublin', '34 Arran Quay', 'joeh@mail.com', '0865461235'),
('Desmond', 'Maguire', 'Carlow', '12 Clonturk Park', 'dmag@mail.com', '0855165935'),
('Millie', 'Barrett', 'Dublin', '33 Sheriff Street', 'mibarr@mail.com', '0875164955'),
('Nadia', 'Nyland', 'Cork', '3 George Street', 'nadian@mail.com', '0859161255'),
('Marcus', 'Doherty', 'Westport', '12 Dame Avenue', 'mdoherty@mail.com', '0871111254'),
('Eric', 'Byrne', 'Dublin', '2 Parliament street', 'ericb@mail.com', '0859815554')

select * from Customerdetail

insert into Employee
values ('Patrick', 'Costello', 'pcostello@mail.com', '0854956815', 'Mechanic', 'Engineer'),
('Alice', 'Lavery', 'alavery@mail.com', '0874965811', 'Salesperson', 'Marketing'),
('Sara', 'Holian', 'sholien@mail.com', '0851122814', 'Salesperson', 'Sales'),
('Rian ', 'Horan', 'rhoran@mail.com', '0874911119', 'Mechanic', 'Engineer'),
('Scott', 'Lally', 'slally@mail.com', '0844996855', 'Mechanic', 'Engineer'),
('Dylan', 'Haugh', 'dhaugh@mail.com', '0854655851', 'Salesperson', 'Marketing')

select * from Employee

insert into Customer
values ('200', 'y', 'Active'),
('202', 'y', 'Passive'),
('204', 'n', 'Active'),
('206', 'y', 'Active'),
('208', 'y', 'Active'),
('210', 'y', 'Active')

select * from Customer

insert into Car
values ('221-D-2308', 'Volkswagen', 'Golf', '2022', 'Ferrari Red'),
('202-TS-1459', 'BMW', '5 Series', '2020', 'Metallic Gray'),
('141-C-34567', 'Audi', 'A6', '2014', 'Smurf Blue'),
('98-D-12365', 'Ford', 'Focus', '1998', 'Vantablack'),
('98-KY-667', 'Mercedes-Benz', 'E-Class', '1998', 'Sapphire Blue'),
('221-D-45687', 'Audi', 'A8', '2022', 'Dragon Burst')

select * from Car

insert into Invoice
values ('100', '1000', '221-D-2308', '06/06/2022', '1', '53850'),
('101', '1005', '202-TS-1459', '01/22/2022', '1', '48975'),
('102', '1010', '141-C-34567', '06/14/2020', '1', '14500'),
('103', '1015', '98-D-12365', '08/26/2022', '1', '1750'),
('104', '1020', '98-KY-667', '05/16/2022', '1', '2550'),
('105', '1025', '221-D-45687', '06/06/2022', '1', '87590')

select * from Invoice

insert into ServiceTicket
values ('1000', '06/06/2022', 'Service', 'Filter05, Bearing09', '5'),
('1015', '09/16/2022', 'Service', 'Clutch09', '1'),
('1020', '06/18/2020', 'Repair', 'Transmission12', '1'),
('1015', '04/21/2022', 'Service', 'Tire19', '4'),
('1020', '08/01/2022', 'Repair', 'Aircon23', '1'),
('1020', '02/28/2022', 'Repair', 'Tire05, Bearing03', '2')

select * from ServiceTicket

insert into Receipt
values ('2022', '221-D-2308', '100', 'Service', 'Filter05, Bearing09', '1380'),
('2024', '202-TS-1459', '101', 'Service', 'Clutch09', '1550'),
('2026', '141-C-34567', '102', 'Repair', 'Transmission12', '2250'),
('2028', '98-D-12365', '103', 'Service', 'Tire19', '850'),
('2030', '98-KY-667', '104', 'Repair', 'Aircon23', '995'),
('2032', '221-D-45687', '105', 'Repair', 'Tire05, Bearing03', '555')

select * from Receipt

----------Store procedures

create proc InsertCustomerdetail
@CustomerFname varchar(30),
@CustomerLname varchar(50),
@City varchar(30),
@Address varchar(250),
@Email varchar(50),
@PhoneNo varchar(15)
AS
Begin Tran

	insert into Customerdetail(CustomerFname, CustomerLname, City, Address, Email, PhoneNo)
	--values('George','Curran','Dublin','45 Cork street','gcurran@mail.com','0855556412')
	values(@CustomerFname,@CustomerLname,@City,@Address,@Email,@PhoneNo)

	select 'New primary key is:',SCOPE_IDENTITY()

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	BEGIN
		PRINT 'ERROR! No insert into CustomerdetID. Please check values.'
		Rollback Tran
		return -1
	END
print 'Committing'
Commit Tran
return 0
go
exec InsertCustomerdetail 'George','Curran','Dublin','45 Cork street','gcurran@mail.com','0855556412'

select * from Customerdetail


create proc InsertCustomer
@CustomerdetID int,
@GDPR char(1),
@Status varchar(8)
AS
Begin Tran

	insert into Customer(CustomerdetID, GDPR, Status)
	values(@CustomerdetID,@GDPR,@Status)

	select 'New primary key is:',SCOPE_IDENTITY()

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	BEGIN
		PRINT 'ERROR! No insert into Customer. Please check values.'
		Rollback Tran
		return -1
	END
print 'Committing'
Commit Tran
return 0
go
exec InsertCustomer '212','y','Active'

select * from Customer


create proc InsertCar
@RegistrationNo varchar(15),
@Make varchar(15),
@Model varchar(15),
@Year char(4),
@Color varchar(15)
AS
Begin Tran

	insert into Car(RegistrationNo, Make, Model, Year, Color)
	values(@RegistrationNo,@Make,@Model,@Year,@Color)

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	BEGIN
		PRINT 'ERROR! No insert into Customer. Please check values.'
		return -1
	END
print 'Committing'
Commit Tran
return 0
go
exec InsertCar '05-C-5956','Suzuki','Swift','2005','Emerald Green'

select * from Car


create proc InsertEmployee
@EmployeeFname varchar(30),
@EmployeeLname varchar(50),
@Email varchar(50),
@PhoneNo varchar(15),
@JobRole varchar(50),
@Qualification varchar(50)
AS
Begin Tran

	insert into Employee(EmployeeFname, EmployeeLname, Email, PhoneNo, JobRole, Qualification)
	values(@EmployeeFname,@EmployeeLname,@Email,@PhoneNo,@JobRole,@Qualification)

	select 'New primary key is:',SCOPE_IDENTITY()

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	BEGIN
		PRINT 'ERROR! No insert into Customer. Please check values.'
		return -1
	END
print 'Committing'
Commit Tran
return 0
go
exec InsertEmployee 'Mark','Ryan','mryan@mail.com','0866544561','Mechanic','Engineer'

select * from Employee


create proc InsertServiceTicket
@EmployeeID int,
@ServiceDate datetime,
@ServiceType varchar(10),
@PartsId varchar(20),
@PartsQty varchar(20)
AS
Begin Tran

	insert into ServiceTicket(EmployeeID, ServiceDate, ServiceType, PartsId, PartsQty)
	values(@EmployeeID,@ServiceDate,@ServiceType,@PartsId,@PartsQty)

	select 'New primary key is:',SCOPE_IDENTITY()

	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1
	BEGIN
		PRINT 'ERROR! No insert into Customer. Please check values.'
		return -1
	END
print 'Committing'
Commit Tran
return 0
go
exec InsertServiceTicket'1030','11/06/2022','Service','Tire02','4'

select * from ServiceTicket


----------Customer masking

create proc CustomerMask
@CustID int
as

	if exists(select 1 from Customerdetail where CustomerdetID =@CustID)
	begin
		begin tran
		update Customerdetail
		set CustomerFname = 'GDPRed',
			CustomerLname = 'GDPRed',
			Address = 'GDPRed',
			Email = 'GDPRed',
			PhoneNo = 'GDPRed'
		where CustomerdetID =@CustID

		if @@ERROR <> 0 or @@ROWCOUNT <> 1
		begin
			print 'Problem with update, Rolling back.'
			rollback tran
			return -1
		end
		
	end
	else
	begin
		print 'Invalid customer ID supplied'
		return -1
	end
commit tran
return 0

exec CustomerMask 200

exec CustomerMask 204

exec CustomerMask 210

exec CustomerMask 212

select * from Customerdetail


----------Views

create view mechview
as
select top 100 e.EmployeeID, e.EmployeeFname + ' ' + e.EmployeeLname as FullName, st.TicketNo, st.ServiceDate, c.RegistrationNo, c.Make, c.Model
from Employee e
inner join ServiceTicket st
on e.EmployeeID = st.EmployeeID
inner join Receipt r
on st.TicketNo = r.TicketNo
inner join Car c
on r.RegistrationNo = c.RegistrationNo
go
select * from mechview
go

create view activeview
as
select top 100 c.CustomerID, c.GDPR, c.Status, cd.CustomerFname, cd.CustomerLname, cd.City, cd.Address, ca.RegistrationNo, st.ServiceDate
from Customerdetail cd
inner join Customer c
on cd.CustomerdetID = c.CustomerdetID
inner join Receipt r
on r.CustomerID = c.CustomerID
inner join Car ca
on r.RegistrationNo = ca.RegistrationNo
inner join ServiceTicket st
on st.TicketNo = r.TicketNo
go
select * from activeview
go