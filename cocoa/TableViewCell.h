//
//  TableViewCell.h
//  cocoa
//
//  Created by admin on 17/4/11.
//  Copyright © 2017年 yueyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *title;

- (float)getAutoCellHeight;

@end
