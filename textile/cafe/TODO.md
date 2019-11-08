# TODO

1. 无Cafe节点应用正常运行
	- 将Cafe节点连接作为后台进程
	- 完善Cafe节点状态信息显示
	- Cafe节点成功连接后同步未备份数据

2. Cafe节点用户透明（Cafe节点自动选择）
	- sdk增加接口```FindCafes```，返回可连接Cafe列表，第一版采用固定Cafe地址
	- 应用调用```FindCafes```接口，获取Cafe节点```IP```以及```TOKEN```，尝试连接
	- 增加设备状态收集接口，完善```FindCafes```，实现分布式算法根据设备资源状况选举Cafe节点

3. 多Cafe节点数据备份

4. 集成测试
	1. 私有Cafe节点连接（私网方式）
	2. Cafe节点数据备份
	3. Cafe节点重连后数据备份
	4. Cafe节点选举
