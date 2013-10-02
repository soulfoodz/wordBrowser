//
//  AddWordViewController.h
//  BrowseWords
//
//  Created by MacBook Pro on 10/2/13.
//  Copyright (c) 2013 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddWordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *newWordTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *firstSynonymField;
@property (weak, nonatomic) IBOutlet UITextField *secondSynonymField;

@end
