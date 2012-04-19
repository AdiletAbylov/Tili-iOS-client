//
//  MainView.m
//  Tili
//
//  Created by Adilet Abylov on 18.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "SearchViewController.h"

@implementation SearchViewController
@synthesize searchField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    self.title = @"Русско-кыргызский словарь";
}

- (void)viewDidUnload
{
    
    [self setSearchField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickO:(id)sender 
{
    self.searchField.text = [self.searchField.text stringByAppendingString:@"ө"];
}

- (IBAction)clickY:(id)sender 
{
    self.searchField.text = [self.searchField.text stringByAppendingString:@"ү"];
}

- (IBAction)clickN:(id)sender 
{
    self.searchField.text = [self.searchField.text stringByAppendingString:@"ң"];
}


- (IBAction)startSearch:(id)sender 
{
    if(searchField.text.length > 0)
    {
        //
        // do search
    }
}
@end
