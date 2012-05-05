//
//  PracticeViewController.h
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Grade.h"
@interface PracticeViewController : UIViewController
{
    Grade *grade;
    IBOutlet UILabel *noteName;
    IBOutlet UILabel *modeLabel;
    IBOutlet UILabel *octaveLabel;
    IBOutlet UILabel *typeLabel;
    NSDictionary *currentScale;
}

-(id)initWithGrade:(Grade *)theGrade;
-(void)displayNewScale;
-(IBAction)tickPressed:(id)sender;
-(IBAction)crossPressed:(id)sender;
-(void)showScaleList;
@end
