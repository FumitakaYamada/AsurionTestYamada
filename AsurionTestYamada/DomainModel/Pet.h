//
//  Pet.h
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pet : NSObject

@property (atomic, strong) NSString *imageUrl;
@property (atomic, strong) NSString *title;
@property (atomic, strong) NSString *contentUrl;
@property (atomic, strong) NSString *dateAddedString;

@end

NS_ASSUME_NONNULL_END
