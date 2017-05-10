/* 

    袁峥 阿峥 
  私人通讯录学习目的：控制器之间的跳转，传值，存储。
 
 1.登录界面
 知识点：(控制器之间的跳转)
 程序演示
 搭建程序框架，完善登录界面，联系人界面
 
 2.登录细节
 控制登录按钮状态，监听文本框的文字改变
 3种监听方式
 登录界面和联系人界面跳转
 开关细节处理
 注销功能
 
 3.登录功能:
 知识点：(控制器之间的跳转，segue的类型,MBProgressHud)
 1> 拖线的操作引出segue的类型
 2> 需要判断，手动执行segue
 3> 比较耗时的操作搞个蒙版

 4.联系人界面
 知识点：(顺传：控制器之间的传值，需要把登录的账号传给联系人控制器，prepareForSegue)
 设置联系人控制器上的标题。
 
 5.添加界面(知识点：第一响应者，回传:控制器之间的传值,代理，MVC)
 控制器添加按钮状态，自动弹出键盘
 点击添加，回到联系人界面，并且将数据传给联系人控制器。
 代理传模型。
 
 6.联系人列表界面
 实现数据源的方法，刷新表格
 cell右边箭头：表示这一行可以跳转
 
 7.搭建编辑界面
 知识点：(选中cell跳转，cell从storyboard加载原理，顺传，回传)
 界面+cell跳转+从storyboard加载cell+顺传+控制器视图懒加载
 编辑按钮
 保存操作+控制器保存按钮状态+回传
 细节注意：
 1> 从storyboard的cell跳转，必须用storyboard的cell才会执行segue
 2> cell跳转：判断目标控制器
 3> 控制器的视图是懒加载的，跳转之前，给子控件设置内容没用
 4> 保存操作：更新传递过来的数据，刷新表格。
 
 8.自定义分割线
 知识点：（要想控制分割线显示，必须自定义cell，自己管理）
 系统的分割线样式不要，自定义cell控制分割线。
 在awakeFromNib设置分割线的位置，不准确。
 在layoutSubviews设置分割线的位置。
 
 9.plist文件存储
 PPT讲讲数据存储的几种方式
 数据存储的2个操作：存储和读取
 Documents路径获取方式：直接拷贝，NSHomeDirectory(),NSDocumentDirectory
 plist存储有条件:只有具备writeToFile的对象才能用plist存储
 自定义对象用plist存储失败
 tmp:NSTemporaryDirectory()
 Cache:NSCachesDirectory
 
 10.偏好设置
 偏好设置的作用
 偏好设置的好处：不需要关心文件名，快速存储键值对
 NSUserDefaults直接操作偏好设置的文件夹。
 同步：默认不及时存储
 
 11.自定义对象归档
 NSKeyedUnArchiver
 NSCoding
 [super initWithCoder:aDecoder]什么时候调用
 自定义View，解档。
 自定义Student，归档，解档。

 */