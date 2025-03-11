#CARTA DEL TGB
USE BALTRETAIL;
INSERT INTO CATEGORIAS (NOMBRE,FECHA_CREACION,IMAGEN,ORDEN) VALUES
('DRINKS',NOW(),NULL,0),
('FOOD',NOW(),NULL,0),
('DESSERTS',NOW(),NULL,0);


INSERT INTO SUBCATEGORIAS (ID_CATEGORIA,NOMBRE,FECHA_CREACION,ORDEN) VALUES
(MD5('DRINKS'),'CAFES',NOW(),0),
(MD5('DRINKS'),'SOFT DRINKS',NOW(),0),
(MD5('DRINKS'),'ALCOHOL',NOW(),0);


INSERT INTO SUBCATEGORIAS (ID_CATEGORIA,NOMBRE,FECHA_CREACION,ORDEN) VALUES
(MD5('FOOD'),'BURGERS',NOW(),0),
(MD5('FOOD'),'HOT DOGS',NOW(),0),
(MD5('FOOD'),'APPETIZERS',NOW(),0),
(MD5('FOOD'),'SALADS',NOW(),0);

INSERT INTO SUBCATEGORIAS (ID_CATEGORIA,NOMBRE,FECHA_CREACION,ORDEN) VALUES
(MD5('DESSERTS'),'SHAKES',NOW(),0),
(MD5('DESSERTS'),'ICE CREAM',NOW(),0),
(MD5('DESSERTS'),'CAKES',NOW(),0);

INSERT INTO ARTICULOS (	NOMBRE,DESCRIPCION,PRECIO,CREACION,ACTUALIZACION,DISPONIBILIDAD) VALUES
('Cheeseburger','Carne, queso americano,  lechuga, tomate y salsa TGB',3.5,NOW(),NOW(),TRUE),
('TGB Burger','Carne, queso americano, bacon, lechuga, tomate y salsa TGB',4,NOW(),NOW(),TRUE),
('BBQ','Carne, bacon, aros de cebolla y salsa BBQ',4,NOW(),NOW(),TRUE),
('Pull Pork BBQ','Carne asada deshilachada de cerdo, aros de cebolla y salsa BBQ',4,NOW(),NOW(),TRUE),
('Pollo BLT','Pechuga de pollo natural, bacon, tomate, lechuga y salsa TGB',4,NOW(),NOW(),TRUE),
('Pollo Crunchy','Pan TGB, pollo crujiente, queso, tomate, lechuga y mayonesa',4.5,NOW(),NOW(),TRUE),
('Eco Burger','Carne 100% ECO, queso provolone, mezclum de lechugas, tomate, cebolla a la plancha y mayonesa en pan pretzel',5,NOW(),NOW(),TRUE),
('Gaucha','Pan TGB, carne, huevo, patatas paja, tomate, lechuga y mojo picón',5,NOW(),NOW(),TRUE),
('Hot dog 1','Salchica de vacuno, salsa de queso caliente, bacon y pimiento crujiente',2.5,NOW(),NOW(),TRUE),
('Hot dog 2','Salchica de vacuno, salsa de queso caliente, guacamole y tomate',2.5,NOW(),NOW(),TRUE),
('Hot dog 3','Salchica de vacuno, cebolla a la plancha, pimiento crujiente, mostaza y mayonesa',2.5,NOW(),NOW(),TRUE),
('Hot dog 4','Salchica de vacuno, salsa BBQ y aros de cebolla',2.5,NOW(),NOW(),TRUE),
('Hot dog 5','Salchica de vacuno, patatas paja, ali oli y bacon',2.5,NOW(),NOW(),TRUE),
('Hot dog 6','Salchica bratwurst, mojo picón y patatas paja',2.5,NOW(),NOW(),TRUE),
('Ensalada César','Lechuga Batavia, epic chicken (pollo rebozado), cebolla crujiente, queso rallado, bacon, croutons y salsa César',4.5,NOW(),NOW(),TRUE),
('Ensalada Santa Fé','Lechuga Batavia, epic chiken (pollo rebozado), tomate, bacon, tortilla de trigo y salsa de mostaza y miel',4.5,NOW(),NOW(),TRUE),
('Ensalada TGB','Lechuga Batavia, zanahoria, maíz, bacon, pollo parrilla, tomate, aros de cebolla y salsa TGB',4.5,NOW(),NOW(),TRUE),
('Ensalada de la huerta','Mezclum de lechugas, maíz, zanahoria, tomate cherry, cebolleta, aceitunas, aceite y vinagre',4.5,NOW(),NOW(),TRUE),
('Aros de cebolla','Aros de cebolla',2.5,NOW(),NOW(),TRUE),
('Patatas rizadas','patatas rizadas',2.5,NOW(),NOW(),TRUE),
('Patatas bastón','patatas bastón',2.5,NOW(),NOW(),TRUE),
('Patatas gajo','Patatas gajo',2.5,NOW(),NOW(),TRUE),
('Nachos','Salsa cheddar, chilli con carne, tomate en dados, cebolleta, jalapeños y crema agria',6,NOW(),NOW(),TRUE),
('Epic Chicken','Pollo rebozado con salsa de mostaza y miel',6,NOW(),NOW(),TRUE),
('Alitas de pollo','Alitas de pollo con salsa Bourbon o Sweet Chili',2.5,NOW(),NOW(),TRUE),
('Helado Vainilla','Helado de vainilla',6,NOW(),NOW(),TRUE),
('Contesa','contesa',6,NOW(),NOW(),TRUE),
('Tarta de zanahoria','tarta de zanahoria',6,NOW(),NOW(),TRUE),
('Yogurt','Yogurt',6,NOW(),NOW(),TRUE),
('Agua','Agua',1.5,NOW(),NOW(),TRUE),
('Coca cola','Coca cola',2.5,NOW(),NOW(),TRUE),
('Cerveza','Cerveza',2.5,NOW(),NOW(),TRUE),
('Calimocho','Calimocho',2.5,NOW(),NOW(),TRUE);

INSERT INTO SUBCAT_ART (ID_SUBCATEGORIA,ID_ARTICULO) VALUES
(MD5('CAKES'),MD5('Tarta de zanahoria')),
(MD5('CAKES'),MD5('Contesa')),
(MD5('HOT DOGS'),MD5('Hot dog 1')),
(MD5('HOT DOGS'),MD5('Hot dog 2')),
(MD5('HOT DOGS'),MD5('Hot dog 3')),
(MD5('HOT DOGS'),MD5('Hot dog 4')),
(MD5('HOT DOGS'),MD5('Hot dog 5')),
(MD5('HOT DOGS'),MD5('Hot dog 6')),
(MD5('BURGERS'),MD5('Pull Pork BBQ')),
(MD5('BURGERS'),MD5('Gaucha')),
(MD5('BURGERS'),MD5('Eco Burger')),
(MD5('BURGERS'),MD5('BBQ')),
(MD5('BURGERS'),MD5('Pollo BLT')),
(MD5('BURGERS'),MD5('Cheeseburger')),
(MD5('BURGERS'),MD5('Pollo Crunchy')),
(MD5('BURGERS'),MD5('TGB Burger')),
(MD5('SOFT DRINKS'),MD5('Coca cola')),
(MD5('SOFT DRINKS'),MD5('Calimocho')),
(MD5('SOFT DRINKS'),MD5('Cerveza')),
(MD5('SOFT DRINKS'),MD5('Agua')),
(MD5('APPETIZERS'),MD5('Epic Chicken')),
(MD5('APPETIZERS'),MD5('Alitas de pollo')),
(MD5('APPETIZERS'),MD5('Patatas gajo')),
(MD5('APPETIZERS'),MD5('Aros de cebolla')),
(MD5('APPETIZERS'),MD5('Patatas bastón')),
(MD5('APPETIZERS'),MD5('Nachos')),
(MD5('APPETIZERS'),MD5('Patatas rizadas')),
(MD5('SHAKES'),MD5('Helado Vainilla')),
(MD5('SHAKES'),MD5('Yogurt')),
(MD5('SALADS'),MD5('Ensalada TGB')),
(MD5('SALADS'),MD5('Ensalada de la huerta')),
(MD5('SALADS'),MD5('Ensalada César')),
(MD5('SALADS'),MD5('Ensalada Santa Fé'));

INSERT INTO EMPLEADOS (NOMBRE, APELLIDOS, IDENTIDAD, CORREO, TELEFONO, NACIMIENTO, ALTA, CONTRASEÑA, CARGO, MODIFICACION) VALUES
('Jaime','García Guerra','71226835V','jaime@gmail.com','677611714',20070624,NOW(),MD5('1234'),'ADMINISTRADOR',NOW()),
('Ángel','García Guerra','71226832H','angelguerra.1994@gmail.com','677611714',19940626,NOW(),MD5('2943'),'ADMINISTRADOR',NOW()),
('Álvaro','García Guerra','71375007G','garciaguerraalvaro5@gmail.com','618033527',20101126,NOW(),MD5('2010'),'ADMINISTRADOR',NOW()),
('Thaïs','Calvo Folgado','17380022W','thais@gmail.com','444033527',19930524,NOW(),MD5('4444'),'ADMINISTRADOR',NOW());

INSERT INTO MESAS (MESA, NOMBRE, MAX_COMENSALES, MIN_COMENSALES, OCUPADA, UBICACION, TIPO_MESA, NOTAS) VALUES
-- SALON 1 (80% COMEDOR, 20% ALTA) - Total: 15 mesas
(101, 'Mesa 101', 6, 3, FALSE, 'SALON 1', 'COMEDOR', 'Mesa amplia cerca de la ventana'),
(102, 'Mesa 102', 4, 2, FALSE, 'SALON 1', 'COMEDOR', 'Mesa en esquina'),
(103, 'Mesa 103', 6, 3, FALSE, 'SALON 1', 'COMEDOR', 'Mesa central'),
(104, 'Mesa 104', 4, 2, FALSE, 'SALON 1', 'COMEDOR', 'Mesa con buena iluminación'),
(105, 'Mesa 105', 6, 3, FALSE, 'SALON 1', 'COMEDOR', 'Mesa familiar'),
(106, 'Mesa 106', 4, 2, FALSE, 'SALON 1', 'COMEDOR', 'Mesa cerca de la entrada'),
(107, 'Mesa 107', 6, 3, FALSE, 'SALON 1', 'COMEDOR', 'Mesa espaciosa'),
(108, 'Mesa 108', 4, 2, FALSE, 'SALON 1', 'COMEDOR', 'Mesa adicional'),
(109, 'Mesa 109', 6, 3, FALSE, 'SALON 1', 'COMEDOR', 'Mesa adicional'),
(110, 'Mesa 110', 4, 2, FALSE, 'SALON 1', 'COMEDOR', 'Mesa adicional'),
(111, 'Mesa 111', 4, 2, FALSE, 'SALON 1', 'ALTA', 'Mesa alta en esquina'),
(112, 'Mesa 112', 4, 2, FALSE, 'SALON 1', 'ALTA', 'Mesa alta central'),
(113, 'Mesa 113', 4, 2, FALSE, 'SALON 1', 'ALTA', 'Mesa alta cerca de la ventana'),
(114, 'Mesa 114', 4, 2, FALSE, 'SALON 1', 'ALTA', 'Mesa alta adicional'),
(115, 'Mesa 115', 4, 2, FALSE, 'SALON 1', 'ALTA', 'Mesa alta adicional'),
-- SALON 2 (80% COMEDOR, 20% CHILLOUT) - Total: 15 mesas
(201, 'Mesa 201', 6, 3, FALSE, 'SALON 2', 'COMEDOR', 'Mesa amplia cerca de la ventana'),
(202, 'Mesa 202', 4, 2, FALSE, 'SALON 2', 'COMEDOR', 'Mesa en esquina'),
(203, 'Mesa 203', 6, 3, FALSE, 'SALON 2', 'COMEDOR', 'Mesa central'),
(204, 'Mesa 204', 4, 2, FALSE, 'SALON 2', 'COMEDOR', 'Mesa con buena iluminación'),
(205, 'Mesa 205', 6, 3, FALSE, 'SALON 2', 'COMEDOR', 'Mesa familiar'),
(206, 'Mesa 206', 4, 2, FALSE, 'SALON 2', 'COMEDOR', 'Mesa cerca de la entrada'),
(207, 'Mesa 207', 6, 3, FALSE, 'SALON 2', 'COMEDOR', 'Mesa espaciosa'),
(208, 'Mesa 208', 4, 2, FALSE, 'SALON 2', 'COMEDOR', 'Mesa adicional'),
(209, 'Mesa 209', 6, 3, FALSE, 'SALON 2', 'COMEDOR', 'Mesa adicional'),
(210, 'Mesa 210', 4, 2, FALSE, 'SALON 2', 'COMEDOR', 'Mesa adicional'),
(211, 'Mesa 211', 2, 1, FALSE, 'SALON 2', 'CHILLOUT', 'Mesa chillout en esquina'),
(212, 'Mesa 212', 2, 1, FALSE, 'SALON 2', 'CHILLOUT', 'Mesa chillout central'),
(213, 'Mesa 213', 2, 1, FALSE, 'SALON 2', 'CHILLOUT', 'Mesa chillout cerca de la ventana'),
(214, 'Mesa 214', 2, 1, FALSE, 'SALON 2', 'CHILLOUT', 'Mesa chillout adicional'),
(215, 'Mesa 215', 2, 1, FALSE, 'SALON 2', 'CHILLOUT', 'Mesa chillout adicional'),
-- TERRAZA 1 (80% CHILLOUT, 20% ALTA) - Total: 10 mesas
(301, 'Mesa 301', 2, 1, FALSE, 'TERRAZA 1', 'CHILLOUT', 'Mesa chillout con vista al jardín'),
(302, 'Mesa 302', 2, 1, FALSE, 'TERRAZA 1', 'CHILLOUT', 'Mesa chillout cerca de la fuente'),
(303, 'Mesa 303', 2, 1, FALSE, 'TERRAZA 1', 'CHILLOUT', 'Mesa chillout en esquina'),
(304, 'Mesa 304', 2, 1, FALSE, 'TERRAZA 1', 'CHILLOUT', 'Mesa chillout adicional'),
(305, 'Mesa 305', 2, 1, FALSE, 'TERRAZA 1', 'CHILLOUT', 'Mesa chillout adicional'),
(306, 'Mesa 306', 4, 2, FALSE, 'TERRAZA 1', 'ALTA', 'Mesa alta con vista al jardín'),
(307, 'Mesa 307', 4, 2, FALSE, 'TERRAZA 1', 'ALTA', 'Mesa alta cerca de la fuente'),
(308, 'Mesa 308', 4, 2, FALSE, 'TERRAZA 1', 'ALTA', 'Mesa alta adicional'),
(309, 'Mesa 309', 4, 2, FALSE, 'TERRAZA 1', 'ALTA', 'Mesa alta adicional'),
(310, 'Mesa 310', 4, 2, FALSE, 'TERRAZA 1', 'ALTA', 'Mesa alta adicional'),
-- TERRAZA 2 (80% CHILLOUT, 20% ALTA) - Total: 10 mesas
(401, 'Mesa 401', 2, 1, FALSE, 'TERRAZA 2', 'CHILLOUT', 'Mesa chillout con vista al parque'),
(402, 'Mesa 402', 2, 1, FALSE, 'TERRAZA 2', 'CHILLOUT', 'Mesa chillout cerca del bar'),
(403, 'Mesa 403', 2, 1, FALSE, 'TERRAZA 2', 'CHILLOUT', 'Mesa chillout en esquina'),
(404, 'Mesa 404', 2, 1, FALSE, 'TERRAZA 2', 'CHILLOUT', 'Mesa chillout adicional'),
(405, 'Mesa 405', 2, 1, FALSE, 'TERRAZA 2', 'CHILLOUT', 'Mesa chillout adicional'),
(406, 'Mesa 406', 4, 2, FALSE, 'TERRAZA 2', 'ALTA', 'Mesa alta con vista al parque'),
(407, 'Mesa 407', 4, 2, FALSE, 'TERRAZA 2', 'ALTA', 'Mesa alta cerca del bar'),
(408, 'Mesa 408', 4, 2, FALSE, 'TERRAZA 2', 'ALTA', 'Mesa alta adicional'),
(409, 'Mesa 409', 4, 2, FALSE, 'TERRAZA 2', 'ALTA', 'Mesa alta adicional'),
(410, 'Mesa 410', 4, 2, FALSE, 'TERRAZA 2', 'ALTA', 'Mesa alta adicional');
