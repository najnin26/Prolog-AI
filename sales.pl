% Define the available products
product(laptop, 1000).
product(desktop, 800).
product(printer, 200).
product(scanner, 150).

% Define the available customers
customer(john, 5000).
customer(jane, 3000).
customer(bob, 2000).

% Define the sales history
sale(john, laptop, 1).
sale(john, printer, 2).
sale(jane, desktop, 2).
sale(jane, scanner, 1).
sale(bob, laptop, 2).

% Define the price calculation predicate
price(Customer, Product, Quantity, Price) :-
    customer(Customer, Budget),
    product(Product, UnitPrice),
    Price is UnitPrice * Quantity,
    Price =< Budget.

% Define the sales report predicate
sales_report(Customer, Product, Quantity, Price) :-
    sale(Customer, Product, Quantity),
    price(Customer, Product, Quantity, Price).

%sales_report(john, laptop, 1, Price).
