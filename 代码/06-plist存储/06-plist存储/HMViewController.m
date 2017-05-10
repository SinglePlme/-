
#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController
// 当点点击保存的时候调用
- (IBAction)save:(id)sender {
    // 获取沙盒的根路径
//    NSString *home = NSHomeDirectory();
    
    // 拼接Documents路径
//    NSString *docPath = [home stringByAppendingString:@"/Documents"];
//    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    
    
    /**
     *  NSDocumentDirectory : 查找Documents文件夹
        NSUserDomainMask ： 在用户的应用程序下查找
     YES 把路径展开 NO 当前应用的根路径 == ~ 
     NO  ~/Documents

     */
    NSString *docPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",docPath);
    
    // 拼接文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
    // 只有具备writeToFile:的对象才能使用plist存储，NSArray
    NSArray *array = @[@1,@2,@"123"];
    
    [array writeToFile:filePath atomically:YES];
    
//    NSLog(@"%@",docPath);
    
    
    
}

//当点击读取的时候调用
- (IBAction)read:(id)sender {
    NSString *docPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",docPath);
    
    // 拼接文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    
   NSArray *data = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",data);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
