//
//  DetailViewController.h
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSMutableArray* (^tvArray)();

@class Word;

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *addSynonymsLabel;
@property (strong, nonatomic) tvArray getDictBlock;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Word *word;
@property (strong, nonatomic) NSMutableArray *tableViewArray;
@property (strong, nonatomic) NSArray *isNewArray;
@property BOOL isNew;



@end
