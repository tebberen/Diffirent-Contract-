# CeloModuleX Module Categories & Types

> Not: Bu dokümandaki her kategori MainHub sözleşmesindeki
> `PROJECT_NAME` sabitiyle hizalanmıştır; yeni blueprint eklerken aynı
> isimlendirmeyi kullanın ki zincir üstü kayıtlar ile dokümantasyon
> birbirini doğrulasın.

## Canonical Categories
- **social** — GM, link paylaşımı, topluluk etkileşimi.
- **support** — bağış, tipping ve sponsorluk modülleri.
- **token** — fungible/NFT üretimi, ekonomiyi yöneten modüller.
- **rewards** — airdrop, claim, dağıtım mekanizmaları.
- **reputation** — badge, attestation, soulbound kayıtları.
- **governance** — oy verme, öneri yönetimi, yönetişim akışları.
- **infrastructure** — dağıtım, otomasyon ve DevOps görevleri.
- **access** — token gate, NFT pass kontrolü, erişim listeleri.
- **analytics** — metrik toplama, leaderboard, telemetri.

## Module Types
- **interaction** — kullanıcıların tek bir işlemle etkileşim kurduğu hafif modüller.
- **payment** — fon akışı ve ücret yönlendirmesi yapan modüller.
- **asset** — yeni token veya NFT ihraç eden modüller.
- **distribution** — merkle/allowlist tabanlı dağıtımlar.
- **attestation** — doğrulanabilir kimlik/başarı kayıtları.
- **voting** — oy verme ve sonuç toplama mantığı.
- **automation** — zincir üstü iş akışlarını tetikleyen araçlar.
- **registry** — veri/metadata saklayan indeksleyici modüller.
- **token-gate** — NFT/FT sahipliğini doğrulayan kapılar.
- **telemetry** — olay/istatistik kaydı tutan izleme modülleri.

## Gruplama Kuralları
1. **Kategori → Modül Tipi**: Her kategori bir veya daha fazla modül tipine bağlanır (örn. social kategori interaction + registry tiplerini içerir).
2. **Blueprint Paketleri**: Aynı kategoriye ait blueprintler `modules/blueprints/<category>/` altına gruplanabilir; JSON dosya adı modül tipini belirtir.
3. **Premium Etiketi**: Premium = true olan modüller, NFTAccessModule veya MainHub RBAC tarafından kısıtlanan gelişmiş özellikler sunar.
4. **Frontend Haritalaması**: Frontend kategori/typeları `constants/moduleCatalog.ts` içinde aynen kullanmalı ve API/ABI sözleşmelerine birebir denk gelmelidir.
5. **Versionlama**: Aynı modül tipinin major versiyon değişiklikleri, kategori klasörü altında `v2/` gibi alt dizinlerde saklanır.
