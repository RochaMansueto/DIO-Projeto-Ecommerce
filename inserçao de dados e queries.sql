-- inserçao de dados e queries
use ecommerce;
show tables;


-- Supplier (idSupplier, Social_Name, CNPJ)
insert into Supplier (idSupplier, Social_Name, CNPJ) values
						(1, 'Alfa Bravo', 121344545094673),
                        (2, 'Romenia LTDA', 094673121344545),
                        (3, 'Elefante na sala', 134454509124673);
 select * from Supplier;      
 
 
 -- idProduct, Pname, classification_kids, category('Textil','Eletronic','brinquedos','livros','cds/dvds','cama mesa e banho','outro'), Pdescription, Pvalue, Evaluation, size.
insert into Product (Pname, classification_kids, category,Pdescription, Pvalue,Evaluation, size)values
						('Fone de ouvido',false,'Eletronic','Fone Simples','22$','4',null),
                        ('Peteca',true,'Brinquedos','Brinquedo para todas idades','9,99$','12',null), 
                        ('Almanaque01',false,'Livros','livro descritivo do mundo','45$','2',null), 
                        ('Supernatural',false,'cds/dvds','temporadas 1- 15 em FullHD','110$','9',null), 
                        ('Cama-Box',false,'Cama mesa e banho','cama casal C/Molas','2350$','20','210x310');
select * from clients;
select * from Product;


-- Supplier_Product(idSupplier, idPproduct)
insert into Supplier_Product(idSupplier, idPproduct) values 
						('1','1'),
                        ('2', '2');
select * from Supplier_Product;

-- Inventory(idInventory, Product_idProduct, Sector, Address('rua','bairro','numero','cidade','complemento','estado','pais').
insert into Inventory(idInventory, Product_idProduct, Sector, Address) values 
						('1', '2', 'B3', null),
                        ('2', '1', 'B1','rua'),
                        ('3', '5', 'B0', 'pais'),
                        ('4', '3', 'B2', 'estado');
					
select * from Inventory;
        
-- Product_Stock(idSproduct,idSinventory,Amount)
insert into Product_Stock(idSproduct,idSinventory,Amount) values
						(1,2,5),
                        (2,4,2),
                        (3,1,3),
                        (4,3,10),
                        (5,2,11);
 select * from Product_Stock;      
 
 
 -- idThird_Party_Seller,Social_Name,CNPJ,Address ENUM('rua','bairro','numero','cidade','complemento','estado','pais'
 insert into Third_Party_Seller(idThird_Party_Seller,Social_Name,CNPJ,Address) values 
						(1,'PlayBoy do abc','1234567','Bairro'),
                        (2,'RR12','4567123','rua'),
                        (3,'Paty','3451267','pais');
 select * from Third_Party_Seller; 
 
 
 -- Product_idProduct,Third_Party_Seller_idThird_Party_Seller,Amount
 insert into  Product_Third_Party_Seller(Product_idProduct,Third_Party_Seller_idThird_Party_Seller,Amount) values
						(1,1,5),
                        (2,2,11),
                        (3,3,14);
		
                  select * from   Product_Third_Party_Seller;    
-- delete from Product_Third_Party_Seller where Product_idProduct in(1,2);


-- Sales_Platform(idSales_Platform,idSThird_Party_Seller)
insert into Sales_Platform(idSales_Platform,idSThird_Party_Seller) values
					(1,2),
                    (2,1),
                    (3,3);
                    
 select * from   Sales_Platform;
 
-- idClient, Fname, Minit, Lname, CPF, CNPJ, Address.
insert into clients (Fname, Minit, Lname, CPF, CNPJ, Address)
	values  ('Matheus','M','Jose','77765445142','0','rua primeiro alfa 01- abc - cidade louca'),
			('Paulo','M','Matheus','44514277765','0','rua da loucura 61- Alamnada - cidade bonita'),
            ('Patricia','F','Paty','10293586789','0','rua das patricias 45 -rio claro - cidade boa'),
			('Cezar','M','Pilatos','64774930450','0','rua flor de liz 89 Rampa-cidade do alto'),
            ('Amanda','F','Cristana','34398506987','0','avenida mais ou menos 121 -Rio Abaixo'),
            ('Ricardo','M','alvez','09823475896','0','rua da Bonita 6-Epica - Meia boca');
          select * from clients; 
           
-- clients_type(Customer_Client,Type_Clients)     
insert into clients_type(Customer_Client,Type_Clients) values
						(1,'Pfisica'),
                        (2,'Pjuridica');
select * from clients_type;

-- idOrder, OrderClient, Status_Order('Em Andamento', 'Processando', 'Enviado', 'Entregue','default'), Description_Order, freight(frete).
insert into Orders (idOrderClient, Status_Order, Description_Order, freight) values
						(1,null,'compra na loja do centro','22$'),
                        (2,'Em Andamento','compra no APP','13$'),
                        (3,'Processando','compra na loja do bairro 1','10$'),
                        (4,'Enviado','compra no APP','50$'),
                        (5,'Em Andamento','compra na loja das patricinhas','14$');
select * from Orders;
-- delete from orders where idOrderClient in(1,2,3,4,5);

-- product_order_list(idOrders,idProduct,Amount)
insert into product_order_list(idOrders,idProduct,Amount) values
						(1,4,3),
                        (2,5,6),
                        (3,3,1),
                        (5,4,2);
select * from product_order_list;


-- payments(idPayments,idClient,idOrder,Methods_payments,Payments_CredCArd ENUM('Nome', 'numero', 'vencimento', 'codigo de segurança')
-- Payments_Slip bool default false,Payments_Pix ENUM('Tipo de chave pix'),Payaments_TedDoc ENUM('banco agencia contanome')

insert into payments(idClient,idOrder,Methods_payments,Payments_CredCArd ,Payments_Slip,Payments_Pix,Payaments_TedDoc) values
					(1,21,'Boleto',null ,true,null,null),
                    (3,23,'CredCar','dados cartao' ,false,null,null),
                     (5,25,'pix-CPF',null ,false,'00103125495',null);
 select * from  payments;                 
-- delete from payments where idPayments in (7,8,9);

-- Delivery,Status_Delivery ENUM('processando','epacotamento','enviada', 'em transito','entregue'),Shipping varchar(20) default 10,
-- classification float default 0,Shipping_code float unique not null,Address ENUM('rua','bairro','numero','cidade','complemento','estado','pais')
insert into Delivery(Status_Delivery,Shipping,classification,Shipping_code,Address) values
					('processando','25$','3',12,'rua'),
                    ('enviada','45$','8',2,'cidade'),
                    ('em transito','10$','10',1,'pais');
 select * from  Delivery; 
