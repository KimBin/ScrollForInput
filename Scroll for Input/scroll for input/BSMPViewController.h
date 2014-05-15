//
//  BSMPViewController.h
//  Scroll for Input
//
//  Created by Benaiah Morgan on 5/3/14.
//  Copyright (c) 2014 University of Georgia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSMPViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;
@property (strong, nonatomic) IBOutlet UITextField *textField3;
@property (strong, nonatomic) IBOutlet UITextField *textField4;
@property (strong, nonatomic) IBOutlet UITextField *textField5;
@property (strong, nonatomic) IBOutlet UITextField *textField6;
@property (strong, nonatomic) IBOutlet UILabel *results;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)updateResult:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
@end
