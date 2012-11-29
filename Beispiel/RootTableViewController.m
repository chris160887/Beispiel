//
//  RootTableViewController.m
//  Beispiel
//
//  Created by Schuldes Christian on 21.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootTableViewController.h"
#import "DetailViewController.h"


@implementation RootTableViewController

-(id)init{
    if(self = [super initWithStyle:UITableViewStylePlain]){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return self;
}
/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *myDict = [[NSMutableDictionary alloc]init];    
    [myDict setObject:@"Christian Schuldes"    forKey:@"Name"];
    [myDict setObject:@"91325"                 forKey:@"ZIP"];
    [myDict setObject:@"Aisch"                 forKey:@"City"];
    [_dataArray addObject:myDict];
    [myDict release];
    
    myDict = [[NSMutableDictionary alloc]init];    
    [myDict setObject:@"Andreas Schaefer"    forKey:@"Name"];
    [myDict setObject:@"91056"               forKey:@"ZIP"];
    [myDict setObject:@"Büchenbach"          forKey:@"City"];
    [_dataArray addObject:myDict];
    [myDict release];   
    
    
    

    self.title = @"Ich bin ein Test";//NSLocalizedString(@", <#comment#>)
    
    
    [self.navigationController setToolbarHidden: NO];
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
}
-(void)addItem{
    
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Ich bin ein Titel" message:@"Ich bin eine Nachricht" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    
    [myAlert show];
    
    [myAlert release];   
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.9 green:0.6 blue:0.2 alpha:0.7];
    self.navigationController.toolbar.tintColor =     self.navigationController.navigationBar.tintColor;
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES; //(interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSLog( @"cellForRowAtIndexPath S=#%d, R=#%d", [indexPath section], [indexPath row]);
    
    NSMutableDictionary *myDict = [_dataArray objectAtIndex:indexPath.row];
    
    //NSString *detailString = [[NSString alloc]initWithFormat:@"%@",[myDict objectForKey:@"Name"]];
    //[[cell textLabel] setText:detailString];
    
    NSString *detailString = [[NSString alloc]initWithFormat:@"%@ %@",[myDict objectForKey:@"ZIP"],[myDict objectForKey:@"City"]];
    [[cell textLabel] setText:[myDict objectForKey:@"Name"]];
    [[cell detailTextLabel] setText:detailString];
    
    
    [detailString release];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{ 
    NSMutableDictionary *myDict = [[_dataArray objectAtIndex:toIndexPath.row] retain];
    [_dataArray removeObjectAtIndex:fromIndexPath.row];
    [_dataArray insertObject:myDict atIndex:toIndexPath.row];
    [myDict release];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithDictionary:[_dataArray objectAtIndex:indexPath.row]];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     
}
- (void)dealloc
{
    [_dataArray release];
    [super dealloc];
}

@end
