//
//  MainView.h
//  Tili
//
//  Created by Adilet Abylov on 18.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
- (IBAction)clickO:(id)sender;
- (IBAction)clickY:(id)sender;
- (IBAction)clickN:(id)sender;
- (IBAction)startSearch:(id)sender;
- (IBAction)gotoSite:(id)sender;
-(void) search;
- (IBAction)didSearch:(id)sender;

@property (unsafe_unretained, nonatomic) IBOutlet UITextField *searchField;
@end
