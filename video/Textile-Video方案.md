# 增加视频支持方案

1.	视频meta上传thread
	```
	func (t *Thread) AddVideo(video *pb.Video) (mh.Multihash, error)
	```
2.	视频流化
	```
	ffmpeg -i $video -c copy -bsf:v h264_mp4toannexb -map 0 -f segment -segment_time 10 $path/%d.ts
	```

3.	安卓监听ts文件生成
	```
	public class VideoFileListener extends FileObserver {
			@Override  
	        public void onEvent(int event, String path) {          
		          switch(event) {    
			             case FileObserver.CLOSE:   
				                Log.d("CLOSE", "path:"+ path);   
				                break;   
		          }   
	        } 
	}
	```
4.	视频片meta上传ipfs，生成视频片哈希地址
	```
	ipfs.Publish(ts)
	```
5.	视频片meta上传cafe
	```
	Textile.instance().PublishVideo(ts)
	```
6.	对端通过thread获取视频meta
	```
	case pb.ThreadVideo
	```
7.	对端通过视频id获取视频片meta
	```
	Textile.search(v)
	```
8.	对端下载视频片
	```
	ipfs.DataAtPath(hash)
	```