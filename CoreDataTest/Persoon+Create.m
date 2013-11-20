//
//  Persoon+Create.m
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "Persoon+Create.h"

@implementation Persoon (Create)

+ (Persoon *) persoonMetNaam:(NSString *)naam
                       Email: (NSString *)email
                       Adres: (NSString *)adres
      inManagedObjectContext:(NSManagedObjectContext *)context
{
    Persoon *persoon = nil;
    
    if (naam.length && email.length && adres.length) {
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Persoon"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"naam" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"naam = %@", naam];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || [matches count] > 1) {
            
            //Error
            
        } else if (![matches count]) {
            
            persoon = [NSEntityDescription insertNewObjectForEntityForName:@"Persoon" inManagedObjectContext:context];
            persoon.naam = naam;
            persoon.email = email;
            persoon.adres = adres;
            
        } else {
            [matches lastObject];
        }
    }
    
    return persoon;
}

@end
