# CeloModuleX

Bu depo, CeloModuleX modüler sözleşme mimarisini ve ilişkili araçları barındırır.

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
- `NETWORK`: `alfajores` veya `basesepolia`. `deploy.sh` varsayılan olarak `alfajores` kullanır.

## Deploy Scriptini Çalıştırma
1. Ortam değişkenlerini shell ortamınıza yükleyin (`export $(cat .env | xargs)` gibi) ya da `direnv` kullanın.
2. `NETWORK` değişkeninizin hedef zinciri yansıttığından emin olun (`alfajores` veya `basesepolia`).
3. Aşağıdaki komutu çalıştırarak MainHub'ı dağıtın:
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

## Hızlı Deploy Scripti
`scripts/deploy.sh` dosyası yukarıdaki komutu otomatikleştirir ve `.env` içeriğini okuyarak eksik değişkenler için koruma sağlar:
```
./scripts/deploy.sh
```
Opsiyonel olarak tek seferlik farklı bir `.env` dosyası göstermek veya zincir seçmek için:
```
ENV_FILE=.env.staging NETWORK=basesepolia ./scripts/deploy.sh
```
Script, `.env` dosyanızı okuyup gerekli değişkenlerin tanımlı olduğunu doğrular, Explorer API anahtarı varsa doğrulamayı otomatik ekler ve kullanılan `forge script` komutunu çıktılar.

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
