CREATE TABLE IF NOT EXISTS `BL_Clothes_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `componentNumber` int NOT NULL,
  `prop` tinyint(1) NOT NULL,
  `price` int NOT NULL,
  `clothes_index` json NOT NULL,
  `sex` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `BL_Clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `clothes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`clothes`)),
  `name` varchar(255) NOT NULL,
  `male` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
