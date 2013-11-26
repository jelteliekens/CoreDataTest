//
//  AddPersoonViewController.m
//  CoreDataTest
//
//  Created by Jelte Liekens on 20/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "AddPersoonViewController.h"
#import "Persoon+Create.h"

@interface AddPersoonViewController ()

@property (weak, nonatomic) IBOutlet UITextField *naamField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *adresField;

@end

@implementation AddPersoonViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.naamField becomeFirstResponder];
}

- (NSString *)naam
{
    return self.naamField.text;
}

- (NSString *)email
{
    return self.emailField.text;
}

- (IBAction)test:(UITextField *)sender
{
    UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if ([sender.text length]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

}

- (IBAction)enterPressedNaam:(id)sender {
    [self.naamField resignFirstResponder];
    [self.emailField becomeFirstResponder];
}

- (IBAction)enterPressedEmail:(id)sender {
    [self.emailField resignFirstResponder];
    [self.adresField becomeFirstResponder];
}

- (IBAction)enterPressedAdres:(id)sender {
    [self.adresField resignFirstResponder];
    [self.naamField becomeFirstResponder];
}

@end
