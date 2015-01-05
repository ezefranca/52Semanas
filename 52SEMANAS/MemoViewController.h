//
//  MemoViewController.h
//  DMMemoSample
//
//  Created by Master on 2014/07/05.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoViewController : UIViewController
<UITextFieldDelegate>//TextFieldのDelegateプロトコル宣言
{
    IBOutlet UITextField *titleTextField;
    IBOutlet UILabel *timeLabel;
    IBOutlet UIDatePicker *datePicker;
}


- (IBAction)saveMemo;

@end
