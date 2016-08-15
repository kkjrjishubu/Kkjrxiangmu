//
//  Alert.h
//  DreammoveAPP
//
//  Created by 壹零贰肆 壹零贰肆 on 16/5/24.
//  Copyright © 2016年 Dreammove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alert : UIView
typedef void(^MakeSureBlock)();
typedef void(^CancleBlock)();
/** makeSureBlock*/
@property (nonatomic, copy)MakeSureBlock makeSureBlock;
/** CancleBlock*/
@property (nonatomic, copy)CancleBlock cancleBlock;
@property (weak, nonatomic) IBOutlet UILabel *textL;
- (void)makeSure:(MakeSureBlock)block;
- (void)cancle:(CancleBlock)block;
@end
