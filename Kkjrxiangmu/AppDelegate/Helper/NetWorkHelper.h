//
//  NetWorkHelper.h
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/2.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkHelper : NSObject

//  单例方法
+ (NetWorkHelper *)shareNetWorkEngine;



- (void)GetRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;

- (void)PostRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;

- (void)PostResponseNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;

+ (NSDictionary *)dataToDictionary:(NSData *)data;

+ (NSDictionary *)jsonToDictionary:(NSString *)jsonString;
@end
