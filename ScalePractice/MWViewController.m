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
#import "UAStoreFront.h"
#import "UAProduct.h"
#import "UADownloadManager.h"
#import "DarkDisclosureIndicator.h"

@interface MWViewController ()

@end

@implementation MWViewController
- (NSMutableDictionary *)getDictionaryForPlist:(NSString *)fileName
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:plistPath];
}


-(void)loadShop
{
    [UAStoreFront displayStoreFront:self animated:YES];
}

- (void)viewDidLoad
{
    
    [[UAStoreFront shared] setDelegate:self];
    [self setTitle:@"Choose Scales"];
    //[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"More" style:UIBarButtonItemStyleBordered target:self action:@selector(loadShop)]];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"toolbarnote.png"] style:UIBarButtonItemStylePlain target:self action:@selector(loadShop)]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Table View Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *downloadPath =  kUADownloadDirectory;
    return [[[NSFileManager defaultManager] 
             contentsOfDirectoryAtPath:downloadPath error:nil]count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *downloadPath =  kUADownloadDirectory;
    NSArray *folderContents = [[NSFileManager defaultManager] 
             contentsOfDirectoryAtPath:downloadPath error:nil];
     NSString *infoPath = [[kUADownloadDirectory stringByAppendingPathComponent:[folderContents objectAtIndex:indexPath.row]]stringByAppendingPathComponent:@"Information.plist"];
    NSDictionary *metadata = [[NSDictionary dictionaryWithContentsOfFile:infoPath]objectForKey:@"Information"];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    [cell setAccessoryView:[[DarkDisclosureIndicator alloc] initWithFrame:CGRectMake(10, 10, 10, 10)]]; 
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ - Grade %@", [metadata objectForKey:@"Instrument"], [metadata objectForKey:@"Grade"]]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];

    
    [cell.textLabel setTextColor:[UIColor colorWithWhite:1 alpha:1]];
    [cell.detailTextLabel setText:[metadata objectForKey:@"Board"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *downloadPath =  kUADownloadDirectory;
    NSArray *folderContents = [[NSFileManager defaultManager] 
                               contentsOfDirectoryAtPath:downloadPath error:nil];
    NSString *scalesPath = [[kUADownloadDirectory stringByAppendingPathComponent:[folderContents objectAtIndex:indexPath.row]]stringByAppendingPathComponent:@"Scales.plist"];
    NSDictionary *scales = [NSDictionary dictionaryWithContentsOfFile:scalesPath];
    
    Grade *selectedGrade = [[Grade alloc] initWithNotes:[scales objectForKey:@"Notes"] modes:[scales objectForKey:@"Modes"] octaves:[scales objectForKey:@"Octaves"] scaleTypes:[scales objectForKey:@"Types"] hands:[scales objectForKey:@"Hands"]];
    PracticeViewController *scalesVC = [[PracticeViewController alloc] initWithGrade:selectedGrade];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:scalesVC animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


#pragma mark -
#pragma mark StoreFrontDelegate

-(void)productPurchased:(UAProduct*) product {
    UALOG(@"[StoreFrontDelegate] Purchased: %@ -- %@", product.productIdentifier, product.title);
    [table reloadData];
}

-(void)storeFrontDidHide {
    UALOG(@"[StoreFrontDelegate] StoreFront quit, do something with content");
}

-(void)storeFrontWillHide {
    UALOG(@"[StoreFrontDelegate] StoreFront will hide");
}

- (void)productsDownloadProgress:(float)progress count:(int)count {
    UALOG(@"[StoreFrontDelegate] productsDownloadProgress: %f count: %d", progress, count);
    if (count == 0) {
        UALOG(@"Downloads complete");
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
