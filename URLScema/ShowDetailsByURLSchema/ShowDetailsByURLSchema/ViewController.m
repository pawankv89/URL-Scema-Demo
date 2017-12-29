//
//  ViewController.m
//  ShowDetailsByURLSchema
//
//  Created by Pawan kumar on 12/10/17.
//  Copyright © 2017 Pawan Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) IBOutlet UILabel *showDetailsByURLScemaLabel;

@end

@implementation ViewController

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

@end
