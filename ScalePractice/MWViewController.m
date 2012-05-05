//
//  MWViewController.m
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MWViewController.h"
#import "PracticeViewController.h"
#import "Grade.h"

@interface MWViewController ()

@end

@implementation MWViewController
- (NSMutableDictionary *)getDictionaryForPlist:(NSString *)fileName
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:plistPath];
}

-(void)buttonClicked:(id)sender
{
    NSMutableDictionary *plistData = [self getDictionaryForPlist:@"ABRSMGrade1Piano"];
    NSLog(@"%@", plistData);
    Grade *grade1 = [[Grade alloc] initWithNotes:[plistData objectForKey:@"Notes"] modes:[plistData objectForKey:@"Modes"] octaves:[plistData objectForKey:@"Octaves"] scaleTypes:[plistData objectForKey:@"Types"]];
    
    PracticeViewController *nextVC = [[PracticeViewController alloc] initWithGrade:grade1];
    [nextVC setTitle:[plistData objectForKey:@"Name"]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)viewDidLoad
{
    [self setTitle:@"Welcome"];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
