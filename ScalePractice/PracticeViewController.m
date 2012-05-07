//
//  PracticeViewController.m
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PracticeViewController.h"
#import "GradeListViewContoller.h"

@interface PracticeViewController ()

@end

@implementation PracticeViewController

-(id)initWithGrade:(Grade *)theGrade
{
    grade = theGrade;
    return [super init];
}

-(void)displayNewScale
{
    if([grade getNextScale] == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratuations!" message:@"You've completed all of the scales for this grade!" delegate:self cancelButtonTitle:@"Yay!" otherButtonTitles: nil];
        [alert show];
    }else{
        currentScale = [grade getNextScale];
        [noteName setText:[currentScale objectForKey:@"Note"]];
        [modeLabel setText:[currentScale objectForKey:@"Mode"]];
        [handsLabel setText:[currentScale objectForKey:@"Hands"]];
        [octaveLabel setText:[[currentScale objectForKey:@"Octaves"] stringByAppendingString:@" Octave"]];
        [typeLabel setText:[currentScale objectForKey:@"Type"]];
    }
}

-(void)tickPressed:(id)sender
{
    [grade setScaleDoneAtIndex:[[currentScale objectForKey:@"Index"]intValue]];
    [self displayNewScale];
}

-(void)crossPressed:(id)sender
{
    [grade setScaleNotDoneAtIndex:[[currentScale objectForKey:@"Index"]intValue]];
    [self displayNewScale];
}

-(void)showScaleList
{
    GradeListViewContoller *listVC = [[GradeListViewContoller alloc] initWithGrade:grade];
    [self presentModalViewController:listVC animated:YES];
}

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showScaleList)];
    [self displayNewScale];
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
