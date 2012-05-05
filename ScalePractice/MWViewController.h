//
//  MWViewController.h
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWViewController : UIViewController


-(IBAction)buttonClicked:(id)sender;
- (NSMutableDictionary *)getDictionaryForPlist:(NSString *)fileName;
@end
