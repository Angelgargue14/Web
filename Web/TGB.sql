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

INSERT INTO ARTICULOS (NOMBRE,DESCRIPCION,PRECIO,CREACION,ACTUALIZACION,DISPONIBILIDAD) VALUES
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

-- INSERCIÓN DE CLIENTES DE EJEMPLO:
INSERT INTO CLIENTES (ID_CLIENTE, NOMBRE, APELLIDOS, TIPO_DOCUMENTO, IDENTIDAD, FECHA_NACIMIENTO, CORREO, TELEFONO, DIRECCION, CODIGO_POSTAL, CIUDAD, PROVINCIA, PAIS, RAZON_SOCIAL, TIPO_CLIENTE, MOROSO, ALTA, MODIFICACION, OBSERVACIONES) VALUES
(MD5('11112222A'), 'Claudia', 'Romero Blanco', 'NIF', '11112222A', '1985-07-23', 'claudia.romero@example.com', '600445566', 'Calle Nube 18', '28010', 'Madrid', 'Madrid', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-05', NOW(), NULL),
(MD5('22223333B'), 'Rubén', 'Gil Márquez', 'NIF', '22223333B', '1990-10-17', 'ruben.gil@example.com', '611778899', 'Av. Europa 7', '02002', 'Albacete', 'Albacete', 'España', NULL, 'PARTICULAR', TRUE, '2024-01-28', NOW(), 'Revisar solvencia'),
(MD5('C7654321P'), 'Inversiones del Sur SL', NULL, 'CIF', 'C7654321P', NULL, 'info@invsur.com', '922334455', 'Calle Comercio 4', '38001', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'España', 'Inversiones del Sur SL', 'EMPRESA', FALSE, '2024-03-02', NOW(), NULL),
(MD5('33334444C'), 'Esther', 'Martín Gómez', 'NIF', '33334444C', '1987-03-12', 'esther.martin@example.com', '623456789', 'Calle Rosario 12', '47003', 'Valladolid', 'Valladolid', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-22', NOW(), NULL),
(MD5('44445555D'), 'Iván', 'Cano Ruiz', 'NIF', '44445555D', '1992-11-04', 'ivan.cano@example.com', '698123456', 'Paseo Central 45', '16001', 'Cuenca', 'Cuenca', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-08', NOW(), NULL),
(MD5('B8765432Q'), 'Alimentos del Mar S.L.', NULL, 'CIF', 'B8765432Q', NULL, 'ventas@alimentosmar.com', '934556677', 'Pol. Pesquero 9', '15001', 'La Coruña', 'A Coruña', 'España', 'Alimentos del Mar S.L.', 'EMPRESA', FALSE, '2024-01-17', NOW(), NULL),
(MD5('55556666E'), 'Isabel', 'Díaz Romero', 'NIF', '55556666E', '1993-01-20', 'isabel.diaz@example.com', '688667788', 'Calle Sauce 8', '06005', 'Badajoz', 'Badajoz', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-01', NOW(), NULL),
(MD5('66667777F'), 'Alberto', 'Santos Ferrer', 'NIF', '66667777F', '1995-08-16', 'alberto.santos@example.com', '677889944', 'Av. de los Pinos 25', '11010', 'Cádiz', 'Cádiz', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-14', NOW(), NULL),
(MD5('A2233445R'), 'Gestores Unidos SL', NULL, 'CIF', 'A2233445R', NULL, 'contacto@gestoresunidos.com', '913223344', 'Calle Oficina 1', '09006', 'Burgos', 'Burgos', 'España', 'Gestores Unidos SL', 'EMPRESA', FALSE, '2024-02-03', NOW(), NULL),
(MD5('77778888G'), 'Natalia', 'Serrano Ortega', 'NIF', '77778888G', '1989-04-02', 'natalia.serrano@example.com', '655443322', 'Calle Álamo 3', '27001', 'Lugo', 'Lugo', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-12', NOW(), NULL),
(MD5('88889999H'), 'Luis', 'Flores Cabrera', 'NIF', '88889999H', '1988-02-26', 'luis.flores@example.com', '633556677', 'Camino Viejo 20', '13001', 'Ciudad Real', 'Ciudad Real', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-25', NOW(), NULL),
(MD5('D2233445S'), 'Servicios Técnicos SL', NULL, 'CIF', 'D2233445S', NULL, 'ventas@servtec.com', '935556677', 'Calle Talleres 6', '43204', 'Reus', 'Tarragona', 'España', 'Servicios Técnicos SL', 'EMPRESA', FALSE, '2024-02-06', NOW(), NULL),
(MD5('99990000I'), 'Sara', 'Nieto Herrera', 'NIF', '99990000I', '1991-09-15', 'sara.nieto@example.com', '699887744', 'Calle Norte 44', '49002', 'Zamora', 'Zamora', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-10', NOW(), NULL),
(MD5('00001111J'), 'Diego', 'Marín Castaño', 'NIF', '00001111J', '1990-01-19', 'diego.marin@example.com', '644223311', 'Calle del Lago 5', '40003', 'Segovia', 'Segovia', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-19', NOW(), NULL),
(MD5('E4455667U'), 'Electrodomésticos Sur SL', NULL, 'CIF', 'E4455667U', NULL, 'ventas@electrosur.com', '976334455', 'Av. Industria 17', '44001', 'Teruel', 'Teruel', 'España', 'Electrodomésticos Sur SL', 'EMPRESA', FALSE, '2024-01-05', NOW(), NULL),
(MD5('12344321K'), 'Beatriz', 'Vega Jiménez', 'NIF', '12344321K', '1985-02-28', 'beatriz.vega@example.com', '699443322', 'Calle Cerezo 6', '05003', 'Ávila', 'Ávila', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-16', NOW(), NULL),
(MD5('13579246L'), 'Raúl', 'Delgado Pascual', 'NIF', '13579246L', '1984-07-21', 'raul.delgado@example.com', '622334455', 'Calle Real 9', '42002', 'Soria', 'Soria', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-13', NOW(), NULL),
(MD5('B3344556V'), 'Obras y Reformas SL', NULL, 'CIF', 'B3344556V', NULL, 'proyectos@obrasreformas.com', '988556677', 'Parque Obra 13', '32004', 'Ourense', 'Ourense', 'España', 'Obras y Reformas SL', 'EMPRESA', FALSE, '2024-02-09', NOW(), NULL),
(MD5('19827364M'), 'Noelia', 'Crespo Vargas', 'NIF', '19827364M', '1980-12-04', 'noelia.crespo@example.com', '688998877', 'Calle Tilo 4', '19002', 'Guadalajara', 'Guadalajara', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-06', NOW(), NULL),
(MD5('27364519N'), 'Mario', 'Rey Morales', 'NIF', '27364519N', '1994-05-28', 'mario.rey@example.com', '699112233', 'Plaza de la Paz 2', '34001', 'Palencia', 'Palencia', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-20', NOW(), NULL);

INSERT INTO CLIENTES (ID_CLIENTE, NOMBRE, APELLIDOS, TIPO_DOCUMENTO, IDENTIDAD, FECHA_NACIMIENTO, CORREO, TELEFONO, DIRECCION, CODIGO_POSTAL, CIUDAD, PROVINCIA, PAIS, RAZON_SOCIAL, TIPO_CLIENTE, MOROSO, ALTA, MODIFICACION, OBSERVACIONES) VALUES
(MD5('37364520P'), 'Verónica', 'Fuentes López', 'NIF', '37364520P', '1992-06-11', 'veronica.fuentes@example.com', '664123789', 'Calle Ávila 34', '38006', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-22', NOW(), NULL),
(MD5('48273628A'), 'Luis', 'Gómez Sánchez', 'NIF', '48273628A', '1994-12-01', 'luis.gomez@example.com', '611232445', 'Calle Granada 4', '18004', 'Granada', 'Granada', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-15', NOW(), NULL),
(MD5('B3456789W'), 'Consultores Soluciones S.L.', NULL, 'CIF', 'B3456789W', NULL, 'info@consultores.com', '944112233', 'Calle Central 18', '48001', 'Bilbao', 'Vizcaya', 'España', 'Consultores Soluciones S.L.', 'EMPRESA', FALSE, '2024-02-12', NOW(), NULL),
(MD5('56473829B'), 'Raquel', 'Moreno Pérez', 'NIF', '56473829B', '1986-09-08', 'raquel.moreno@example.com', '629836547', 'Calle Sevilla 11', '21001', 'Huelva', 'Huelva', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-09', NOW(), NULL),
(MD5('67584930C'), 'Carlos', 'Torres Sánchez', 'NIF', '67584930C', '1983-04-10', 'carlos.torres@example.com', '633554433', 'Calle Asturias 3', '33001', 'Oviedo', 'Asturias', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-15', NOW(), NULL),
(MD5('A2233445P'), 'Alquileres Zaragoza S.L.', NULL, 'CIF', 'A2233445P', NULL, 'info@alquilereszaragoza.com', '977334455', 'Calle Alquiler 2', '50001', 'Zaragoza', 'Zaragoza', 'España', 'Alquileres Zaragoza S.L.', 'EMPRESA', FALSE, '2024-02-21', NOW(), NULL),
(MD5('78263459D'), 'Eva', 'Sánchez García', 'NIF', '78263459D', '1987-05-22', 'eva.sanchez@example.com', '664223311', 'Calle Palmeras 16', '14003', 'Córdoba', 'Córdoba', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-20', NOW(), NULL),
(MD5('A1122334J'), 'Comercio Global S.L.', NULL, 'CIF', 'A1122334J', NULL, 'contacto@comercioglobal.com', '915678990', 'Calle Empresarial 11', '28004', 'Madrid', 'Madrid', 'España', 'Comercio Global S.L.', 'EMPRESA', FALSE, '2024-01-25', NOW(), NULL),
(MD5('88990077F'), 'Antonio', 'López Díaz', 'NIF', '88990077F', '1990-02-14', 'antonio.lopez@example.com', '622334455', 'Calle Mayor 8', '44002', 'Teruel', 'Teruel', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-11', NOW(), NULL),
(MD5('11023344G'), 'Natalia', 'Herrera García', 'NIF', '11023344G', '1996-07-02', 'natalia.herrera@example.com', '699122233', 'Av. Castilla 15', '15001', 'A Coruña', 'A Coruña', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-18', NOW(), NULL),
(MD5('A6677889H'), 'Soluciones Tecnológicas S.L.', NULL, 'CIF', 'A6677889H', NULL, 'ventas@solutec.com', '937112233', 'Calle Innovación 7', '08014', 'Barcelona', 'Barcelona', 'España', 'Soluciones Tecnológicas S.L.', 'EMPRESA', FALSE, '2024-03-03', NOW(), NULL),
(MD5('55667788M'), 'Juan', 'Alvarez Fernández', 'NIF', '55667788M', '1989-08-19', 'juan.alvarez@example.com', '688556677', 'Calle Luna 5', '08013', 'Barcelona', 'Barcelona', 'España', NULL, 'PARTICULAR', FALSE, '2024-03-07', NOW(), NULL),
(MD5('66554433N'), 'Cristina', 'Jiménez Gómez', 'NIF', '66554433N', '1985-12-11', 'cristina.jimenez@example.com', '634223311', 'Calle Sol 22', '41003', 'Sevilla', 'Sevilla', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-17', NOW(), NULL),
(MD5('D9988776R'), 'Automoción García S.L.', NULL, 'CIF', 'D9988776R', NULL, 'contacto@automociongarcia.com', '947667788', 'Calle Taller 8', '49001', 'Valladolid', 'Valladolid', 'España', 'Automoción García S.L.', 'EMPRESA', FALSE, '2024-02-13', NOW(), NULL),
(MD5('12344321S'), 'Manuel', 'Córdoba Aguilar', 'NIF', '12344321S', '1991-01-29', 'manuel.cordoba@example.com', '600443322', 'Calle Barcelona 6', '10001', 'Cáceres', 'Cáceres', 'España', NULL, 'PARTICULAR', FALSE, '2024-02-24', NOW(), NULL),
(MD5('54321987J'), 'Distribuciones Sánchez SL', NULL, 'CIF', '54321987J', NULL, 'ventas@distrosanchez.com', '963224466', 'Calle Industrial 4', '39010', 'Santander', 'Cantabria', 'España', 'Distribuciones Sánchez SL', 'EMPRESA', FALSE, '2024-01-30', NOW(), NULL),
(MD5('44455566K'), 'Paula', 'Crespo Pérez', 'NIF', '44455566K', '1993-03-22', 'paula.crespo@example.com', '688554433', 'Calle Plateros 19', '03005', 'Alicante', 'Alicante', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-10', NOW(), NULL),
(MD5('11223344T'), 'Empresas Unidas S.L.', NULL, 'CIF', '11223344T', NULL, 'informacion@empresasunidas.com', '954665544', 'Calle Empresarial 16', '41001', 'Sevilla', 'Sevilla', 'España', 'Empresas Unidas S.L.', 'EMPRESA', FALSE, '2024-02-18', NOW(), NULL),
(MD5('77668899L'), 'Adriana', 'García Sánchez', 'NIF', '77668899L', '1995-11-09', 'adriana.garcia@example.com', '664223344', 'Calle Andalucía 30', '33001', 'Oviedo', 'Asturias', 'España', NULL, 'PARTICULAR', FALSE, '2024-01-14', NOW(), NULL),
(MD5('87779900X'), 'Distribuciones del Norte S.L.', NULL, 'CIF', '87779900X', NULL, 'contacto@distribucionnorte.com', '945667788', 'Calle Cuarzo 3', '49001', 'Valladolid', 'Valladolid', 'España', 'Distribuciones del Norte S.L.', 'EMPRESA', FALSE, '2024-03-05', NOW(), NULL);

/*INGREDIENTES DEL TGB*/

-- Inserts para la tabla INGREDIENTES
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'db848cd884afe28bbed63c312fef76b1', 'Carne de vacuno', 'Ingrediente: Carne de vacuno', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'fd6aa1e50d779174afcdc6def27d3d66', 'Queso americano', 'Ingrediente: Queso americano', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '4f9af31ca3b2d58798baa5bdab1dc831', 'Lechuga', 'Ingrediente: Lechuga', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '9e4867f297418726b5ed03ea43aae0d2', 'Tomate', 'Ingrediente: Tomate', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b26ad40228723acb7dc74b384b5cd98b', 'Salsa TGB', 'Ingrediente: Salsa TGB', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '56583656246065ffb96e23674a21e235', 'Bacon', 'Ingrediente: Bacon', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '78d14b8121fe9c52c749197bcbcd51c0', 'Aros de cebolla', 'Ingrediente: Aros de cebolla', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'f2e4edc04008caddb44435fb0dfcb836', 'Salsa BBQ', 'Ingrediente: Salsa BBQ', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'd3546200c1789ed7f09617232d13c1be', 'Carne deshilachada de cerdo', 'Ingrediente: Carne deshilachada de cerdo', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '8f8a207d3d0c013c21e3504a4e7f0d16', 'Pechuga de pollo natural', 'Ingrediente: Pechuga de pollo natural', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'aa304402b1a4a524cbc2e4d243e70ff8', 'Pollo crujiente', 'Ingrediente: Pollo crujiente', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b15cb7694964ae77771928cb78d823a9', 'Queso', 'Ingrediente: Queso', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '2973a7b533b738a7dfdf1712fceadf4a', 'Mayonesa', 'Ingrediente: Mayonesa', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'a850a8b1d1ce30f17700f4e6f9f7f221', 'Carne 100% ECO', 'Ingrediente: Carne 100% ECO', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'bced7bca895f114766a01b90b0370e56', 'Queso provolone', 'Ingrediente: Queso provolone', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'c3bcdb513686b31ba34b02eb7878dddd', 'Mezclum de lechugas', 'Ingrediente: Mezclum de lechugas', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'd2d3a9c780e4608df088d20f14b584fe', 'Cebolla a la plancha', 'Ingrediente: Cebolla a la plancha', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '8a5db693fab1d9456e2d7455c7b187de', 'Pan pretzel', 'Ingrediente: Pan pretzel', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'a09ea0d3d23a39fbe3b7825949fc155b', 'Huevo', 'Ingrediente: Huevo', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '1ee9b36c32dccf675a7396ec131e06f3', 'Patatas paja', 'Ingrediente: Patatas paja', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '28c2b4254407eaf36c738430bb848d9a', 'Mojo picón', 'Ingrediente: Mojo picón', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '51cec7e55071ec94190251afa790fb70', 'Salchicha de vacuno', 'Ingrediente: Salchicha de vacuno', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '23b452d896222bd44662b0554e9427e7', 'Salsa de queso caliente', 'Ingrediente: Salsa de queso caliente', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '43debce67e719214395cba396485036d', 'Pimiento crujiente', 'Ingrediente: Pimiento crujiente', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '0091dc4bb8c8fc42c2eb2464cac15a73', 'Guacamole', 'Ingrediente: Guacamole', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '53924531f7dd16987255d81906731dea', 'Mostaza', 'Ingrediente: Mostaza', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '217cbad1ec6b297741bbfd6456503758', 'Ali oli', 'Ingrediente: Ali oli', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'f7cae40dc41870239e77a964286abaf5', 'Salchicha bratwurst', 'Ingrediente: Salchicha bratwurst', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '5f68a578062f0c527fdc50df7c310b24', 'Lechuga Batavia', 'Ingrediente: Lechuga Batavia', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '55535c0e92a455a58ddb577da9022183', 'Epic chicken', 'Ingrediente: Epic chicken', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '5a63ada0578bcc9058bb4c53186326dc', 'Cebolla crujiente', 'Ingrediente: Cebolla crujiente', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'bb70be95863724609d92c052c6dc1956', 'Queso rallado', 'Ingrediente: Queso rallado', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'bbbf9a254cc6bbb26dc769b856face7c', 'Croutons', 'Ingrediente: Croutons', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b860eb9da87aeecc33eda2c7d37d2050', 'Salsa César', 'Ingrediente: Salsa César', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '0c6854521ff8f56afc2ad8ac5c91976f', 'Tortilla de trigo', 'Ingrediente: Tortilla de trigo', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b1df1f3b937a424cfc329516a7266165', 'Salsa de mostaza y miel', 'Ingrediente: Salsa de mostaza y miel', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '3158b3e8b252c1c81572ceda34036bf8', 'Zanahoria', 'Ingrediente: Zanahoria', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '3d17dd907b42e340c68f215180570b2d', 'Maíz', 'Ingrediente: Maíz', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '2160d6870d69f34464376361d6ac851c', 'Pollo parrilla', 'Ingrediente: Pollo parrilla', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '1e1855b37d5911e44b9412aa0416fd2b', 'Aceitunas', 'Ingrediente: Aceitunas', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '18a417cd2b0da82e937c957462f6011e', 'Aceite', 'Ingrediente: Aceite', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'a70cd4713b83d0e300222f35e5d2db98', 'Vinagre', 'Ingrediente: Vinagre', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'bfea7ea262eb3b7a150417d08707c50a', 'Patatas rizadas', 'Ingrediente: Patatas rizadas', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '8dd29990a6cac72172bd58fa4b37e2fe', 'Patatas bastón', 'Ingrediente: Patatas bastón', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '1f3914351c93df888601d4ce3725a183', 'Patatas gajo', 'Ingrediente: Patatas gajo', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '8dca662b10a15490fcc6f99cf37cf58f', 'Salsa cheddar', 'Ingrediente: Salsa cheddar', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b118d72a9f24a307573d7988bf15e113', 'Chilli con carne', 'Ingrediente: Chilli con carne', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'f30aedb3c7fd6be7f5bd2709920bb593', 'Tomate en dados', 'Ingrediente: Tomate en dados', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '5d33611a8883cc5e85fc9bc1244f0ff5', 'Cebolleta', 'Ingrediente: Cebolleta', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '87d4b1118a280ce3e205ede5519c07cc', 'Jalapeños', 'Ingrediente: Jalapeños', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'fc30676674fcf809969631202e559eb2', 'Crema agria', 'Ingrediente: Crema agria', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '13894cb3a6f7c3f093382524db5530c8', 'Alitas de pollo', 'Ingrediente: Alitas de pollo', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '60732f89ce7ee91357ec1022bf60a23a', 'Salsa Bourbon', 'Ingrediente: Salsa Bourbon', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '834b84767f6c00853cae7bd173c52f64', 'Salsa Sweet Chili', 'Ingrediente: Salsa Sweet Chili', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'b081fd314eee470d036a7515868dca0a', 'Helado de vainilla', 'Ingrediente: Helado de vainilla', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'caa444100a4e2213ea4249928678a606', 'Contesa', 'Ingrediente: Contesa', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    'a90b6842874d6b3a30f00298a7202314', 'Tarta de zanahoria', 'Ingrediente: Tarta de zanahoria', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '6a574c47f5fd3614764e15ec7506f5a9', 'Yogurt', 'Ingrediente: Yogurt', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '5a7d388462e4a60491f7c1cc32926230', 'Agua', 'Ingrediente: Agua', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '2b1797917feb602f31481de12bbb00fa', 'Coca cola', 'Ingrediente: Coca cola', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '46dfeebbf3d860ccfa63643dabac1dec', 'Cerveza', 'Ingrediente: Cerveza', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);
INSERT INTO INGREDIENTES (
    ID_INGREDIENTE, NOMBRE, DESCRIPCION, CREACION, ACTUALIZACION, PESO, DIMENSIONES,
    DESCUENTO, UBICACION, COMENTARIO, STOCK) VALUES (
    '2b53ec412444b2c347182aacf1605868', 'Calimocho', 'Ingrediente: Calimocho', '2025-05-01 15:37:21', '2025-05-01 15:37:21',
    0.10, '10x10x2', 0.00, 'A01', 'Generado automáticamente', 100);

/*RELACION INGREDIENTES ARTÍCULOS:*/

-- Cheeseburger: Carne de vacuno, Queso americano, Lechuga, Tomate, Salsa TGB
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Carne de vacuno'), MD5('Cheeseburger')),
(MD5('Queso americano'), MD5('Cheeseburger')),
(MD5('Lechuga'), MD5('Cheeseburger')),
(MD5('Tomate'), MD5('Cheeseburger')),
(MD5('Salsa TGB'), MD5('Cheeseburger'));

-- TGB Burger: Carne de vacuno, Queso americano, Bacon, Lechuga, Tomate, Salsa TGB
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Carne de vacuno'), MD5('TGB Burger')),
(MD5('Queso americano'), MD5('TGB Burger')),
(MD5('Bacon'), MD5('TGB Burger')),
(MD5('Lechuga'), MD5('TGB Burger')),
(MD5('Tomate'), MD5('TGB Burger')),
(MD5('Salsa TGB'), MD5('TGB Burger'));

-- BBQ: Carne de vacuno, Bacon, Aros de cebolla, Salsa BBQ
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Carne de vacuno'), MD5('BBQ')),
(MD5('Bacon'), MD5('BBQ')),
(MD5('Aros de cebolla'), MD5('BBQ')),
(MD5('Salsa BBQ'), MD5('BBQ'));

-- Pull Pork BBQ: Carne deshilachada de cerdo, Aros de cebolla, Salsa BBQ
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Carne deshilachada de cerdo'), MD5('Pull Pork BBQ')),
(MD5('Aros de cebolla'), MD5('Pull Pork BBQ')),
(MD5('Salsa BBQ'), MD5('Pull Pork BBQ'));

-- Pollo BLT: Pechuga de pollo, Bacon, Tomate, Lechuga, Salsa TGB
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Pechuga de pollo'), MD5('Pollo BLT')),
(MD5('Bacon'), MD5('Pollo BLT')),
(MD5('Tomate'), MD5('Pollo BLT')),
(MD5('Lechuga'), MD5('Pollo BLT')),
(MD5('Salsa TGB'), MD5('Pollo BLT'));

-- Pollo Crunchy: Pan TGB, Pollo crujiente, Queso americano, Tomate, Lechuga, Mayonesa
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Pan TGB'), MD5('Pollo Crunchy')),
(MD5('Pollo crujiente'), MD5('Pollo Crunchy')),
(MD5('Queso americano'), MD5('Pollo Crunchy')),
(MD5('Tomate'), MD5('Pollo Crunchy')),
(MD5('Lechuga'), MD5('Pollo Crunchy')),
(MD5('Mayonesa'), MD5('Pollo Crunchy'));

-- Eco Burger: Carne ECO, Queso provolone, Mezclum de lechugas, Tomate, Cebolla a la plancha, Mayonesa, Pan pretzel
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Carne ECO'), MD5('Eco Burger')),
(MD5('Queso provolone'), MD5('Eco Burger')),
(MD5('Mezclum de lechugas'), MD5('Eco Burger')),
(MD5('Tomate'), MD5('Eco Burger')),
(MD5('Cebolla a la plancha'), MD5('Eco Burger')),
(MD5('Mayonesa'), MD5('Eco Burger')),
(MD5('Pan pretzel'), MD5('Eco Burger'));

-- Gaucha: Pan TGB, Carne de vacuno, Huevo, Patatas paja, Tomate, Lechuga, Mojo picón
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Pan TGB'), MD5('Gaucha')),
(MD5('Carne de vacuno'), MD5('Gaucha')),
(MD5('Huevo'), MD5('Gaucha')),
(MD5('Patatas paja'), MD5('Gaucha')),
(MD5('Tomate'), MD5('Gaucha')),
(MD5('Lechuga'), MD5('Gaucha')),
(MD5('Mojo picón'), MD5('Gaucha'));

-- Hot dog 1: Salchicha de vacuno, Salsa de queso caliente, Bacon, Pimiento crujiente
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha de vacuno'), MD5('Hot dog 1')),
(MD5('Salsa de queso caliente'), MD5('Hot dog 1')),
(MD5('Bacon'), MD5('Hot dog 1')),
(MD5('Pimiento crujiente'), MD5('Hot dog 1'));

-- Hot dog 2: Salchicha de vacuno, Salsa de queso caliente, Guacamole, Tomate
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha de vacuno'), MD5('Hot dog 2')),
(MD5('Salsa de queso caliente'), MD5('Hot dog 2')),
(MD5('Guacamole'), MD5('Hot dog 2')),
(MD5('Tomate'), MD5('Hot dog 2'));

-- Hot dog 3: Salchicha de vacuno, Cebolla a la plancha, Pimiento crujiente, Mostaza, Mayonesa
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha de vacuno'), MD5('Hot dog 3')),
(MD5('Cebolla a la plancha'), MD5('Hot dog 3')),
(MD5('Pimiento crujiente'), MD5('Hot dog 3')),
(MD5('Mostaza'), MD5('Hot dog 3')),
(MD5('Mayonesa'), MD5('Hot dog 3'));

-- Hot dog 4: Salchicha de vacuno, Salsa BBQ, Aros de cebolla
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha de vacuno'), MD5('Hot dog 4')),
(MD5('Salsa BBQ'), MD5('Hot dog 4')),
(MD5('Aros de cebolla'), MD5('Hot dog 4'));

-- Hot dog 5: Salchicha de vacuno, Patatas paja, Ali oli, Bacon
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha de vacuno'), MD5('Hot dog 5')),
(MD5('Patatas paja'), MD5('Hot dog 5')),
(MD5('Ali oli'), MD5('Hot dog 5')),
(MD5('Bacon'), MD5('Hot dog 5'));

-- Hot dog 6: Salchicha bratwurst, Mojo picón, Patatas paja
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salchicha bratwurst'), MD5('Hot dog 6')),
(MD5('Mojo picón'), MD5('Hot dog 6')),
(MD5('Patatas paja'), MD5('Hot dog 6'));

-- Ensalada César: Lechuga Batavia, Pollo rebozado, Cebolla crujiente, Queso rallado, Bacon, Croutons, Salsa César
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Lechuga Batavia'), MD5('Ensalada César')),
(MD5('Pollo crujiente'), MD5('Ensalada César')),
(MD5('Cebolla crujiente'), MD5('Ensalada César')),
(MD5('Queso rallado'), MD5('Ensalada César')),
(MD5('Bacon'), MD5('Ensalada César')),
(MD5('Croutons'), MD5('Ensalada César')),
(MD5('Salsa César'), MD5('Ensalada César'));

-- Ensalada Santa Fé: Lechuga Batavia, Pollo rebozado, Tomate, Bacon, Tortilla de trigo, Salsa de mostaza y miel
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Lechuga Batavia'), MD5('Ensalada Santa Fé')),
(MD5('Pollo crujiente'), MD5('Ensalada Santa Fé')),
(MD5('Tomate'), MD5('Ensalada Santa Fé')),
(MD5('Bacon'), MD5('Ensalada Santa Fé')),
(MD5('Tortilla de trigo'), MD5('Ensalada Santa Fé')),
(MD5('Salsa de mostaza y miel'), MD5('Ensalada Santa Fé'));

-- Ensalada TGB: Lechuga Batavia, Zanahoria, Maíz, Bacon, Pollo a la parrilla, Tomate, Aros de cebolla, Salsa TGB
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Lechuga Batavia'), MD5('Ensalada TGB')),
(MD5('Zanahoria'), MD5('Ensalada TGB')),
(MD5('Maíz'), MD5('Ensalada TGB')),
(MD5('Bacon'), MD5('Ensalada TGB')),
(MD5('Pollo crujiente'), MD5('Ensalada TGB')),
(MD5('Tomate'), MD5('Ensalada TGB')),
(MD5('Aros de cebolla'), MD5('Ensalada TGB')),
(MD5('Salsa TGB'), MD5('Ensalada TGB'));

-- Ensalada de la huerta: Mezclum de lechugas, Maíz, Zanahoria, Tomate cherry, Cebolleta, Aceitunas, Aceite, Vinagre
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Mezclum de lechugas'), MD5('Ensalada de la huerta')),
(MD5('Maíz'), MD5('Ensalada de la huerta')),
(MD5('Zanahoria'), MD5('Ensalada de la huerta')),
(MD5('Tomate'), MD5('Ensalada de la huerta')),
(MD5('Cebolleta'), MD5('Ensalada de la huerta')),
(MD5('Aceitunas'), MD5('Ensalada de la huerta')),
(MD5('Aceite'), MD5('Ensalada de la huerta')),
(MD5('Vinagre'), MD5('Ensalada de la huerta'));

-- Aros de cebolla: Aros de cebolla
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Aros de cebolla'), MD5('Aros de cebolla'));

-- Patatas rizadas: Patatas rizadas
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Patatas rizadas'), MD5('Patatas rizadas'));

-- Patatas bastón: Patatas bastón
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Patatas bastón'), MD5('Patatas bastón'));

-- Patatas gajo: Patatas gajo
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Patatas gajo'), MD5('Patatas gajo'));

-- Nachos: Salsa cheddar, Chili con carne, Tomate en dados, Cebolleta, Jalapeños, Crema agria
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Salsa cheddar'), MD5('Nachos')),
(MD5('Chilli con carne'), MD5('Nachos')),
(MD5('Tomate'), MD5('Nachos')),
(MD5('Cebolleta'), MD5('Nachos')),
(MD5('Jalapeños'), MD5('Nachos')),
(MD5('Crema agria'), MD5('Nachos'));

-- Epic Chicken: Pollo rebozado, Salsa de mostaza y miel
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Pollo crujiente'), MD5('Epic Chicken')),
(MD5('Salsa de mostaza y miel'), MD5('Epic Chicken'));

-- Alitas de pollo: Alitas de pollo, Salsa Bourbon
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Alitas de pollo'), MD5('Alitas de pollo')),
(MD5('Salsa Bourbon'), MD5('Alitas de pollo'));

-- Helado Vainilla: Helado de vainilla
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Helado de vainilla'), MD5('Helado Vainilla'));

-- Contesa: Contesa
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Contesa'), MD5('Contesa'));

-- Tarta de zanahoria: Tarta de zanahoria
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Tarta de zanahoria'), MD5('Tarta de zanahoria'));

-- Yogurt: Yogurt
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Yogurt'), MD5('Yogurt'));

-- Agua: Agua
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Agua'), MD5('Agua'));

-- Coca cola: Coca cola
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Coca cola'), MD5('Coca cola'));

-- Cerveza: Cerveza
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Cerveza'), MD5('Cerveza'));

-- Calimocho: Calimocho
INSERT INTO INGRED_ART (ID_INGREDIENTE, ID_ARTICULO) VALUES
(MD5('Calimocho'), MD5('Calimocho'));

