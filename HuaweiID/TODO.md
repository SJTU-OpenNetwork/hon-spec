# TODO

1. 添加华为账号SDK - *已完成*

2. 构建华为登陆界面

3. 根据华为ID生成助记词
    ```
	OpenID 补偿到32倍数 （140 -> 160), 生成entropy
	mnemonic, err := bip39.NewMnemonic(entropy)
	```
4. 根据助记词创建wallet
	```
	&Wallet{RecoveryPhrase: mnemonic}
	```
5. 集成测试
