//
//  ResultViewController.h
//  Tili
//
//  Created by Adilet Abylov on 24.04.12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSDictionary *)data;
@property (unsafe_unretained, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (retain, nonatomic) NSDictionary *translationData;
@end
