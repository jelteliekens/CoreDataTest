//
//  Persoon.h
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Persoon : NSManagedObject

@property (nonatomic, retain) NSString * naam;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * adres;

@end
