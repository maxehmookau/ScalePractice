#import <Foundation/Foundation.h>

@interface Grade : NSObject
{
    NSMutableArray *completed;
    NSArray *notes;
    NSArray *modes;
    NSArray *octaves;
    NSArray *scaleTypes;
}

-(id)initWithNotes:(NSArray *)theNotes modes:(NSArray *)theModes octaves:(NSArray *)theOctaves scaleTypes:(NSArray *)theScaleTypes;

-(NSDictionary *)getNextScale;

-(void)setScaleDoneAtIndex:(int)theIndex;
-(void)setScaleNotDoneAtIndex:(int)theIndex;
-(int)getNumberOfScales;

@property (nonatomic) NSMutableArray *completed;
@property (nonatomic) NSArray *notes;
@property (nonatomic) NSArray *modes;
@property (nonatomic) NSArray *octaves;
@property (nonatomic) NSArray *scaleTypes;
@end
