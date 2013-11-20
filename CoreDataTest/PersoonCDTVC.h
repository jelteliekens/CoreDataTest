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

@interface PersoonCDTVC : CoreDataTableViewController <AddPersoonViewControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
