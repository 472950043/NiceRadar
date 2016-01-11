# NiceRadar
一个简单漂亮的雷达扫描效果（A simple and beautiful radar scanning effect）
开发环境Xcode 7.2 (7C68) + iOS SDK 9.2 (13C75) + Swift 2.1  

支持系统iOS7+  

支持设备iPhone4s+  

## 快速集成，仅需三步：  
第一步：
	
	导入RadarView文件夹到你的工程

第二步：
	
	//创建一个niceRadar并指定其frame
    var niceRadar: Radar!
	niceRadar = Radar.instanceRadar()
	niceRadar.frame = radar.bounds
	
第三步：
	
	//把它加入任意的UIView到中
    @IBOutlet var radar: UIView!
	radar.addSubview(niceRadar)
	
## 可按照自己需求定制：

	雷达圆圈背景颜色
    雷达上波纹的条数
    雷达扫描的时间
    用storyboard或者xib展现
    
###### 默认效果展示：  
![效果图1](https://raw.githubusercontent.com/472950043/NiceRadar/master/效果图.png)