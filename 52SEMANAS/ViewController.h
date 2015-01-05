//
//  ViewController.h
//  DMMemoSample
//
//  Created by Master on 2014/07/05.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
//TableViewのデータソース、デリゲートのプロトコル宣言
{
    IBOutlet UITableView *table;//TableViewのメンバ変数を宣言
    NSMutableArray *titleArray;
    NSMutableArray *timeArray;
    
    int selectedIndex;
}

@end
