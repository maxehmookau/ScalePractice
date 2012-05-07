//
//  GradeListViewContoller.m
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GradeListViewContoller.h"

@interface GradeListViewContoller ()

@end

@implementation GradeListViewContoller

-(void)doneButton:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)startAgain:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    [grade startAgain];
}

-(id)initWithGrade:(Grade *)theGrade
{
    grade = theGrade;
    return [super init];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [grade getNumberOfScales];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    [cell.textLabel setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [[grade notes]objectAtIndex:indexPath.row], [[grade modes]objectAtIndex:indexPath.row]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ Octave %@ - %@", [[grade octaves]objectAtIndex:indexPath.row], [[grade scaleTypes]objectAtIndex:indexPath.row], [[grade hands]objectAtIndex:indexPath.row]]];
    if([[[grade completed]objectAtIndex:indexPath.row]isEqualToString:@"1"])
    {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[[grade completed]objectAtIndex:indexPath.row] isEqualToString:@"1"])
    {
        [[grade completed]replaceObjectAtIndex:indexPath.row withObject:@"0"];
    }else{
        [[grade completed]replaceObjectAtIndex:indexPath.row withObject:@"1"];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewDidLoad
{
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
