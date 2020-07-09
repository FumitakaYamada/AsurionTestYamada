//
//  PetHeaderCellTableViewCell.h
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/09.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PetHeaderCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *officeHoursLabel;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *centerMarginWidth;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *chatButtonWidth;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *callButtonWidth;

@end

NS_ASSUME_NONNULL_END
