//
//  BGSViewController.m
//  BGSTextViewWithPlaceholder
//
//  Created by Peter Todd Air on 31/08/2014.
//  Copyright (c) 2014 Bright Green Star. All rights reserved.
//

#import "BGSViewController.h"
#import "BGSTextViewWithPlaceholder.h"

@interface BGSViewController ()
@property (weak, nonatomic) IBOutlet BGSTextViewWithPlaceholder *tvTest1;
@property (weak, nonatomic) IBOutlet BGSTextViewWithPlaceholder *tvTest2;
@property (weak, nonatomic) IBOutlet BGSTextViewWithPlaceholder *tvTest3;

@end

@implementation BGSViewController

-(void) loadView
{
    [super loadView];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // TEST 1
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"TEST LABEL but very long but very long but very long but very long but very long but very long ."];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(2,2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(7,1)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0] range:NSMakeRange(6, 2)];

    
    [self.tvTest1 setIntLines:3];

    [self.tvTest1 setStrPlaceholder:str];
    
    // Test 2 - size to fit
    [self.tvTest2 setSizeLblToFit:YES];
    [self.tvTest2 setStrPlaceholder:str];
    
    // Test 3 - use 4 lines
    [self.tvTest3 setIntLines:4];
    [self.tvTest3 setPosition:1];

    [self.tvTest3 setStrPlaceholder:str];
    // Center text



}

-(void)viewDidLayoutSubviews
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
