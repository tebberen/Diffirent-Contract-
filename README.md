# Jello Modular Hub

Bu depo, Jello modüler sözleşme mimarisini ve ilişkili araçları barındırır.

## Gereksinimler
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Bir Celo Alfajores veya Base Sepolia RPC uç noktası
- Dağıtım için özel anahtar (testnet)

Kurulumdan sonra `forge --version` komutu ile doğrulayabilirsiniz.

## Bağımlılıkların Kurulması
```
forge install foundry-rs/forge-std --no-commit
```
Bu komut `forge-std` kitaplığını `lib/` dizinine ekler ve hem testlerde hem de deploy scriptinde kullanılır.

## Ortam Değişkenleri
`.env.example` dosyasını kopyalayarak doldurun:
```
cp .env.example .env
```
Sonrasında aşağıdaki değerleri ayarlayın:
- `PRIVATE_KEY`: 0x öneki bulunan testnet özel anahtarınız (harcama izni olduğundan emin olun).
- `RPC_URL`: Alfajores veya Base Sepolia RPC adresi.
- `EXPLORER_API_KEY`: CeloScan veya BaseScan API anahtarı (doğrulama için opsiyonel).

## Deploy Scriptini Çalıştırma
1. Ortam değişkenlerini shell ortamınıza yükleyin (`export $(cat .env | xargs)` gibi) ya da `direnv` kullanın.
2. Aşağıdaki komutu çalıştırarak MainHub'ı dağıtın:
```
forge script scripts/DeployMainHub.s.sol:DeployMainHub \
  --rpc-url $RPC_URL \
  --broadcast \
  --slow \
  --verify --etherscan-api-key $EXPLORER_API_KEY
```
- `--slow` yayınlanan işlemlerin Alfajores/Base Sepolia üzerinde madencilenmesini bekler.
- Doğrulama yapmak istemiyorsanız `--verify --etherscan-api-key` parametrelerini kaldırabilirsiniz.

Komut tamamlandığında konsol `MainHub deployed at <adres>` çıktısını üretir.

## Explorer Doğrulaması (Opsiyonel)
Eğer ayrı bir doğrulama yapmak isterseniz:
```
forge verify-contract \
  --chain alfajores \
  --etherscan-api-key $EXPLORER_API_KEY \
  <deployed_address> MainHub \
  --constructor-args ''
```
`--chain basesepolia` seçeneği ile Base Sepolia üzerinde de aynı işlemleri uygulayabilirsiniz.

## Scripts
`scripts/DeployMainHub.s.sol` dosyası Foundry Script formatında yazılmıştır ve ortam değişkenlerini okuyarak otomatik dağıtım gerçekleştirir.
