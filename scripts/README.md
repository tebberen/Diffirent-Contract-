# Scripts

Dağıtım, doğrulama ve bakım senaryoları burada tutulur. Bu sürüm,
GitHub üzerindeki isim çatışmalarını çözerek tüm talimatları CeloModuleX
markasıyla hizalar.

## DeployMainHub.s.sol
- Foundry `forge script` komutu ile MainHub.sol sözleşmesini Celo Alfajores veya Base Sepolia'ya dağıtır.
- `PRIVATE_KEY` ve `RPC_URL` ortam değişkenlerini kullanarak yayın yapar.
- Çıktıda dağıtılan adresi yazdırır.

## deploy.sh
- Varsayılan olarak proje kökündeki `.env` dosyasını yükler ancak `ENV_FILE` değişkeni ile farklı ortam dosyaları seçilebilir.
- `PRIVATE_KEY`, `RPC_URL` ve opsiyonel `EXPLORER_API_KEY` değerlerini doğrular, `NETWORK` değişkenine göre `alfajores` veya `basesepolia` için zincir parametresi ekler.
- Explorer API anahtarı sağlanmışsa doğrulama bayraklarını otomatik ekler ve kullanılan `forge script` komutunu terminalde gösterir.
- Script çıktısı, dağıtımın CeloModuleX markasına ait olduğunu doğrulamak için MainHub sözleşmesindeki `PROJECT_NAME` sabitini
  takip eden downstream otomasyon adımlarına girdi olarak kullanılır.
