//
//  PersoonCDTVC.m
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "PersoonCDTVC.h"
#import "Persoon+Create.h"

@interface PersoonCDTVC ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation PersoonCDTVC

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if (managedObjectContext) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Persoon"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"naam" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = nil;
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    } else {
        self.fetchedResultsController = nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Persoon Description"];

    Persoon *persoon = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = persoon.naam;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        if ([segue.identifier isEqualToString:@"setPersoon:"]) {
            Persoon *persoon = [self.fetchedResultsController objectAtIndexPath:indexPath];
            if ([segue.destinationViewController respondsToSelector:@selector(setPersoon:)]) {
                [segue.destinationViewController performSelector:@selector(setPersoon:) withObject:persoon];
            }
        }
        
    } else if ([segue.identifier isEqualToString:@"Toevoegen"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddPersoonViewController *addPersoonViewController = [navigationController viewControllers][0];
        addPersoonViewController.delegate = self;
    }
}

- (IBAction)edit:(UIBarButtonItem *)sender {
    if ([self.tableView isEditing]) {
        self.editButton.style = UIBarButtonItemStyleBordered;
        self.editButton.title = @"Edit";
        [self.tableView setEditing: NO animated: YES];

    } else {
        self.editButton.style = UIBarButtonItemStyleDone;
        self.editButton.title = @"Done";
        [self.tableView setEditing: YES animated: YES];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self removePersoonAtIndex:indexPath];
    }
}

- (void) removePersoonAtIndex:(NSIndexPath *) indexPath {
    Persoon *persoon = [self.fetchedResultsController objectAtIndexPath:indexPath];
    if (persoon) {
        [self.managedObjectContext deleteObject:persoon];
    }
    
    [self.tableView reloadData];
}

- (void)addPersoonViewControllerDidCancel:(AddPersoonViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewController:(AddPersoonViewController *)controller AddPersoonWithName:(NSString *)naam Email:(NSString *)email Adres:(NSString *) adres
{
    [Persoon persoonMetNaam:naam Email:email Adres:adres inManagedObjectContext:self.managedObjectContext];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
