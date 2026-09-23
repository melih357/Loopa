CREATE DATABASE IF NOT EXISTS loopa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE loopa;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS messages,item_requests,item_images,items,categories,users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(80) NOT NULL,
 email VARCHAR(160) NOT NULL UNIQUE,
 phone VARCHAR(30) DEFAULT '',
 password_hash VARCHAR(255) NOT NULL,
 city VARCHAR(80) DEFAULT 'İstanbul',
 district VARCHAR(80) DEFAULT '',
 latitude DECIMAL(10,7) DEFAULT 41.0082000,
 longitude DECIMAL(10,7) DEFAULT 28.9784000,
 trust_score TINYINT UNSIGNED DEFAULT 50,
 status ENUM('active','restricted','banned') DEFAULT 'active',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE categories (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(80) NOT NULL,
 slug VARCHAR(80) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE items (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 owner_id INT UNSIGNED NOT NULL,
 category_id INT UNSIGNED NULL,
 title VARCHAR(160) NOT NULL,
 description TEXT,
 sharing_type ENUM('donation','loan','trade','shared') NOT NULL,
 condition_status ENUM('like_new','very_good','used','flawed','repair','parts') DEFAULT 'used',
 latitude DECIMAL(10,7) NOT NULL,
 longitude DECIMAL(10,7) NOT NULL,
 approximate_location VARCHAR(160),
 delivery_method VARCHAR(100) DEFAULT 'Elden teslim',
 max_loan_days SMALLINT UNSIGNED DEFAULT 0,
 status ENUM('active','reserved','completed','removed') DEFAULT 'active',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_items_user FOREIGN KEY(owner_id) REFERENCES users(id) ON DELETE CASCADE,
 CONSTRAINT fk_items_cat FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB;
CREATE TABLE item_images (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 item_id INT UNSIGNED NOT NULL,
 file_path VARCHAR(255) NOT NULL,
 image_type VARCHAR(30) DEFAULT 'main',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE item_requests (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 item_id INT UNSIGNED NOT NULL,
 requester_id INT UNSIGNED NOT NULL,
 message TEXT,
 requested_start DATETIME NULL,
 requested_end DATETIME NULL,
 status ENUM('pending','accepted','rejected','cancelled','completed') DEFAULT 'pending',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE,
 FOREIGN KEY(requester_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE messages (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 request_id INT UNSIGNED NOT NULL,
 sender_id INT UNSIGNED NOT NULL,
 content TEXT NOT NULL,
 moderation_status ENUM('ok','flagged','hidden') DEFAULT 'ok',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(request_id) REFERENCES item_requests(id) ON DELETE CASCADE,
 FOREIGN KEY(sender_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
INSERT INTO categories(name,slug) VALUES
('Ev ve Yaşam','ev-yasam'),('El Aletleri','el-aletleri'),('Elektronik','elektronik'),('Kitap ve Eğitim','kitap-egitim'),('Bebek ve Çocuk','bebek-cocuk'),('Spor ve Kamp','spor-kamp'),('Hobi','hobi'),('Giyim','giyim'),('Taşınma Malzemeleri','tasinma');
INSERT INTO users(username,email,phone,password_hash,city,district,latitude,longitude,trust_score,status) VALUES
('Ayşe','ayse@loopa.local','5551112233','$2y$10$DkKfQJgtXgqHeP3m/rwczeX5Sdb8vE5pAaKahj0jvmIBUMp3afg7S','İstanbul','Kadıköy',40.9909000,29.0283000,92,'active'),
('Mert','mert@loopa.local','5553334455','$2y$10$DkKfQJgtXgqHeP3m/rwczeX5Sdb8vE5pAaKahj0jvmIBUMp3afg7S','İstanbul','Üsküdar',41.0257000,29.0158000,86,'active');
INSERT INTO items(owner_id,category_id,title,description,sharing_type,condition_status,latitude,longitude,approximate_location,delivery_method,max_loan_days,status) VALUES
(1,2,'Bosch Matkap','Çalışır durumda, şarj cihazı ve dört ucu bulunuyor. Hafta sonu kullanımı için uygundur.','loan','very_good',40.9928,29.0356,'Kadıköy, yaklaşık 1 km','Elden teslim',3,'active'),
(2,4,'Üniversite Ders Kitapları','İktisat ve işletme bölümü için beş kitap. Temiz durumdalar.','donation','used',41.0218,29.0147,'Üsküdar, yaklaşık 2 km','Ortak alan',0,'active'),
(1,6,'İki Kişilik Kamp Çadırı','Su geçirmiyor, yalnızca iki kez kullanıldı. Başka kamp ekipmanlarıyla takas düşünülebilir.','trade','very_good',40.9842,29.0521,'Fenerbahçe, yaklaşık 3 km','Elden teslim',0,'active');
