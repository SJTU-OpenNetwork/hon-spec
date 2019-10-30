# 群组管理功能

## 目标

1. 实现管理员角色，创建者本身是管理员
2. 管理员可以指定管理员，删除群组成员

## 实现
> 以下实现修改了datastore中的数据存储结构，导致无法与之前版本repo不兼容

1. `datastore`中`ThreadPeer`增加`admin`属性，0/1 bool *已完成*
2. 增加相应修改接口 *已完成* 
	```
	// Admins returns locally known admins in this thread
	func (t *Thread) Admins() []pb.ThreadPeer {
    	return t.datastore.ThreadPeers().ListAdminByThread(t.id)
	}

	// NonAdmins returns locally known none-admins in this thread
	func (t *Thread) NonAdmins() []pb.ThreadPeer {
    	return t.datastore.ThreadPeers().ListNonAdminByThread(t.id)
	}

	```
3. 增加protobuf消息传递接口，标识管理员增加事件 *已完成*
4. 增加新增管理员事件响应函数 *已完成*
5. 增加新增管理员发起接口 *已完成*
6. SDK中实现对应接口 *已完成*
	```
	```
7. 测试