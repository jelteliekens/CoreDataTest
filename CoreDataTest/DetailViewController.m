//
//  DetailViewController.m
//  CoreDataTest
//
//  Created by Jelte Liekens on 20/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *naamLabel;

@end

@implementation DetailViewController

- (void)setPersoon:(Persoon *)persoon
{
    _persoon = persoon;
    self.title = persoon.naam;
    
    [self fillLabels];
}

- (void) fillLabels {
    [self.naamLabel setText:@"Hallo"];
}

@end
