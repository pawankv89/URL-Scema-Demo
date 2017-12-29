//
//  ViewController.m
//  SendDetailsByURLScema
//
//  Created by Pawan kumar on 12/10/17.
//  Copyright © 2017 Pawan Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) IBOutlet UILabel *sendLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sendLabel.text = @"Hello My Name is Pawan Kumar Sharma!";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//showdetails

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

#pragma mark - Remove All Space and some char set in String
-(NSString*)stringByReplacingOccurrencesOfStringWithSet:(NSString*)phoneNumberString{
    
    NSMutableCharacterSet* set = [NSMutableCharacterSet whitespaceCharacterSet];
    [set addCharactersInString:@" -()+_"];
    NSMutableString * contactString = [phoneNumberString mutableCopy];
    NSRange range;
    while ((range = [contactString rangeOfCharacterFromSet:set]).location!=NSNotFound) {
        [contactString deleteCharactersInRange:range];
    }
    phoneNumberString = [NSString stringWithString:contactString];
    NSLog(@"phoneNumberString:- %@",phoneNumberString);
    return phoneNumberString;
}

@end
