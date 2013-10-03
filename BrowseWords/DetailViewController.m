//
//  DetailViewController.m
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "Word.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.word)
    {
        [self setToDefaultState];
        self.navigationItem.title = self.word.word;
    }
    else
    {
        [self setToAddState];
        [self.wordTextField becomeFirstResponder];
        self.navigationItem.title = @"New Word";
    }

    
    self.definitionTextView.text = self.word.definition;
}


- (IBAction)saveButtonPressed:(id)sender
{
    [self setToAddState];
}


- (void)setToAddState
{
    UIBarButtonItem *saveButton;
    UIBarButtonItem *cancelButton;
    
    // Set the state to add new item
    self.isNew = YES;
    
   // [self updateTextFieldText];
    
    self.wordLabel.alpha        = 0.0;
    self.addSynonymsLabel.text = @"Select 2 Synonyms";
    
    self.definitionTextView.text = @"";
    self.definitionTextView.userInteractionEnabled = YES;
    self.definitionTextView.editable   = YES;
    self.definitionTextView.selectable = YES;

    self.wordTextField.alpha    = 1.0;
    
    saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    self.navigationItem.leftBarButtonItem  = cancelButton;
    self.navigationItem.title = @"New Word";
    
    // Refresh Tableview
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    self.tableView.editing = YES;
    
    [self updateTableViewDataSource];

}


- (void)setToDefaultState
{
    UIBarButtonItem *addButton;

    self.isNew = NO;
    
    // Set the wordTextField alpha to 0
    self.wordTextField.alpha = 0.0;
    
    
    // Remove the keyboard if present
    if ([self.wordTextField isFirstResponder]) [self.wordTextField resignFirstResponder];
    if ([self.definitionTextView isFirstResponder]) [self.definitionTextView resignFirstResponder];
    
    
    // Set label and textView with original word and definition
    self.wordLabel.alpha         = 1.0;
    self.wordLabel.text          = self.word.word;
    self.definitionTextView.text = self.word.definition;
    self.definitionTextView.editable = NO;
    
    self.addSynonymsLabel.text = @"Synonyms";
    
    // Set the Nav Bar
    addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                               target:self
                                                               action:@selector(setToAddState)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.title = self.word.word;
    
    self.tableView.editing = NO;
    [self updateTableViewDataSource];
}


//- (void)updateLabels
//{
//    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
//    self.emailLabel.text = self.person.emailAddress;
//    self.phoneNumberLabel.text = self.person.phoneNumber;
//    
//    self.navigationItem.title = self.nameLabel.text;
//}
//
//- (void)updateTextFieldText
//{
//    self.firstNameField.text   = self.person.firstName;
//    self.lastNameField.text    = self.person.lastName;
//    self.emailField.text       = self.person.emailAddress;
//    self.phoneNumberField.text = self.person.phoneNumber;
//}


- (void)cancelButtonPressed:(id)sender
{
    [self setToDefaultState];
    if (self.word == nil) [self.navigationController popViewControllerAnimated:YES];
}

// ***** CALL BLOCK THAT WILL PASS THE INFO IN THE FIELDS TO THE FIRST VC AND CREATE A NEW WORD
/*
- (void)saveButtonPressed:(id)sender
{
    BOOL isNew = NO;
    
    if (self.person == nil)
    {
        self.person = [[Person alloc] init];
        isNew = YES;
    }
    
    self.person.firstName    = self.firstNameField.text;
    self.person.lastName     = self.lastNameField.text;
    self.person.emailAddress = self.emailField.text;
    self.person.phoneNumber  = self.phoneNumberField.text;
    
    [self updateLabels];
    [self setToDefaultState];
    
    [self.delegate updatePerson:self.person atIndex:self.index withBool:isNew];
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.wordTextField)
    {
        [self.wordTextField resignFirstResponder];
        [self.definitionTextView becomeFirstResponder];
    }
    
    return YES;
}


// - (BOOL)TEXTView SHOULD RETURN


- (void)updateTableViewDataSource
{
    if (self.isNew == YES)
        // **** This is running as nil when I put new DVCs on the stack.
        // The reason is the transfer happens in the segue.
        // I need to save the data passed in in a property so I can access it, or create something
        // that each new DVC calls to fetch the Words array on instantiation.
        self.tableViewArray = [self.isNewArray mutableCopy];
    else
    {
        self.tableViewArray = [self.word.synonyms copy];
        NSLog(@"Synonyms in TV");
    }
    
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    UITableViewCell *cell;
    Word *word;
    
    if (self.isNew)
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"addWordCell"];

        word = self.tableViewArray[indexPath.row];
        cell.textLabel.text = word.word;
        //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"synonymCell"];
        
        word = self.tableViewArray[indexPath.row];
        cell.textLabel.text = word.word;
    }

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isNew == NO)
    {
        DetailViewController *newDVC;
        NSArray *synonymsArray;
        
        newDVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
        
        synonymsArray = self.word.synonyms;
        newDVC.word = synonymsArray[indexPath.row];
        
        [self.navigationController pushViewController:newDVC animated:YES];
    }
    else
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        // cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

@end
