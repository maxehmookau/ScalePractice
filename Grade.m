#import "Grade.h"
#include <stdlib.h>

@implementation Grade
-(id)initWithNotes:(NSArray *)theNotes modes:(NSArray *)theModes octaves:(NSArray *)theOctaves scaleTypes:(NSArray *)theScaleTypes
{
    notes = theNotes;
    modes = theModes;
    octaves = theOctaves;
    scaleTypes = theScaleTypes;
    completed = [[NSMutableArray alloc] init];
    for(int x = 0; x < [notes count]; x++)
    {
        [completed addObject:@"0"];
    }
    return [super init];
}

-(NSDictionary *)getNextScale
{
    int randomNumber = arc4random() % [notes count];
    NSMutableDictionary *scale = [[NSMutableDictionary alloc] init];
    [scale setValue:[notes objectAtIndex:randomNumber] forKey:@"Note"];
    [scale setValue:[modes objectAtIndex:randomNumber] forKey:@"Mode"];
    [scale setValue:[octaves objectAtIndex:randomNumber] forKey:@"Octaves"];
    [scale setValue:[scaleTypes objectAtIndex:randomNumber] forKey:@"Type"];
    return scale;
}

-(void)setScaleDoneAtIndex:(int)theIndex
{
    [completed replaceObjectAtIndex:theIndex withObject:@"1"];
}

-(void)setScaleNotDoneAtIndex:(int)theIndex
{
    [completed replaceObjectAtIndex:theIndex withObject:@"0"];
}
@end
