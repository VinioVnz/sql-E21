-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: diego
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `ordem` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Alimentos e Bebidas',1,0),(2,'Vestuário',1,1),(3,'Eletrônicos',1,2),(4,'Móveis e Decoração',1,3),(5,'Saúde e Bem-estar',1,4),(6,'Beleza e Cosméticos',1,5),(7,'Livros e Papelaria',1,6),(8,'Tecnologia e Informática',1,7),(9,'Casa e Jardim',1,8),(10,'Automóveis e Peças',1,9),(11,'Brinquedos e Jogos',1,0);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` char(14) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_enderecos`
--

DROP TABLE IF EXISTS `clientes_enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_enderecos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(150) NOT NULL,
  `numero` char(4) NOT NULL DEFAULT 'S/N',
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` char(2) NOT NULL,
  `cep` char(8) NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `clientes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientes` (`clientes_id`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_enderecos`
--

LOCK TABLES `clientes_enderecos` WRITE;
/*!40000 ALTER TABLE `clientes_enderecos` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios_funcoes`
--

DROP TABLE IF EXISTS `funcionarios_funcoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios_funcoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcao` varchar(50) NOT NULL,
  `cbo` char(7) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `funcionarios_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionarios` (`funcionarios_id`),
  CONSTRAINT `fk_funcionarios` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios_funcoes`
--

LOCK TABLES `funcionarios_funcoes` WRITE;
/*!40000 ALTER TABLE `funcionarios_funcoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios_funcoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` double NOT NULL DEFAULT '0',
  `nf` varchar(255) DEFAULT NULL,
  `clientes_id` int NOT NULL,
  `funcionarios_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pedidos_id_clientes_id` (`clientes_id`),
  KEY `idx_funcionarios` (`funcionarios_id`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_pedidos_funcionarios` FOREIGN KEY (`funcionarios_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_itens`
--

DROP TABLE IF EXISTS `pedidos_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_itens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto` varchar(150) NOT NULL,
  `quantidade` int NOT NULL,
  `valor` double NOT NULL,
  `pedidos_id` int NOT NULL,
  `clientes_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_itens` (`pedidos_id`),
  KEY `fk_clientes_itens` (`clientes_id`),
  CONSTRAINT `fk_clientes_itens` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_pedidos_itens` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_itens`
--

LOCK TABLES `pedidos_itens` WRITE;
/*!40000 ALTER TABLE `pedidos_itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `preco` double NOT NULL DEFAULT '0',
  `from_categorias` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Cerveja Artesanal','Cerveja de produção local, com 5% de álcool.',12.99,1),(2,'Tênis Esportivo','Tênis de corrida com solado antiderrapante e amortecimento.',199.99,2),(3,'Sofá de 3 Lugares','Sofá confortável para 3 pessoas, com tecido anti-rasgo.',899,4),(4,'Relógio Smart','Relógio inteligente com monitoramento de saúde e notificações.',299.99,6),(5,'Café Orgânico','Café em grãos orgânico, com sabor suave e aroma intenso.',25.5,1),(6,'Cadeira de Escritório','Cadeira ergonômica com ajuste de altura e encosto acolchoado.',350,4),(7,'Pelúcia de Urso','Urso de pelúcia macio de 50 cm de altura.',79.9,11),(8,'Óculos de Sol','Óculos de sol com proteção UV e estilo moderno.',120,6),(9,'Mochila Executiva','Mochila para laptop com compartimentos para acessórios.',250,9),(10,'Shampoo Anti-Caspa','Shampoo para controle de caspa e hidratação dos cabelos.',19.9,10),(11,'Vinho Tinto','Vinho tinto de 750 ml com aroma frutado e sabor encorpado.',39.9,1),(12,'Tábua de Queijos','Kit com 3 tipos de queijos, ideal para petiscos.',50,19),(13,'Tênis Casual','Tênis casual em couro com detalhes em tecido.',149.9,2),(14,'Camiseta Básica','Camiseta de algodão com modelo simples e confortável.',29.9,2),(15,'Cama Box','Cama box queen size, com colchão ortopédico e excelente conforto.',1200,4),(16,'Smartphone Android','Smartphone com tela de 6 polegadas e 64 GB de armazenamento.',999,6),(17,'Secador de Cabelos','Secador de cabelos com 2 níveis de temperatura e 3 velocidades.',149.9,10),(18,'Almofada Decorativa','Almofada de 40x40 cm com estampa moderna.',40,9),(19,'Câmera Fotográfica','Câmera DSLR com lente de 18-55mm e 24 MP.',2000,6),(20,'Fone de Ouvido Bluetooth','Fone de ouvido com cancelamento de ruído e bateria de longa duração.',180,6),(21,'Escova de Dentes Elétrica','Escova de dentes elétrica com 3 modos de escovação.',79.9,10),(22,'Barbecue Grill','Churrasqueira portátil para até 10 pessoas.',150,4),(23,'Cadeira de Praia','Cadeira reclinável de praia com suporte para copo.',99.9,9),(24,'Kit de Jardinagem','Kit básico para jardinagem, com ferramentas e sementes.',65,9),(25,'Carrinho de Bebê','Carrinho de bebê com sistema de reclinação e cinto de segurança.',650,11),(26,'Kit de Maquiagem','Kit de maquiagem com base, corretivo, batom e sombra.',99.9,10),(27,'Máscara de Cílios','Máscara para cílios com efeito volumoso e longa duração.',45,10),(28,'Console de Videogame','Console de última geração com 1 TB de armazenamento.',2499,6),(29,'Caminha para Cães','Cama confortável para cães de porte médio.',120,11),(30,'Tênis de Skate','Tênis específico para skate com solado antiderrapante.',180,2),(31,'Lentes de Contato','Lentes de contato coloridas para olhos castanhos.',60,10),(32,'Bolsa de Couro','Bolsa de couro legítimo com compartimentos internos.',350,2),(33,'Chá Verde','Chá verde orgânico, ideal para quem busca bem-estar.',15,1),(34,'Assadeira Antiaderente','Assadeira de 30 cm, com revestimento antiaderente.',45,4),(35,'Balde de Gelo','Balde de gelo de inox com capacidade para 2 litros.',70,4),(36,'Fralda Descartável','Pacote com 30 fraldas descartáveis para bebês.',45,11),(37,'Ar Condicionado','Ar condicionado portátil com capacidade para 12.000 BTUs.',1500,4),(38,'Pipoqueira Elétrica','Máquina de pipoca elétrica com capacidade de 1,5 litros.',100,4),(39,'Raquete de Tênis','Raquete de tênis de alta performance para iniciantes.',120,2),(40,'Cesta de Piquenique','Cesta de piquenique com espaço para 4 pessoas e acessórios.',90,9),(41,'Secadora de Roupas','Secadora de roupas compacta com 5 kg de capacidade.',899,4),(42,'Cadeira para Auto','Cadeira de segurança para carro para crianças até 10 anos.',220,11),(43,'Mixer de Mão','Mixer de mão com 5 velocidades e lâminas em inox.',120,4),(44,'Camiseta de Bandas','Camiseta com estampa de bandas famosas, de algodão.',40,2),(45,'Smartphone com Câmera 5G','Smartphone com câmera tripla de 108 MP e conectividade 5G.',1599,6),(46,'Pipoqueira Profissional','Máquina de pipoca com capacidade de 3 litros e sistema antiaderente.',150,4),(47,'Bolsa de Praia','Bolsa grande para praia, resistente à água, com alça ajustável.',45,9),(48,'Blender','Liquidificador com 6 lâminas de aço inox e 1,5 L de capacidade.',170,4),(49,'Tênis de Corrida','Tênis com amortecimento especial e solado ultra-leve.',230,2),(50,'Tênis Casual Masculino','Tênis casual masculino, perfeito para o dia a dia.',149,2),(51,'Saco de Dormir','Saco de dormir de inverno, com isolamento térmico de alta qualidade.',120,9),(52,'Camisa Polo','Camisa polo de algodão, confortável e versátil.',59.9,2),(53,'Chinelos de Dormir','Chinelos de dormir, confortáveis e estilosos.',35,2),(54,'Almofada de Pé','Almofada ortopédica para descanso dos pés após o trabalho.',50,9),(55,'Lentes de Sol','Lentes de sol com proteção UVA/UVB, design moderno.',70,6),(56,'Cesta de Café da Manhã','Cesta com pães, sucos e doces, ideal para presentear.',80,1),(57,'Mochila de Camping','Mochila de camping com capacidade para 40L, resistente à água.',170,9),(58,'Ar Condicionado Split','Ar condicionado split com tecnologia inverter e baixo consumo de energia.',1999,4),(59,'Cafeteira Elétrica','Cafeteira elétrica com sistema de café expresso.',150,1),(60,'Relógio de Pulso Masculino','Relógio masculino com pulseira de couro e estilo clássico.',250,6),(61,'Óculos de Grau','Óculos de grau com armação leve e confortável.',80,6),(62,'Mochila Escolar','Mochila escolar com compartimentos para notebooks e livros.',120,9),(63,'Calça Jeans','Calça jeans masculina, modelo slim, disponível em várias cores.',89.9,2),(64,'Camisa de Manga Longa','Camisa de manga longa, 100% algodão, confortável.',49.9,2);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07  8:11:04
