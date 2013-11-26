//
//  PersoonCDTVC.h
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "AddPersoonViewController.h"

@class AddPersoonViewController;

@interface PersoonCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


- (IBAction)saveAdding:(UIStoryboardSegue *)segue;
- (IBAction)cancelAdding:(UIStoryboardSegue *)segue;


@end
