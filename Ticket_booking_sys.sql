create database TicketBookingSystem;
use TicketBookingSystem;
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255)
);
CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type VARCHAR(255),
    booking_id INT
);
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    booking_id INT
);
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATE
);

INSERT INTO Venue (venue_id, venue_name, address) VALUES
(1, 'Stadium Arena', '123 Stadium Rd, Cityville'),
(2, 'Cinema City', '456 Movie St, Townsville'),
(3, 'Concert Hall', '789 Music Ave, Villageton'),
(4, 'Sports Complex', '101 Sports Blvd, Sportstown'),
(5, 'Outdoor Amphitheater', '555 Park St, Sunnyville'),
(6, 'Convention Center', '888 Conference Ave, Metropolis'),
(7, 'Art Gallery', '777 Gallery St, Artville'),
(8, 'Community Center', '333 Community Dr, Townville'),
(9, 'Theater House', '222 Stage Rd, Dramatown'),
(10, 'Waterfront Pavilion', '999 Waterfront Blvd, Seaside');

INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(1, 'Football Match', '2024-05-10', '18:00:00', 1, 50000, 25000, 5000.00, 'Sports', 11),
(2, 'Movie Premiere', '2024-06-15', '20:00:00', 2, 200, 200, 1000.00, 'Movie', 12),
(3, 'Concert Live', '2024-07-20', '19:30:00', 3, 1000, 800, 7500.00, 'Concert', 13),
(4, 'Basketball Game', '2024-08-05', '17:30:00', 4, 20000, 15000, 3000.00, 'Sports', 14),
(5, 'Outdoor Movie Night', '2024-09-08', '21:00:00', 5, 500, 500, 8000.00, 'Movie', 15),
(6, 'Art Exhibition', '2024-10-12', '10:00:00', 7, 300, 300, 5000.00, 'Exhibition', 16),
(7, 'Community Play', '2024-11-20', '19:00:00', 8, 150, 100, 1500.00, 'Play', 17),
(8, 'Rock Concert', '2024-12-25', '21:30:00', 3, 2000, 1800, 6000.00, 'Concert', 18),
(9, 'Basketball Tournament', '2025-01-05', '09:00:00', 4, 5000, 4000, 2500.00, 'Sports', 19),
(10, 'Comedy Show', '2025-02-15', '20:30:00', 6, 400, 300, 2000.00, 'Comedy', 20);

INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(101, 'Alice Johnson', 'alice@example.com', '111-222-3333', 11),
(102, 'Bob Smith', 'bob@example.com', '444-555-6666', 12),
(103, 'Charlie Brown', 'charlie@example.com', '777-888-9999', 13),
(104, 'Diana Miller', 'diana@example.com', '123-456-7890',14),
(105, 'Eva Davis', 'eva@example.com', '987-654-3210', 15),
(106, 'Frank Wilson', 'frank@example.com', '555-555-5555', 16),
(107, 'Grace Lee', 'grace@example.com', '111-111-1111', 17),
(108, 'Henry Taylor', 'henry@example.com', '222-222-2222', 18),
(109, 'Isabella Martinez', 'isabella@example.com', '333-333-3333', 19),
(110, 'Jack Brown', 'jack@example.com', '666-777-8888',20);

select * from customer;
drop table customer;

INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(11, 101, 1, 2, 10000.00, '2024-05-05'),
(12, 102, 2, 3, 3000.00, '2024-06-10'),
(13, 103, 3, 4, 22500.00, '2024-07-15'),
(14, 104, 4, 1, 3000.00, '2024-08-01'),
(15, 105, 5, 2, 16000.00, '2024-09-01'),
(16, 106, 6, 1, 5000.00, '2024-10-02'),
(17, 107, 7, 2, 30000.00, '2024-11-12'),
(18, 108, 8, 3, 18000.00, '2024-12-20'),
(19, 109, 9, 4, 16000.00, '2025-01-10'),
(20, 110, 10, 2, 4000.00, '2025-02-20');

ALTER TABLE EVENT
ADD FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);
ALTER TABLE EVENT
ADD FOREIGN KEY (venue_id) REFERENCES venue(venue_id);
ALTER TABLE customer
ADD FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);
alter table booking
add foreign key (customer_id) references customer(customer_id);
alter table booking
add foreign key (event_id) references event(event_id);
select * from event;
desc event;
desc customer;
desc booking;

select distinct event_name from event;

select event_id,event_name from event
where available_seats > 0;

select * from event
where event_name like "%cup%";

select * from event
where ticket_price between 1000 and 2500;

select * from event
where event_date between '2024-07-01' and '2024-12-31';

select * from event 
where available_seats>0 and event_type="concert";

select * from Customer 
 LIMIT 5 OFFSET 5;

select * from booking 
where num_tickets > 4;

select * from customer
where phone_number like "%000";

select * from event
where total_seats >15000;

select * from event
where event_name not like "x%" and event_name not like "y%" and event_name not like "z%";

select event_id,event_name,avg(ticket_price)  from event
group by event_id
order by avg(ticket_price);

select sum(total_cost) as revenue from booking;

select event_id,sum(total_cost)
from booking
group by event_id
order by sum(total_cost) desc
limit 1;

select event_id,sum(num_tickets)
from booking 
group by event_id;


select * from event
where event_id not in(select distinct event_id from booking);

select customer_id,sum(num_tickets)
from booking
group by customer_id
order by sum(num_tickets)
limit 1;

select event_id,month(booking_date) as month,sum(num_tickets)
from booking
group by event_id,month;

select venue_id,avg(ticket_price) 
from event
group by venue_id;

select e.event_type,sum(b.num_tickets) 
from event e
inner join booking b
on e.event_id=b.event_id
group by event_type;

select year(booking_date) as year,sum(total_cost)
from booking
group by year;

select customer_id from booking
group by customer_id
having count(distinct event_id)>1;

select customer_id,sum(total_cost)
from booking
group by customer_id;

select venue_id,event_type,avg(ticket_price)
from event
group by venue_id,event_type;

select customer_id,sum(num_tickets) from booking
where booking_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
group by customer_id;

select v.venue_name,(select avg(ticket_price)
from event e
where e.venue_id=v.venue_id) as average_price
from venue v;

select *
from event
where (select cast(sum(num_tickets) as float) / total_seats from booking where booking.event_id = event.event_id) > 0.5;

select event_id, 
(select sum(num_tickets) from Booking where booking.event_id = Eevent.event_id) as tickets_sold
from event;

select * from customer c
where not exists (
select 1 from booking b
where b.customer_id=c.customer_id);

select * from event
where event_id not in(
select distinct event_id
from booking);

select event_type,sum(num_tickets)
from (select e.event_type,b.num_tickets
from event e
join booking b 
on e.event_id=b.event_id)
as subquery
group by event_type;

select * from event
where ticket_price>(
select avg(ticket_price)
from event);

select c.customer_id, 
       c.customer_name,
       (select sum(b.num_tickets * e.ticket_price) 
        from Booking b 
        join event e on b.event_id = e.event_id 
        where b.customer_id = c.customer_id) as total_revenue
from Customer c;

select * from customer
where customer_id in(
select distinct customer_id from booking
where event_id in(select event_id from event where venue_id=3)
);

select e.event_type, sum(b.num_tickets) as total_tickets_sold
from event e
join Booking b on e.event_id = b.event_id
group by e.event_type;

select c.customer_id, 
c.customer_name, 
date_format(b.booking_date, '%Y-%m') as booking_month
from Customer c
join Booking b on c.customer_id = b.customer_id;

select v.venue_id,v.venue_name,
(select avg(ticket_price) 
from event 
where venue_id = v.venue_id) as avg_ticket_price
from Venue v;