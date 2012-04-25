//
//  TestViewController.m
//  Tili
//
//  Created by Adilet Abylov on 19.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "ResultsListViewController.h"
#import "CJSONDeserializer.h"
#import "ResultViewController.h"
@implementation ResultsListViewController

@synthesize _wordToSearch;
@synthesize responseData;
@synthesize resultArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil word:(NSString *)wordToSearch
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self._wordToSearch = wordToSearch;
    }
    return self;
}

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
    [self makeRequest];    
}

- (void) makeRequest
{
    NSString *serviceURL = @"http://tili.kg/dict/api/search/";
    NSString *url = [serviceURL stringByAppendingString:_wordToSearch];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    responseData = [[NSMutableData alloc] initWithLength:0];
   
    NSURLConnection *conn =[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void) parseData
{
    NSError *theError = nil; 
    resultArray = [[CJSONDeserializer deserializer] deserializeAsArray:responseData error:&theError]; 
}
//
// Connection delegate methods
//
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response 
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error 
{
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
    [self parseData];
    [self.tableView reloadData];
}
//
// ------------ TABLE VIEW----------------------//
//

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultArray count];
}

// Customize the appearance of table view cells. 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
    static NSString *CellIdentifier = @"Cell"; 
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    if (cell == nil) 
    { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]; 
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell.
    NSMutableDictionary *item = [resultArray objectAtIndex:indexPath.row];
    NSString *keyword = [item objectForKey:@"keyword"];
    NSString *description = [item objectForKey:@"value"];
    cell.textLabel.text = keyword;
    cell.detailTextLabel.numberOfLines = 3;
    [cell.detailTextLabel setText:description];
    return cell; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *item = [resultArray objectAtIndex:indexPath.row];
    ResultViewController *resultViewController = [[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil data: item];
    NSString *title = [item objectForKey:@"keyword"];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    [self.navigationController pushViewController:resultViewController animated:YES];
}

- (void)viewDidUnload
{
    [self setResultArray:nil];
    [self setResponseData:nil];
    [self set_wordToSearch:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end