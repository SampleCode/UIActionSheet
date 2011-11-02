//
//  UIActionSheetTryViewController.m
//  UIActionSheetTry
//
//  Created by  on 2011/10/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIActionSheetTryViewController.h"

@implementation UIActionSheetTryViewController

-(void)callPhone1999{
    NSLog(@"call 1999");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:1999"]];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(IBAction)notifyPress:(id)sender{
    NSLog(@"notifyPressed");
    UIActionSheet *notifySheet = [[UIActionSheet alloc]initWithTitle:@"台北市老樹災害通報" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"撥打 1999 免付費電話" otherButtonTitles:@"發送mail給台北市政府", nil];
    [notifySheet showInView:self.view];
    [notifySheet release];
}

//請加在 LOTChapter02TreeDetailViewController.h
-(void)mailTo{
    NSLog(@"mail");
    //設定主旨 
    NSString *subject = @"保護樹木 民眾提報"; 
    //設定內文 
    NSString *text = @"樹木所在位置： 樹木所在位置： 您的姓名： 您的聯絡電話："; 
    //設定收件人的Email並帶入主旨與內文 
    NSString *url = [NSString stringWithFormat:@"mailto://iphone_developer@googlegroups.com?subject=%@&body=%@", subject, text]; 
    //重新格式化字串為UTF8 
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
    //直接寄送，不代入主旨及內文
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://iphone_developer@googlegroups.com"]];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"Button index:%i", buttonIndex);
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"callPhone");
            [self callPhone1999];
        break;
        case 1:
            NSLog(@"mailTo");
            [self mailTo];
        break;
    }
}



@end
