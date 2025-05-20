--DM Assignment
create database DM_Assignment

use DM_Assignment

--Creating Tables
create table Food
(FoodID nvarchar(50) primary key not null,
FoodName nvarchar(50),
Price_RM decimal(10,2),
Quantity_Sold int)

create table Manager
(ManagerName nvarchar(50) primary key not null,
ManagerGender nvarchar(50),
ManagerContactNum int)

create table [Member]
(MemberID nvarchar(50) primary key not null,
MemberName nvarchar(50),
Gender nvarchar(50),
[Role] nvarchar(50))

create table Chef
(ChefID nvarchar(50) primary key not null,
ChefName nvarchar(50))

create table ShoppingCart
(CartID nvarchar(50) primary key not null,
MemberID nvarchar(50) foreign key references [Member](MemberID),
FoodID nvarchar(50) foreign key references Food(FoodID))

create table [Order]
(OrderID nvarchar(50) primary key not null,
MemberID nvarchar(50) foreign key references [Member](MemberID),
CartID nvarchar(50) foreign key references ShoppingCart(CartID),
ManagerName nvarchar(50) foreign key references Manager(ManagerName),
FoodID nvarchar(50) foreign key references Food(FoodID),
Quantity int)

create table Delivery
(DeliveryID nvarchar(50) primary key not null,
DeliveryStatus nvarchar(50),
OrderID nvarchar(50) foreign key references [Order](OrderID),
[Date] date)

create table Cook
(CookID nvarchar(50) primary key not null,
ChefID nvarchar(50) foreign key references Chef(ChefID),
ManagerName nvarchar(50) foreign key references Manager(ManagerName),
OrderID nvarchar(50) foreign key references [Order](OrderID))

create table Worker
(WorkerID nvarchar(50) primary key not null,
WorkerName nvarchar(50),
DeliveryID nvarchar(50) foreign key references Delivery(DeliveryID))

create table Contact
(ContactNum int primary key not null,
MemberID nvarchar(50) foreign key references [Member](MemberID))

create table Payment
(PaymentID nvarchar(50) primary key not null,
OrderID nvarchar(50) foreign key references [Order](OrderID),
MemberID nvarchar(50) foreign key references [Member](MemberID),
Subtotal decimal(10,2))

create table Feedback
(FeedbackID nvarchar(50) primary key not null,
MemberID nvarchar(50) foreign key references [Member](MemberID),
Feedback_Scale int,
Comment nvarchar(50),
FoodID nvarchar(50) foreign key references Food(FoodID))

--Alter table to add columns
alter table [Member]
add ContactNum int

alter table [Order]
add DeliveryID nvarchar(50) foreign key references Delivery(DeliveryID)

alter table Delivery
add WorkerID nvarchar(50) foreign key references Worker(WorkerID)

--Insert values
insert into Chef 
values ('chef1','Gordan'),
('chef2','Jim'),
('chef3','Toh')

insert into Contact (ContactNum)
values ('0122309871'),
('0178923341'),
('0198156284'),
('0137489917'),
('0192213710');

insert into Cook (CookID)
values ('cook1'),
('cook2'),
('cook3'),
('cook4'),
('cook5');

insert into Delivery (DeliveryID)
values ('deli1'),
('deli2'),
('deli3'),
('deli4'),
('deli5');

insert into Feedback (FeedbackID)
values ('feedback1'), 
('feedback2'), 
('feedback3'), 
('feedback4'),
('feedback5');

insert into Food
values ('food1', 'curry chicken rice', '8.90', '0'),
('food2', 'salmon rice bowl', '12.50', '4'),
('food3', 'chicken rice', '8.00', '1'),
('food4', 'creamy mushroom rice', '8.90', '0'),
('food5', 'roti planta', '3.00', '2'),
('food6', 'soup noodle', '8.00', '1'),
('food7', 'fried rice', '7.50', '0'),
('food8', 'spaghetti', '16.00', '3');

insert into Manager
values ('John', 'male', '0124518972')

insert into [Member](MemberID) 
values ('member1'),
('member2'),
('member3'),
('member4'),
('member5')

insert into [Order] (OrderID)
values ('order1'),
('order2'),
('order3'),
('order4'),
('order5');

insert into Payment (PaymentID)
values ('payment1'),
('payment2'),
('payment3'),
('payment4'),
('payment5');

insert into ShoppingCart (CartID)
values ('cart1'),
('cart2'),
('cart3'),
('cart4'),
('cart5');

insert into Worker (WorkerID)
values ('worker1'),
('worker2'),
('worker3'),
('worker4'),
('worker5');

UPDATE Contact
SET MemberID='member1' WHERE ContactNum='0122309871';
UPDATE Contact
SET MemberID='member2' WHERE ContactNum='0178923341';
UPDATE Contact
SET MemberID='member3' WHERE ContactNum='0198156284';
UPDATE Contact
SET MemberID='member4' WHERE ContactNum='0137489917';
UPDATE Contact
SET MemberID='member5' WHERE ContactNum='0192213710';

UPDATE Cook
SET ChefID='chef1', ManagerName='John', OrderID='order1' WHERE CookID='cook1';
UPDATE Cook
SET ChefID='chef3', ManagerName='John', OrderID='order2' WHERE CookID='cook2';
UPDATE Cook
SET ChefID='chef2', ManagerName='John', OrderID='order3' WHERE CookID='cook3';
UPDATE Cook
SET ChefID='chef1', ManagerName='John', OrderID='order4' WHERE CookID='cook4';
UPDATE Cook
SET ChefID='chef3', ManagerName='John', OrderID='order5' WHERE CookID='cook5';

UPDATE Delivery
SET DeliveryStatus='completed', WorkerID='worker1', OrderID='order1',[Date]= '1 January 2024' WHERE DeliveryID='deli1';
UPDATE Delivery
SET DeliveryStatus='completed', WorkerID='worker3', OrderID='order2', [Date]= '1 January 2024' WHERE DeliveryID='deli2';
UPDATE Delivery
SET DeliveryStatus='preparing', WorkerID='worker2', OrderID='order3', [Date]= '1 January 2024' WHERE DeliveryID='deli3';
UPDATE Delivery
SET DeliveryStatus='preparing', WorkerID='worker1', OrderID='order4', [Date]= '2 January 2024' WHERE DeliveryID='deli4';
UPDATE Delivery
SET DeliveryStatus='preparing', WorkerID='worker2', OrderID='order5', [Date]= '2 January 2024' WHERE DeliveryID='deli5';

UPDATE Feedback
SET MemberID='member1', Feedback_Scale='3', Comment='The taste is just right', FoodID='food3' WHERE FeedbackID='feedback1';
UPDATE Feedback
SET MemberID='member1', Feedback_Scale='4', Comment='I like the smell of the curry', FoodID='food5' WHERE FeedbackID ='feedback2';
UPDATE Feedback
SET MemberID='member1', Feedback_Scale='1', Comment='The price a bit too expensive for me', FoodID='food8' WHERE FeedbackID='feedback3';
UPDATE Feedback
SET MemberID='member4', Feedback_Scale='2', Comment='It is a healthy and balanced meal', FoodID='food2' WHERE FeedbackID='feedback4';
UPDATE Feedback
SET MemberID='member5', Feedback_Scale='1', Comment='It is a little too salty for me', FoodID='food6' WHERE FeedbackID='feedback5';

UPDATE [Member]
SET MemberName='Bryant', ContactNum='0122309871', Gender='Male', Role='Staff' WHERE MemberID='member1';
UPDATE [Member]
SET MemberName='Alicia', ContactNum='0178923341', Gender='Female', Role='Student' WHERE MemberID='member2';
UPDATE [Member]
SET MemberName='James', ContactNum='0198156284', Gender='Male', Role='Student' WHERE MemberID='member3';
UPDATE [Member]
SET MemberName='Paul', ContactNum='0137489917', Gender='Male', Role='Student' WHERE MemberID='member4';
UPDATE [Member]
SET MemberName='Luna', ContactNum='0192213710', Gender='Female', Role='Staff' WHERE MemberID='member5';

UPDATE [Order]
SET MemberID='member1', CartID='cart1', ManagerName='John', FoodID='food3', DeliveryID='deli1', Quantity='1' WHERE OrderID='order1';
UPDATE [Order]
SET MemberID='member1', CartID='cart2', ManagerName='John', FoodID='food5', DeliveryID='deli2', Quantity='2' WHERE OrderID='order2';
UPDATE [Order]
SET MemberID='member1', CartID='cart3', ManagerName='John', FoodID='food8', DeliveryID='deli3', Quantity='3' WHERE OrderID='order3';
UPDATE [Order]
SET MemberID='member4', CartID='cart4', ManagerName='John', FoodID='food2', DeliveryID='deli4', Quantity='4' WHERE OrderID='order4';
UPDATE [Order]
SET MemberID='member5', CartID='cart5', ManagerName='John', FoodID='food6', DeliveryID='deli5', Quantity='1' WHERE OrderID='order5';

UPDATE Payment
SET OrderID='order1', MemberID='member1', Subtotal='8.00' WHERE PaymentID='payment1';
UPDATE Payment
SET OrderID='order2', MemberID='member1', Subtotal='6.00' WHERE PaymentID='payment2';
UPDATE Payment
SET OrderID='order3', MemberID='member1', Subtotal='48.00' WHERE PaymentID='payment3';
UPDATE Payment
SET OrderID='order4', MemberID='member4', Subtotal='50.00' WHERE PaymentID='payment4';
UPDATE Payment
SET OrderID='order5', MemberID='member5', Subtotal='8.00' WHERE PaymentID='payment5';

UPDATE ShoppingCart
SET MemberID='member1', FoodID='food3' WHERE CartID='cart1';
UPDATE ShoppingCart
SET MemberID='member1', FoodID='food5' WHERE CartID='cart2';
UPDATE ShoppingCart
SET MemberID='member1', FoodID='food8' WHERE CartID='cart3';
UPDATE ShoppingCart
SET MemberID='member4', FoodID='food2' WHERE CartID='cart4';
UPDATE ShoppingCart
SET MemberID='member5', FoodID='food6' WHERE CartID='cart5';

UPDATE Worker
SET WorkerName='Jack', DeliveryID='deli1' WHERE WorkerID='worker1';
UPDATE Worker
SET WorkerName='Kelly', DeliveryID='deli3' WHERE WorkerID='worker2';
UPDATE Worker
SET WorkerName='Jonathan', DeliveryID='deli2' WHERE WorkerID='worker3';
UPDATE Worker
SET WorkerName='Max', DeliveryID='deli5' WHERE WorkerID='worker4';
UPDATE Worker
SET WorkerName='Jenny', DeliveryID='deli4' WHERE WorkerID='worker5';

--Questions
--Q1
Select * from Food inner join Feedback on Food.FoodID = Feedback.FoodID
where Feedback.Feedback_Scale in (Select max(Feedback_Scale) from Feedback)

--Q2
Select Member.MemberID, Member.MemberName, count(Feedback.FeedbackID) as Tot_Num_Of_Feedback 
from Member join Feedback on Member.MemberID = Feedback.MemberID
Group by Member.MemberID, Member.MemberName

--Q3
Select Manager.*, COUNT(OrderID) as Tot_Num_Of_Order from [Order], Manager
Group by Manager.ManagerName, Manager.ManagerGender, Manager.ManagerContactNum

--Q4 
Select Cook.ChefID, Chef.ChefName, count(Cook.CookID) as Total_Meal_Cooked
from Cook join Chef on Cook.ChefID = Chef.ChefID
Group by Cook.ChefID, Chef.ChefName


--Q5
Select * from Food
Where Food.FoodID in (Select FoodID from Feedback where Feedback_Scale > (Select avg(Feedback_Scale)from FeedBack))

--Q6 
Select top 3 * from Food
Order by Quantity_Sold desc

--Q7 
 Select Member.MemberID, Member.MemberName, Member.Role 
 from Member 
 where Member.MemberID in 
 (Select Payment.MemberID from Payment where Subtotal in 
 (Select sum(Payment.Subtotal) from Payment group by Payment.MemberID))

--Q8
Select Member.* from Member
Order by Member.Gender

--Q9 
Select [Member].MemberID, [Member].[Role], [Member].ContactNum, ShoppingCart.CartID,
Food.FoodID, Food.FoodName, [Order].OrderID, Delivery.DeliveryStatus 
from [Member] join ShoppingCart on [Member].MemberID=ShoppingCart.MemberID 
join Food on ShoppingCart.FoodID=Food.FoodID join [Order] on Food.FoodID = [Order].FoodID 
join Delivery on [Order].DeliveryID = Delivery.DeliveryID where DeliveryStatus = 'Preparing'


--Q10 
Select Member.MemberID, Member.MemberName, Member.Role, count([Order].MemberID) as Total_Order from [Member] 
join [Order] on [Member].MemberID = [Order].MemberID
Group by Member.MemberID, Member.MemberName, Member.Role
Having count([Order].MemberID)>2
