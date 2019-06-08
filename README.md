
URL Scema Demo
=========

## URL Scema Demo.
------------
 Added Some screens here.
 
![](https://github.com/pawankv89/URLScemaDemo/blob/master/Screens/1.png)
![](https://github.com/pawankv89/URLScemaDemo/blob/master/Screens/2.png)

## Usage
------------
 iOS 9 Demo showing how to droodown on iPhone X Simulator in  Objective-C.


```objective-c

SendDetailsByURLScema

- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

self.sendLabel.text = @"Hello My Name is Pawan Kumar Sharma!";
}

-(IBAction)sendDetailsButton:(id)sender{

NSString *sendText = [NSString stringWithFormat:@"showdetails://%@",self.sendLabel.text];
sendText = [sendText stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

// open the Show Details By URLScema App
if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:sendText]]) {

NSLog(@"Send message");

}else{

NSLog(@"App Not Installed");
}
}

```

```objective-c

ShowDetailsByURLSchema

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
if (url != nil && [url isFileURL]) {
// Handle file being passed in

}else
{
// Handle custom URL scheme
[self handleCustomOpenURL:url];
}
return YES;
}

//Please note: This method is deprecated. It's added here for backward compatibility
-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {

if (url != nil && [url isFileURL]) {
// Handle file being passed in

}else
{
// Handle custom URL scheme
[self handleCustomOpenURL:url];
}
return YES;
}

- (void)handleCustomOpenURL:(NSURL *)url {

NSLog(@"url:-> %@",url);
NSString *file = [NSString stringWithFormat:@"%@",url];
file  = [file stringByReplacingOccurrencesOfString:@"showdetails://" withString:@""];
file  = [file stringByReplacingOccurrencesOfString:@"%20" withString:@" "];

[[NSNotificationCenter defaultCenter] postNotificationName:@"handleOpenURL"
object:nil
userInfo:@{@"File" : file}];
}


- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

self.showDetailsByURLScemaLabel.text = @"";

//handleOpenURL
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSourceOpenURL:) name:@"handleOpenURL" object:nil];
}


- (void)didReceiveMemoryWarning {
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{


}

-(void)handleSourceOpenURL:(NSNotification *)notification{

// Get the session, state and error values from the notification's userInfo dictionary.
NSDictionary *userInfo = [notification userInfo];
//NSLog(@"user Info NSNotification %@",userInfo);
NSString *file = [userInfo valueForKey:@"File"];

if (file) {

self.showDetailsByURLScemaLabel.text = file;
}
}


```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
