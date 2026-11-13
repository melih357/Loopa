<div align="center">

![Loopa GitHub banner](docs/assets/loopa-github-banner.png)

# Loopa — Yakın Çevrede Eşya Paylaşım Platformu

**Kullanmadığın eşya, bir başkasına fayda.**

Yakındaki kişilerin kullanılmayan eşyaları **bağış**, **ödünç verme**, **takas** ve **ortak kullanım** yoluyla paylaşabilmesini amaçlayan harita tabanlı bir web uygulaması.

`PHP` · `MySQL` · `JavaScript` · `Leaflet` · `OpenStreetMap` · `WAMP`

[GitHub Profili](https://github.com/melih357) · [LinkedIn](https://www.linkedin.com/in/melihefeercan/)

</div>

---

## Proje hakkında

Loopa, yakın çevredeki kullanılmayan eşyaları yeniden değerlendirmeyi kolaylaştırmak için geliştirilmiş **yerel MVP / prototip** projesidir. Kullanıcılar ilan oluşturabilir, haritadan ilanları inceleyebilir, talep gönderebilir ve kabul edilen talepler üzerinden mesajlaşmayı deneyebilir.

## Özellikler

- Fotoğrafla eşya ilanı oluşturma
- Bağış, ödünç, takas veya ortak kullanım seçenekleri
- Leaflet ve OpenStreetMap tabanlı ilan haritası
- Kullanıcı hesapları ve eşya talepleri
- Talep kabulü sonrasında mesajlaşma
- Tam ev adresi yerine yaklaşık konum yaklaşımı

## Teknik yapı

| Bileşen | Teknoloji |
| --- | --- |
| Sunucu | PHP |
| Veritabanı | MySQL |
| Arayüz | HTML, CSS, JavaScript |
| Harita | Leaflet / OpenStreetMap CDN |
| Yerel ortam | WAMP |

## Yerel kurulum (WAMP)

1. Projeyi `C:\wamp64\www\Loopa` klasörüne yerleştirin.
2. WAMP ile Apache ve MySQL servislerini çalıştırın.
3. `http://localhost/phpmyadmin/` adresinden veritabanını oluşturun ve **`database.sql`** dosyasını içe aktarın.
4. Kendi bilgisayarınızda `.env` içindeki veritabanı ayarlarını düzenleyin. Gerçek `.env` dosyasını GitHub'a yüklemeyin.
5. Uygulamayı `http://localhost/Loopa/frontend/` adresinde açın.
6. Mevcut kurulum sonrası gerektiğinde `migration.sql` içeriğinin uygulanıp uygulanmadığını kontrol edin; veritabanına körlemesine ikinci kez uygulamayın.

### Hızlı test

1. İki farklı test hesabı oluşturun.
2. İlk hesapla fotoğraflı eşya ilanı ekleyin.
3. İkinci hesapla haritadan ilana girip talep gönderin.
4. İlk hesapla talebi kabul edin.
5. Kabul sonrasında mesajlaşmayı sınayın.

> Harita bileşenleri CDN kullandığından internet gerekir. `uploads/items` klasörünün sunucu tarafından yazılabilir olması gerekir.

## Proje durumu ve güvenlik

**Durum: Yerel geliştirme / MVP.** Bu depo üretim ortamında güvenli kullanım için hazır olduğu iddiasında değildir. Canlı kullanımdan önce CSRF koruması, e-posta/SMS doğrulama, dosya yükleme güvenliği, moderasyon, HTTPS ve diğer güvenlik kontrolleri tamamlanmalıdır.

**Gizli dosyalar:** Gerçek `.env` dosyası, API anahtarları ve gerçek kullanıcı dosyaları repoya eklenmemelidir.

## Geliştirici

**Melih Efe Ercan** · [GitHub](https://github.com/melih357) · [LinkedIn](https://www.linkedin.com/in/melihefeercan/)
