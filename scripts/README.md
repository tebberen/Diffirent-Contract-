# Scripts

Dağıtım, doğrulama ve bakım senaryoları burada tutulur.

## DeployMainHub.s.sol
- Foundry `forge script` komutu ile MainHub.sol sözleşmesini Celo Alfajores veya Base Sepolia'ya dağıtır.
- `PRIVATE_KEY` ve `RPC_URL` ortam değişkenlerini kullanarak yayın yapar.
- Çıktıda dağıtılan adresi yazdırır.

## deploy.sh
- `.env` dosyanızdaki değişkenleri yükleyip `forge script` komutunu hazırlar.
- Explorer API anahtarı sağlanmışsa doğrulama bayraklarını otomatik ekler.
- Kullandığı komutu terminalde göstererek manuel müdahaleye gerek bırakmaz.
