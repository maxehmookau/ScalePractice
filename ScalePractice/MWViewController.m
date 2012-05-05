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


-(void)buttonClicked:(id)sender
{
    
    NSArray *notes = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
    NSArray *modes = [NSArray arrayWithObjects:@"Major", @"Major", @"Minor", nil];
    NSArray *octaves = [NSArray arrayWithObjects:@"2", @"2", @"1", nil];
    NSArray *types = [NSArray arrayWithObjects:@"Scale", @"Scale", @"Arpeggio", nil];
    Grade *grade1 = [[Grade alloc] initWithNotes:notes modes:modes octaves:octaves scaleTypes:types];
    
    PracticeViewController *nextVC = [[PracticeViewController alloc] initWithGrade:grade1];
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
