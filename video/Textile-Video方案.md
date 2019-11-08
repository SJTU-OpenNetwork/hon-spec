# 增加视频支持方案
> 通过ffmpeg视频切分，通过fileObserver监测文件生成，文件生成同时上传ipfs并更新cafe节点

1.	本地数据库存储视频信息, 并上传cafe节点
	```
	Textile.instance().videos.addVideo(video)
	Textile.instance().videos.publishVideo(video)
	```
2.	视频meta上传thread
	```
	Textile.instance().videos.threadAddVideo(threadId, videoId)
	```
3.	视频流化
	```
	ffmpeg -i $video -c copy -bsf:v h264_mp4toannexb -map 0 -f segment -segment_time 10 $path/%d.ts
	```

4.	安卓监听ts文件生成
	```
	public class VideoFileListener extends FileObserver {
			@Override  
	        public void onEvent(int event, String path) {          
		          switch(event) {    
			             case FileObserver.CLOSE:   
				                Log.d("CLOSE", "path:"+ path); 
				                hash = ipfs.Add(ts) // 新产生的ts文件上传ipfs
				                Textile.instance().videos.addVideoChunk(ts) //本地存储产生的ts文件信息
				                Textile.instance().videos.publishVideoChunk(ts)  //将ts文件信息上传cafe节点
				                break;   
		          }   
	        } 
	}
	```

5.	对端通过thread获取视频meta
	```
	case pb.ThreadVideo:
		//get video
	```
6.	对端通过视频id获取视频片meta
	```
	chunklist <- Textile.instance().videos.searchVideoChunks(query, options)
	```
7.	对端下载视频片
	```
	for chunk in chunklist {
		ipfs.Get(chunk.hash)
	}
	```

## API
| API  | 功能 | 参数 | 返回值 |
| ---- | ---- | ---- | ---- |
|getVideo|根据id获取Video结构体|String videoId|Video结构体|
|getVideoChunk|根据id获取VideoChunk结构体|String videoId, String chunk|VideoChunk结构体|
|addVideo|本地存储Video结构体|Video video|-|
|addVideoChunk|本地存储VideoChunk结构体|VideoChunk vchunk|-|
|publishVideo|Cafe存储Video结构体|Video video|-|
|publishVideoChunk|Cafe存储VideoChunk结构体|VideoChunk vchunk|-|
|threadAddVideo|发送视频到Thread|String threadId, String VideoId|-|
|searchVideoChunks|搜索视频块|VideoChunkQuery query, QueryOptions options|SearchHandle|
