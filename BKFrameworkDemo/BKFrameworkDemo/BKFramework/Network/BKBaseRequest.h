//
//  BKBaseRequest.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/22.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef void(^BKRequestSuccessBlock)(id responseDic);
typedef void(^BKRequestFailureBlock)(NSError *error);
typedef void(^BKRequestProgressBlock)(NSProgress *progress);

typedef NS_ENUM(NSUInteger, BKRequestMethod) {
    BKRequestMethodGET,
    BKRequestMethodPUT,
    BKRequestMethodPOST,
    BKRequestMethodHEAD,
    BKRequestMethodPATCH,
    BKRequestMethodDELETE,
};


@interface BKBaseRequest : NSObject


/**
 The timeout interval, in seconds, for created requests. The default timeout interval is 10 seconds
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 https certify path, default is nil
 */
@property (nonatomic,  copy) NSString *securityCertifyPath;

@property (nonatomic ,strong) AFHTTPSessionManager *HTTPSessionManager;


#pragma mark --- methods
+ (instancetype)sharedManager;


/**
 Use the method to make request which is without progess

 @param method <#method description#>
 @param url <#url description#>
 @param parameters <#parameters description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)requestWithHTTPMethod:(BKRequestMethod)method requestURL:(NSString *)url parameterDictionary:(NSDictionary*)parameters successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock;



/**
 Get data with progress

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param progress <#progress description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)getDataWithURL:(NSString *)url parameterDictionary:(NSDictionary*)parameters progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock;


/**
 Post data with progress

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param progress <#progress description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)postDataWithURL:(NSString *)url parameterDictionary:(NSDictionary*)parameters progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock;


/**
 Upload data

 @param url <#url description#>
 @param dataOrPath Nsdata or dataPath
 @param parameters <#parameters description#>
 @param dataParameter ex @{@"name":@"fieldNameHere",@"fileName":@"avatar.jpg",@"mimeType":@"image/jpeg"}
 @param progress <#progress description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 @return <#return value description#>
 */
- (NSURLSessionDataTask *)uploadDataWithUrl:(NSString *)url dataOrFilePath:(id)dataOrPath parameterDictionary:(NSDictionary *)parameters andDataParameterDic:(NSDictionary*)dataParameter progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock;


@end
