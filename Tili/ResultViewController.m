//
//  ResultViewController.m
//  Tili
//
//  Created by Adilet Abylov on 24.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "ResultViewController.h"

@implementation ResultViewController

@synthesize descriptionTextView;
@synthesize translationData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSDictionary *)data
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        translationData = data;
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
    NSString *dictname = [[translationData objectForKey:@"dictname"] stringByAppendingString:@"\n"];
    descriptionTextView.text =  [dictname stringByAppendingString:[translationData objectForKey:@"value"]];
}

- (void)viewDidUnload
{
    [self setDescriptionTextView:nil];
    [self setTranslationData:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
