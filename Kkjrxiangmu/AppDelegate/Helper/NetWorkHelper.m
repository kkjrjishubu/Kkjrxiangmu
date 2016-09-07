//
//  NetWorkHelper.m
//  Kkjrxiangmu
//
//  Created by Star's mac on 16/9/2.
//  Copyright © 2016年 kkjr. All rights reserved.
//

#import "NetWorkHelper.h"

@implementation NetWorkHelper

//  单例方法
+ (NetWorkHelper *)shareNetWorkEngine {
    static NetWorkHelper *netWorkEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorkEngine = [[NetWorkHelper alloc]init];
        
    });
    return netWorkEngine;
}

- (void)PostRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur {
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    [manager POST:urlStr parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);
    }];
    
}

- (void)PostResponseNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    [manager POST:urlStr parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);
    }];
}

- (void)GetRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    [manager GET:urlStr parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);

    }];
}







@end
