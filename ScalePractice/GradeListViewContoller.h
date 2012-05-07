#import <UIKit/UIKit.h>
#import "Grade.h"

@interface GradeListViewContoller : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    Grade *grade;
}
-(id)initWithGrade:(Grade *)theGrade;
-(IBAction)doneButton:(id)sender;
-(IBAction)startAgain:(id)sender;
@end
