-- Ticket 2: INNER JOIN

Select * from properties;
Select * from Agents;

-- List all properties along with the agent's first name, last name, city, and state
Select FirstName,LastName,City,State from Properties INNER JOIN Agents Using (AgentID);

-- Retrieve the transaction ID and the associated property address, city, and state.
Select TransactionID,address,city,state from Transactions INNER JOIN Properties Using(PropertyID);

-- Find all properties listed by a specific agent (e.g., AgentID = 3) along with the property address, city, state, and listing price.
Select Agents.* , address , city ,state from Agents INNER JOIN Properties Using (AgentID) where AgentID = 3;

-- List all clients along with their first name, last name, email, and the properties they have purchased (address, city, state).
Select FirstName,LastName,Email,address , city ,state from Clients 
INNER JOIN Transactions  using(ClientID)
INNER JOIN Properties using (PropertyID);

-- Ticket 3: LEFT JOIN -----------

-- List all agents, including their first name, last name, email, and phone number, along with the properties they have 
-- listed (include property address, city, and state), even if they have no listings.
Select FirstName,LastName,Email,PhoneNumber,address,city ,state from Agents LEFT JOIN Properties Using(AgentID);


-- Retrieve all properties, including the property address, city, state, and listing price, along with their 
-- transaction details (transaction ID and sale price), even if the property has not been sold yet.
Select address,city,state,ListingPrice,TransactionID,SalePrice from properties Left JOIN Transactions using(PropertyID);

-- List all clients, including their first name, last name, email, and phone number, along with the properties 
-- they have purchased (include property address, city, and state),  even if they haven't purchased anything.
Select FirstName,LastName,Email,PhoneNumber,address, city, state from Clients 
LEFT JOIN Transactions using(ClientID)
Left JOIN Properties using(PropertyID);

-- Retrieve all property types (e.g., Single Family, Condo), including the type name and the details of properties
-- listed under each type (address, city, state), even if no properties are listed under that type.

Select TypeName , address, city, state from PropertyTypes Left JOIN Properties Using(TypeID);

-- Ticket 4: RIGHT JOIN -- 

-- List all properties, including their address, city, state, and listing price, along with the assigned agent's first name, 
-- last name, and email, even if the property doesn't have an assigned agent.
Select address,city,state,ListingPrice ,FirstName, LastName from Agents Right JOIN Properties using(AgentID);

-- Retrieve all transactions, including transaction ID, sale price, and sale date, along with the client's first name, last name,
--  email, and phone number, even if the transaction doesn't have an associated client.
Select TransactionID,SalePrice,SaleDate,FirstName,LastName, Email,PhoneNumber from Clients Right JOIN Transactions using (ClientID);

-- List all property types, including the type name, and the details of properties listed under each type (address, city, state),
--  even if no properties are listed under that type.
Select TypeName,address, city ,state from  properties Right JOIN PropertyTypes using(TypeID);

-- List all clients, including their first name, last name, email, and phone number, along with the transaction ID and sale date,
--  even if they haven't made any transactions.

Select FirstName,LastName,Email,PhoneNumber, TransactionID,SaleDate from Transactions Right JOIN Clients using(ClientID);

-- Ticket 5: CROSS JOIN ------------------
-- Create a list of all possible combinations of agents and properties, including the agent's first name, last name, and email,
--  along with the property address, city, state, and listing price.

Select FirstName,LastName,Email,address,city,state ,ListingPrice from Agents CROSS JOIN Properties;

-- Generate a list of all possible client and property combinations, including the client's first name, last name, and email,
--  along with the property address, city, state, and listing price.

Select FirstName,LastName,Email,address,city,address, state,ListingPrice from Clients CROSS JOIN Properties;

-- Create a list of all property types and all properties, including the type name, property address, city, state, and 
-- listing price.

Select TypeName,Address,address, city ,state,ListingPrice from PropertyTypes CROSS JOIN Properties;

-- List all agents with all clients they could potentially serve, including the agent's first name, last name, and email, 
-- along with the client's first name, last name, and email.

Select A.FirstName agentFirstName,A.LastName agentLastName,A.Email agentEmail , C.FirstName ClientFirstName,C.LastName ClientLastName,C.Email ClientEmail from Agents As A CROSS JOIN Clients AS C;