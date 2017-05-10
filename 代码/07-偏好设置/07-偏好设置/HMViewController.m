/*
 
 
 */

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController
- (IBAction)save:(id)sender {
    
    // [NSUserDefaults standardUserDefaults]可以直接操作偏好设置文件夹
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 自动帮我们生成一个plist文件存放在偏好设置的文件夹
    [defaults setObject:@"hm" forKey:@"account"];
    
    // 同步：把内存中的数据和沙盒同步
    [defaults synchronize];
    
}
- (IBAction)read:(id)sender {
    // [NSUserDefaults standardUserDefaults]可以直接操作偏好设置文件夹
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

   NSLog(@"%@",[defaults objectForKey:@"account"]);
    
//    NSDictionary *dict = @{@"account":@"hm"};
//    
//    dict writeToFile:<#(NSString *)#> atomically:<#(BOOL)#>
    
}

/*
    偏好设置的好处
    不用关心文件名
    快速进行键值对存储的时候用偏好设置
 
 
 */

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
