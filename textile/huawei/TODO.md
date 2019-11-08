# TODO

1. 添加华为账号SDK - *已完成*

2. 构建华为登陆界面 - *已完成*

3. 根据华为ID生成助记词 - *已完成*
    ```
	OpenID 利用SHA256 生成256位entropy
	mnemonic, err := bip39.NewMnemonic(entropy)
	```
4. 根据助记词创建wallet - *已完成*
	```
	&Wallet{RecoveryPhrase: mnemonic}
	```
5. 集成测试 - *已完成*
