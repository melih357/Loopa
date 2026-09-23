# Loopa — WAMP Kurulum Paketi

Loopa, kullanılmayan eşyaları yakın çevrede **bağış**, **ödünç**, **takas** veya **ortak kullanım** yoluyla yeniden dolaşıma sokan harita tabanlı bir paylaşım prototipidir.

## Klasör yapısı

- `backend/` PHP API ve MySQL bağlantısı
- `frontend/` kullanıcı arayüzü
- `frontend/assets/` tasarım, JavaScript, logo ve marka panoları
- `uploads/` yüklenen eşya ve profil görselleri
- `.env` veritabanı ayarları
- `database.sql` ilk kurulum veritabanı
- `migration.sql` sonraki şema eklemeleri

## WAMP kurulumu

1. ZIP dosyasını çıkarın.
2. Çıkan `Loopa` klasörünü WAMP içindeki `www` klasörüne kopyalayın.
   - Genellikle: `C:\wamp64\www\Loopa`
3. WAMP Server'ı başlatın. Apache ve MySQL servislerinin yeşil olduğundan emin olun.
4. Tarayıcıdan `http://localhost/phpmyadmin/` adresini açın.
5. **İçe Aktar / Import** bölümünden önce `database.sql` dosyasını çalıştırın.
6. Gerekirse `.env` dosyasındaki veritabanı bilgilerini düzenleyin. Standart WAMP kurulumu için:
   - DB_NAME=`loopa`
   - DB_USER=`root`
   - DB_PASS boş
7. Uygulamayı Chrome'da açın:

   `http://localhost/Loopa/frontend/`

## Test kullanıcıları

Örnek kullanıcıların şifre hash'i demo amaçlıdır. En sorunsuz test için arayüzde **Kayıt Ol** seçeneğinden iki ayrı hesap oluşturun.

## Hızlı test senaryosu

1. Birinci hesapla kayıt olun.
2. **Eşya Ekle** bölümünden fotoğraflı ilan yayınlayın.
3. Çıkış yapıp ikinci hesapla giriş yapın.
4. Haritadaki ilana tıklayıp talep gönderin.
5. Birinci hesapla tekrar giriş yapıp **Taleplerim** bölümünden talebi kabul edin.
6. Her iki kullanıcı da kabul edilen talep üzerinden mesajlaşmayı test edebilir.

## Önemli notlar

- Harita için Leaflet ve OpenStreetMap CDN kullanılır; internet bağlantısı gerekir.
- Kesin ev adresi gösterilmez, yalnızca yaklaşık konum tutulur.
- Bu paket yerel MVP/prototip içindir. Canlı kullanımda CSRF koruması, e-posta/SMS doğrulama, gelişmiş dosya güvenliği, moderasyon ve HTTPS eklenmelidir.
- `uploads/items` klasörü Apache tarafından yazılabilir olmalıdır.
