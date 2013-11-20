//
//  Persoon+Create.h
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "Persoon.h"

@interface Persoon (Create)

+ (Persoon *) persoonMetNaam:(NSString *)naam
                       Email: (NSString *)email
                       Adres: (NSString *)adres
      inManagedObjectContext:(NSManagedObjectContext *)context;


@end
