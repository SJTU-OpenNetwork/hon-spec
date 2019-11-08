# Thread

## 基本介绍
1. thread 是message（block）的哈希链，每个block可以是数据也可以指向一个IPFS数据节点。
2. threads 在多个account peer与非account peer之间自动同步
3. Cafe节点用于thread备份

## 关键技术
1. 向外推送更新
	1. 创建block描述新增消息
	2. 尝试直接发送给已知的接收者（```swarm connect```和```pubsub```)
		由于```pubsub```耗时严重，且```conncet```失败时主要原因是对方不在线，```pubsub```同样无法传送消息，故在hon中取消该方式。
	3. 对方不在线时将数据发送到cafe节点
2. 接收更新
	1. 更新可能是从cafe节点收到，也可能是从某个设备直连接收
	2. 根据thread持续更新，直到所有关联信息全部获取
	3. 更新可以快进合并
3. Account Thread
	1. 用于引导同账号其他peer创建或删除thread
4. thread快照
	1. （加密地）保存thread的metadata
	2. 一般存储于cafe节点
5. 数据同步
	1. 基于thread快照（snapshots）
	2. 通过thread search搜索account peer快照
	
## 存在问题