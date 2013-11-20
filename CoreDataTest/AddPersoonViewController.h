//
//  AddPersoonViewController.h
//  CoreDataTest
//
//  Created by Jelte Liekens on 20/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Persoon.h"

@class AddPersoonViewController;

@protocol AddPersoonViewControllerDelegate <NSObject>
- (void)addPersoonViewControllerDidCancel:(AddPersoonViewController *)controller;
- (void)playerDetailsViewController:(AddPersoonViewController *)controller AddPersoonWithName:(NSString *)naam Email:(NSString *)email Adres:(NSString *)adres;

@end

@interface AddPersoonViewController : UITableViewController

@property (nonatomic, weak) id <AddPersoonViewControllerDelegate> delegate;


- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
