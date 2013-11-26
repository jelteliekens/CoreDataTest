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

@interface AddPersoonViewController : UITableViewController

@property (nonatomic, readonly) NSString * naam;
@property (nonatomic, readonly) NSString * email;
@property (nonatomic, readonly) NSString * adres;

@end
