//
//  BSMPViewController.m
//  Scroll for Input
//
//  Created by Benaiah Pitts on 5/3/14.
//  Copyright (c) 2014 University of Georgia. All rights reserved.
//

#import "BSMPViewController.h"

@interface BSMPViewController ()

@end


@implementation BSMPViewController

@synthesize textField1, textField2, textField3, textField4, textField5, textField6, results, scrollView;
CGPoint oldPosition;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	oldPosition= CGPointZero;
}

- (void)viewDidLayoutSubviews {
	CGSize cg;
	UIView *lastView= [scrollView viewWithTag:100];
	cg.height= lastView.frame.size.height + lastView.frame.origin.y + 50;
	cg.width= scrollView.frame.size.width;
	[scrollView setContentSize:cg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateResult:(id)sender {
	
	[results setText:@"Some results and stuff."];
}

- (IBAction)backgroundTapped:(id)sender {
	[textField1 endEditing:YES];
	[textField2 endEditing:YES];
	[textField3 endEditing:YES];
	[textField4 endEditing:YES];
	[textField5 endEditing:YES];
	[textField6 endEditing:YES];
	[textField1 resignFirstResponder];
	[textField2 resignFirstResponder];
	[textField3 resignFirstResponder];
	[textField4 resignFirstResponder];
	[textField5 resignFirstResponder];
	[textField6 resignFirstResponder];
	[self updateResult:sender];
}

#pragma mark UITextFieldDelegate Functions
-(void)textFieldDidBeginEditing:(UITextField *)textField {
	UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:textField action:@selector(resignFirstResponder)];
	[barButton setTitle:@"Done"];
	UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
	toolbar.items = [NSArray arrayWithObjects: flex, barButton, nil];
	
	[toolbar setBarStyle:UIBarStyleBlack];
	
	[textField setInputAccessoryView:toolbar];

	// if the view is scrolling, save the original position
	if (scrollView.contentSize.height > scrollView.frame.size.height) {
		oldPosition= scrollView.contentOffset;
	}
	// otherwise, set the original position to 0,0
	else oldPosition= CGPointZero;

	
	[[self scrollView] setContentOffset:CGPointMake(0, textField.frame.origin.y) animated:YES];
	

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

	return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	[[self scrollView] setContentOffset:oldPosition animated:YES];
	NSLog(@"End Editing. Old position: %f", oldPosition.y);
	return YES;
}

@end
