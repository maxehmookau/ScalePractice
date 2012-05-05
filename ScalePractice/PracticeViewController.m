//
//  PracticeViewController.m
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PracticeViewController.h"

@interface PracticeViewController ()

@end

@implementation PracticeViewController

-(id)initWithGrade:(Grade *)theGrade
{
    grade = theGrade;
    currentScale = [grade getNextScale];
    
    return [super init];
}

- (void)viewDidLoad
{
    [noteName setText:[currentScale objectForKey:@"Note"]];
    [modeLabel setText:[currentScale objectForKey:@"Mode"]];
    [octaveLabel setText:[[currentScale objectForKey:@"Octaves"] stringByAppendingString:@" Octaves"]];
    [typeLabel setText:[currentScale objectForKey:@"Type"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
