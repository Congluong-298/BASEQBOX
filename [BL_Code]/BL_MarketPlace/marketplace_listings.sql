CREATE TABLE IF NOT EXISTS `marketplace_listings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `seller_name` VARCHAR(100) DEFAULT 'Người bán',
    `item_name` VARCHAR(50) NOT NULL,
    `item_label` VARCHAR(100) NOT NULL,
    `quantity` INT NOT NULL,
    `price` INT NOT NULL,
    `metadata` LONGTEXT DEFAULT '{}',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `marketplace_favorites` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `citizenid` VARCHAR(50) NOT NULL,
    `item_name` VARCHAR(50) NOT NULL,
    UNIQUE KEY `unique_fav` (`citizenid`, `item_name`)
);