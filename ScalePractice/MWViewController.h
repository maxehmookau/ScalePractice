//
//  MWViewController.h
//  ScalePractice
//
//  Created by Max Woolf on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAStoreFrontDelegate.h"

@interface MWViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UAStoreFrontDelegate>
{
    IBOutlet UITableView *table;
}


- (NSMutableDictionary *)getDictionaryForPlist:(NSString *)fileName;
-(void)loadShop;
@end
