# Jello Kuralları Analizi (TR)

## Eksik veya Belirsiz Noktalar
1. **Modül metadata boşluğu** – `Module` yapısı yalnızca adres, kategori, tip, premium ve versiyon saklıyor; isim/açıklama gibi metadata hâlâ frontend sabitlerine kalıyor ve zincir dışı kaynakla eşleşme riski var.
2. **Leaderboard verilerinin kalıcılığı** – Günlük sayaçlar tanımlanmış olsa da haftalık/aylık tabloların on-chain veya arka uçta nasıl tutulacağı belirsiz.
3. **Dağıtım rehberinde doğrulama adımı yok** – Sıra çok net olsa da explorer doğrulaması, `.env` yönetimi, rollback veya tekrar deploy prosedürleri tarif edilmemiş.
4. **Entegrasyon ön hazırlığı boş** – Celo AI, Talent Protocol ve Self XYZ için API URL, auth veya webhook bilgileri toplanmamış durumda.
5. **NFT ekonomisi parametreleri eksik** – Dinamik fiyat tablosu var fakat arz limiti, transfer politikası, telif ücreti veya kilitlenme mantığı belirtilmemiş.
6. **Gelişmiş güvenlik/QA kapsamı yok** – Test planı fonksiyonel senaryoları kapsıyor fakat fuzzing, invariant, reentrancy veya multi-chain replay testleri listede yer almıyor.
7. **Hazırlık checklist’i tamamlanmamış** – Proje tanımı, kategori listeleri, blueprint dokümanları gibi "hazırlanacak" işaretli maddeler hâlâ boş duruyor.

## Önerilen İyileştirmeler
1. **Modül kaydına metadata ekleyin** – `bytes32 nameHash`, `string uri` ve `uint32 usageCount` gibi alanlar ile event’leri zenginleştirin; frontend sabitlerini zincirle hizalamak kolaylaşır.
2. **On-chain leaderboard snapshot’ı** – `LeaderboardEpoch` kayıtları ve planlanan cron modülleriyle günlük sayaçları haftalık/aylık tablolara devredin; veriler deterministik olur.
3. **Otomatik deploy + doğrulama** – Celo/Base script’lerine explorer API anahtarları, doğrulama çağrıları, manifest çıktıları ve rollback yönergeleri ekleyin.
4. **Entegrasyon kayıt defteri** – `integrations/README.md` altında her servis için taban URL, auth, test anahtarı ve hangi modüllerin kullandığını listeleyin.
5. **NFT politika belgesi** – Arz limiti, ikincil satış komisyonu, staking/kilit ve köprüleme stratejilerini NFT belgelerine ekleyerek ekonomik netlik sağlayın.
6. **Gelişmiş QA & güvenlik** – Slither, Foundry fuzz/invariant, çok zincirli fork testleri, NFT fiyat manipülasyon ve fee çekme senaryolarını QA planına ekleyin.
7. **Hazırlık dokümanlarını tamamlayın** – Modül/kategori referansları, kullanıcı akış diyagramı, Codex paketleri ve blueprint’leri bitirip repositoriye ekleyin.

## Ayrıntılı Görev Listesi
1. **Repo ve klasör yapısı** – `contracts/`, `modules/blueprints/`, `frontend/`, `scripts/`, `docs/` klasörlerini oluşturun; UI bileşenleri ve servis dosyalarını önceden hazırlayın.
2. **Codex + Cursor entegrasyonu** – Blueprint’leri `modules/blueprints/` altında sürümlendirin, Codex prompt paketini hazırlayın, Cursor görevlerini blueprint → kontrat zinciriyle eşleyin.
3. **Akıllı kontrat geliştirme akışı** – `MainHub.sol`, `NFTAccessPass.sol` ve komisyon mantığını dokümanlardaki gereksinimlere göre uygulayın; RBAC ve event setlerini tamamlayın.
4. **Modül kayıt sistemi** – `registerModule`, aktivasyon, `getModulesByCategory` ve 50 modülün kendi kontratlarını modül şablonuna göre uygulayın; blueprint eşleşmesini kaydedin.
5. **Veri & leaderboard katmanı** – `dailyActions`, `moduleActions`, `updateScore`, `UserStatsUpdated`/`GlobalStatsUpdated` event’leri ve opsiyonel backend snapshot görevlerini kurun.
6. **Frontend entegrasyonu** – `constants.js`, `contractService.js`, React sayfaları ve hook katmanlarını planla; adresler deploy sonrası güncellenecek.
7. **Dağıtım adımları** – NFT → MainHub → Modüller → register → constants.js sırasını izleyin; Celo/Base script’lerine doğrulama ve log üretimi ekleyin.
8. **Test ve debugging** – QA planındaki kontrat, modül ve frontend testlerini çalıştırın; ek olarak otomasyon, fuzz/invariant ve senaryo testleri yazın.
9. **Güvenlik incelemeleri** – Slither raporları, reentrancy kontrolleri, fee withdraw ve NFT fiyat güncellemesi için formal testler; modül kod gözden geçirmeleri.
10. **Launch öncesi/sonrası** – Belgeleri finalize edin, entegrasyon bilgilerini doldurun, QA regression yapın, dağıtım sonrası explorer doğrulaması + manifest yayınlayın, operasyonel izleme kurun.
