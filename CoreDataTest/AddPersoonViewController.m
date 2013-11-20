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

- (IBAction)cancel:(id)sender {
    [self.delegate addPersoonViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender {
    
    BOOL ok = YES;
    
    UITableViewCell *naamCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    UITableViewCell *emailCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    UITableViewCell *adresCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];

    
    if (self.naamField.text.length) {
        naamCell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        naamCell.accessoryType = UITableViewCellAccessoryNone;
        ok = NO;
    }
    
    if (self.emailField.text.length) {
        emailCell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        emailCell.accessoryType = UITableViewCellAccessoryNone;
        ok = NO;
    }
    
    if (self.adresField.text.length) {
        adresCell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        adresCell.accessoryType = UITableViewCellAccessoryNone;
        ok = NO;
    }
    
    if (ok) {
        [self.delegate playerDetailsViewController:self
                                AddPersoonWithName:self.naamField.text
                                             Email:self.emailField.text
                                             Adres:self.adresField.text];
    }
}

@end
