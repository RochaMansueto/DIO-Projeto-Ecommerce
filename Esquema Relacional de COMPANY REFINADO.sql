-- criaçao do banco de dados para o cenario do E-commerce
create database ecommerce;
use ecommerce;
-- drop database ecommerce; 
-- criando tabela fornecedor
create TABLE Supplier(
		idSupplier int primary key not null auto_increment,
        Social_Name varchar(45) not null,
        CNPJ float not null,
        constraint unique_CNPJ_client unique (CNPJ)
);
alter table Supplier auto_increment=1;
DESC Supplier;
-- criando tabela produto
-- size = dimensao do produto
create TABLE product(
		idProduct int auto_increment primary key,
        Pname varchar(50) not null,
        classification_kids bool,
        category enum('Textil','Eletronic','brinquedos','livros','cds/dvds','cama mesa e banho','outro') not null,
        Pdescription varchar (45),
        Pvalue varchar (45) not null,
        Evaluation float default 0 ,
        size varchar (45),
        constraint unique_idProduct_client unique (idProduct)
        
);
alter table product auto_increment=1;
desc product;

-- criando tabela Produto por fornecedor
create table Supplier_Product(
		idSupplier int,
        idPproduct int,
        primary key (idSupplier, idPproduct),
        constraint fk_idPproduct_Supplier_Product foreign key (idPproduct) references Product(idProduct),
        constraint fk_idSupplier_Supplier_Product foreign key (idSupplier) references Supplier(idSupplier)
);
desc Supplier_Product;
-- drop TABLE Supplier_Product;


-- criando tabela estoque.
create TABLE Inventory(
		idInventory int primary key auto_increment,
        Product_idProduct int not null,
        Sector varchar(25) default 0,
        Address ENUM('rua','bairro','numero','cidade','complemento','estado','pais'),
        constraint fk_Product_idProduct foreign key (Product_idProduct) references product(idProduct),
        constraint unique_idInventory_client unique (idInventory)
);
alter table Inventory auto_increment=1;


-- criando tabela produto em estoque
create TABLE Product_Stock(
		idSproduct int,
        idSinventory int,
        primary key(idSproduct, idSinventory),
		Amount int not null default 0,
        constraint fk_idSproduct_Product_Stock foreign key (idSproduct) references Product(idProduct),
        constraint fk_idSinventory_Product_Stock foreign key (idSinventory) references Inventory(idInventory)
      
);
desc Product_Stock;


-- criando tabela vendedor terceirizado
create TABLE Third_Party_Seller(
		idThird_Party_Seller int primary key not null unique auto_increment,
        Social_Name varchar(45) not null,
        CNPJ float not null,
		Address ENUM('rua','bairro','numero','cidade','complemento','estado','pais'),
        constraint unique_CNPJ_client unique (CNPJ)
);
alter table Third_Party_Seller auto_increment=1;


-- criando tabela produto por vendedor terceirizado
create TABLE Product_Third_Party_Seller(
		Product_idProduct int,
        Third_Party_Seller_idThird_Party_Seller int,
        primary key(Product_idProduct, Third_Party_Seller_idThird_Party_Seller),
        Amount int not null default 1,
		constraint fk_Third_Party_Seller_idThird_Party_Seller foreign key (Third_Party_Seller_idThird_Party_Seller) references Third_Party_Seller(idThird_Party_Seller)
);
desc Product_Third_Party_Seller;
drop table Product_Third_Party_Seller;


-- criando tabela plataforma de vendas 
create TABLE Sales_Platform(
		idSales_Platform float primary key unique not null,
		idSThird_Party_Seller int,
        constraint fk_idSThird_Party_Seller foreign key (idSThird_Party_Seller) references Third_Party_Seller(idThird_Party_Seller)
);


-- criando tabela cliente
create TABLE clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar (20),
        CPF char (11) not null,
        CNPJ float default ('false'),
        Address varchar(50),
	    constraint unique_cpf_client unique (CPF),
        constraint unique_idClient_client unique (idClient)
);
alter table clients auto_increment=1;
-- drop table CLIENTS;


	-- criando tabela tipos de clientes
create TABLE clients_type(
		Customer_Client int primary key,
        Type_Clients ENUM('Pfisica','Pjuridica')
	);


-- criando tabela pedido
create TABLE orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
        Status_Order ENUM('Em Andamento', 'Processando', 'Enviado', 'Entregue') default ('Em processamento'),
        Description_Order varchar(45),
        freight varchar (45) default 0,
        constraint fk_idOrderClient foreign key (idOrderClient) references clients(idClient)
			on update cascade
);
drop table orders;
alter table orders auto_increment=1;
-- drop table orders;
-- drop table payments;
 desc orders;
 
 
-- criando tabela relacao produto por pedido.
create TABLE product_order_list(
		idOrders int,
        idProduct int,
        Amount varchar(25) default 0,
        primary key (idOrders, idProduct)	
             
);


-- criando tabela pagamentos
create TABLE payments(
		idPayments int auto_increment primary key,
        idClient int,
        idOrder int,
        Methods_payments varchar (20) not null,
        Payments_CredCArd ENUM('dados cartao'),
        Payments_Slip bool default false,
        Payments_Pix float,
        Payaments_TedDoc ENUM('banco agencia contanome'),
        constraint fk_idOrder foreign key (idOrder)references orders(idOrder),
        constraint fk_idClient foreign key (idClient)references Clients(idClient)
				on update cascade
);
alter table payments auto_increment=1;
desc payments;
drop table payments;

-- criando tabela Entrega
create TABLE Delivery(
		idDelivery int auto_increment primary key,
        Status_Delivery ENUM('processando','epacotamento','enviada', 'em transito','entregue'),
        Shipping varchar(20) default 10,
        classification float default 0,
        Shipping_code float unique not null,
        Address ENUM('rua','bairro','numero','cidade','complemento','estado','pais'),
        constraint unique_idDelivery unique (idDelivery)
        
);
alter table Delivery auto_increment=1;

-- drop  table Delivery; 
-- desc orders;
show databases;
-- SHOW tableS;
use information_schema;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';