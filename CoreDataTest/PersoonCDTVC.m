//
//  PersoonCDTVC.m
//  CoreDataTest
//
//  Created by Jelte Liekens on 19/11/13.
//  Copyright (c) 2013 Jelte Liekens. All rights reserved.
//

#import "PersoonCDTVC.h"
#import "Persoon+Create.h"
#import "AddPersoonViewController.h"

@interface PersoonCDTVC () <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *editButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *deleteButton;

@end

@implementation PersoonCDTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateButtonsToMatchTableState];
}

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

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateButtonsToMatchTableState];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateButtonsToMatchTableState];
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
        //toDo
    }
}

- (IBAction)saveAdding:(UIStoryboardSegue *)segue {
    AddPersoonViewController *vc = segue.sourceViewController;
}

- (IBAction)cancelAdding:(UIStoryboardSegue *)segue {
}

- (IBAction)editAction:(UIBarButtonItem *)sender {
    [self.tableView setEditing:YES animated:YES];
    [self updateButtonsToMatchTableState];
}

- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.tableView setEditing:NO animated:YES];
    [self updateButtonsToMatchTableState];
}

- (IBAction)deleteAction:(UIBarButtonItem *)sender {
	
    NSString *actionTitle;
    if (([[self.tableView indexPathsForSelectedRows] count] == 1)) {
        actionTitle = NSLocalizedString(@"Are you sure you want to remove this item?", @"");
    }
    else
    {
        actionTitle = NSLocalizedString(@"Are you sure you want to remove these items?", @"");
    }
    
    NSString *cancelTitle = NSLocalizedString(@"Cancel", @"Cancel title for item removal action");
    NSString *okTitle = NSLocalizedString(@"OK", @"OK title for item removal action");
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionTitle
                                                             delegate:self
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:okTitle
                                                    otherButtonTitles:nil];
    
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;

	[actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];
        
        if (selectedRows.count > 0) {
            
            //ToDo
            

            
        }
        
        [self.tableView setEditing:NO animated:YES];
        [self updateButtonsToMatchTableState];
        
    }
}

-(void) updateButtonsToMatchTableState
{
    if (self.tableView.editing) {
        
        self.navigationItem.rightBarButtonItem = self.cancelButton;
        self.navigationItem.leftBarButtonItem = self.deleteButton;
        [self updateDeleteButtonTitle];
        
    } else {
        
        self.navigationItem.leftBarButtonItem = self.addButton;
        
        if ([self.tableView numberOfRowsInSection:0] > 0) {
            self.editButton.enabled = YES;
        } else {
            self.editButton.enabled = NO;
        }
        
        self.navigationItem.rightBarButtonItem = self.editButton;
    }
}

- (void) updateDeleteButtonTitle
{
    
    NSArray *selectedRows = [self.tableView indexPathsForSelectedRows];

    if (selectedRows.count > 0) {
        self.deleteButton.enabled = YES;
    } else {
        self.deleteButton.enabled = NO;
    }
    
    NSString *titleFormatString = NSLocalizedString(@"Delete (%d)", @"Title for delete button with placeholder for number");
    self.deleteButton.title = [NSString stringWithFormat:titleFormatString, selectedRows.count];
}

@end
