//
//  TestViewController.h
//  Tili
//
//  Created by Adilet Abylov on 19.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsListViewController : UITableViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil word:(NSString *)wordToSearch;
-(void) makeRequest;
-(void) parseData;
@property (unsafe_unretained, atomic) NSString *_wordToSearch;
@property (retain, nonatomic) NSMutableData *responseData;
@property (retain, nonatomic) NSArray *resultArray;

@end
