USE loopa;
-- İleride mevcut kurulumlara uygulanacak örnek migration dosyası.
ALTER TABLE users ADD COLUMN IF NOT EXISTS avatar VARCHAR(255) NULL AFTER phone;
ALTER TABLE items ADD COLUMN IF NOT EXISTS available_today TINYINT(1) NOT NULL DEFAULT 1 AFTER max_loan_days;
CREATE TABLE IF NOT EXISTS reviews (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 request_id INT UNSIGNED NOT NULL,
 reviewer_id INT UNSIGNED NOT NULL,
 reviewed_user_id INT UNSIGNED NOT NULL,
 rating TINYINT UNSIGNED NOT NULL,
 comment VARCHAR(500),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(request_id) REFERENCES item_requests(id) ON DELETE CASCADE,
 FOREIGN KEY(reviewer_id) REFERENCES users(id) ON DELETE CASCADE,
 FOREIGN KEY(reviewed_user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
