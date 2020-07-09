//
//  PetTableViewCell.h
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pet.h"

NS_ASSUME_NONNULL_BEGIN

@interface PetTableViewCell : UITableViewCell

@property (weak, nonatomic) Pet *pet;

@end

NS_ASSUME_NONNULL_END
