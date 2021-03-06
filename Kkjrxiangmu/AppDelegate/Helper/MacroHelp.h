//
//  MacroHelp.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/8/12.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#ifndef MacroHelp_h
#define MacroHelp_h

// 项目打包上线都不会打印日志，因此可放心。
#ifdef DEBUG
#define DREAMAppLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define DREAMAppLog(s, ... )
#endif



#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#define qianjblack [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1.0];
#define qianblue  [UIColor colorWithRed:30 / 255.0 green:185 / 255.0 blue:211 / 255.0 alpha:1.0];
#define qiangrayColor [UIColor colorWithRed:204 / 255.0 green:204 / 255.0 blue:204 / 255.0 alpha:1.0]
#define xianClole [UIColor colorWithRed:181.0/225.0 green:181.0/225.0 blue:181.0/225.0 alpha:100]
#define backViewColor [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:100];
#define qianWhite [UIColor colorWithRed:242 / 255.0 green:246 / 255.0 blue:249 / 255.0 alpha:1.0];



#import "Masonry.h"

#endif /* MacroHelp_h */
