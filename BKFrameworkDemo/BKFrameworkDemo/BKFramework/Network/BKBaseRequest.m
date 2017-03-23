//
//  BKBaseRequest.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/22.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "BKBaseRequest.h"
#import "BKConstant.h"
@interface BKBaseRequest ()

@property (nonatomic,  copy) BKRequestSuccessBlock successBlock;
@property (nonatomic,  copy) BKRequestFailureBlock failureBlock;
@property (nonatomic,  copy) BKRequestProgressBlock progressBlock;

@property (nonatomic,strong) AFHTTPResponseSerializer *responseSerializer;
@property (nonatomic,strong) AFHTTPRequestSerializer *requestSerializer;

@end

@implementation BKBaseRequest

+ (instancetype)sharedManager
{
    static BKBaseRequest *baseRequest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseRequest = [[BKBaseRequest alloc] init];
        baseRequest.HTTPSessionManager = [AFHTTPSessionManager manager];
        baseRequest.responseSerializer = [AFHTTPResponseSerializer serializer];
        [baseRequest.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/json", @"text/html",nil]];
        baseRequest.HTTPSessionManager.responseSerializer = baseRequest.responseSerializer;
        
        baseRequest.requestSerializer = [AFHTTPRequestSerializer serializer];
        baseRequest.requestSerializer.timeoutInterval = 10;
        baseRequest.HTTPSessionManager.requestSerializer = baseRequest.requestSerializer;
    });
    return baseRequest;
}

- (void)setTimeoutInterval:(NSTimeInterval)timeoutInterval
{
    _timeoutInterval = timeoutInterval;
    self.requestSerializer.timeoutInterval = timeoutInterval;
}

- (void)setSecurityCertifyPath:(NSString *)securityCertifyPath
{
    _securityCertifyPath = securityCertifyPath;
    
    NSData *cerData = [NSData dataWithContentsOfFile:securityCertifyPath];
    
    //AFSSLPinningModeCertificate使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;
    
    //validatesCertificateChain 是否验证整个证书链，默认为YES
    //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
    //GeoTrust Global CA
    //    Google Internet Authority G2
    //        *.google.com
    //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
    //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证，因为整个证书链一一比对是完全没有必要（请查看源代码）；
    //    securityPolicy.validatesCertificateChain = NO;
    
    NSSet *cerDataSet = [NSSet setWithArray:@[cerData]];
    securityPolicy.pinnedCertificates = cerDataSet;

    [self.HTTPSessionManager setSecurityPolicy:securityPolicy];
}

#pragma mark --- private methods
- (void)setAllBlocks:(BKRequestSuccessBlock)success failure:(BKRequestFailureBlock)failure progress:(BKRequestProgressBlock)progress
{
    self.successBlock = success;
    self.failureBlock = failure;
    self.progressBlock = progress;
}

- (void)handleResponseObject:(id)responseObject
{
    NSError *readError;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&readError];
    if (!readError) {
        BLOCK_EXEC(self.successBlock,dic);
    }else{
        [self handleRequestError:readError];
    }
}

- (void)handleRequestError:(NSError *)error
{
    BLOCK_EXEC(self.failureBlock,error);
}

- (void)handleRequestProgress:(NSProgress *)progess
{
    BLOCK_EXEC(self.progressBlock,progess);
}

#pragma mark --- public methods
- (NSURLSessionDataTask *)requestWithHTTPMethod:(BKRequestMethod)method requestURL:(NSString *)url parameterDictionary:(NSDictionary *)parameters successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock
{
    switch (method) {
        case BKRequestMethodGET:
            return [self getDataWithURL:url parameterDictionary:parameters progress:nil successed:successBlock failed:failureBlock];
            break;
        case BKRequestMethodPOST:
            return [self postDataWithURL:url parameterDictionary:parameters progress:nil successed:successBlock failed:failureBlock];
            break;
        case BKRequestMethodPUT:
            [self setAllBlocks:successBlock failure:failureBlock progress:nil];
            return [_HTTPSessionManager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestError:error];
            }];
            break;
        case BKRequestMethodHEAD:
            [self setAllBlocks:successBlock failure:failureBlock progress:nil];
            return [_HTTPSessionManager HEAD:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task) {
                [self handleResponseObject:nil];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestError:error];
            }];
            break;
        case BKRequestMethodPATCH:
            [self setAllBlocks:successBlock failure:failureBlock progress:nil];
            return [_HTTPSessionManager PATCH:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestError:error];
            }];
            break;
        case BKRequestMethodDELETE:
            [self setAllBlocks:successBlock failure:failureBlock progress:nil];
            return [_HTTPSessionManager DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestError:error];
            }];
            break;
    }
    return nil;
}


- (NSURLSessionDataTask *)getDataWithURL:(NSString *)url parameterDictionary:(NSDictionary *)parameters progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock
{
    [self setAllBlocks:successBlock failure:failureBlock progress:progress];
   return [_HTTPSessionManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
       [self handleRequestProgress:downloadProgress];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResponseObject:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleRequestError:error];
    }];
}


- (NSURLSessionDataTask *)postDataWithURL:(NSString *)url parameterDictionary:(NSDictionary *)parameters progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock
{
    [self setAllBlocks:successBlock failure:failureBlock progress:progress];
    return [_HTTPSessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        [self handleRequestProgress:uploadProgress];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResponseObject:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleRequestError:error];
    }];
}


- (NSURLSessionDataTask *)uploadDataWithUrl:(NSString *)url dataOrFilePath:(id)dataOrPath parameterDictionary:(NSDictionary *)parameters andDataParameterDic:(NSDictionary*)dataParameter progress:(BKRequestProgressBlock)progress successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock
{
    [self setAllBlocks:successBlock failure:failureBlock progress:progress];

  return [_HTTPSessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      if ([dataOrPath isKindOfClass:[NSData class]]) {
          [formData appendPartWithFileData:dataOrPath name:[dataParameter objectForKey:@"name"] fileName:[dataParameter objectForKey:@"fileName"] mimeType:[dataParameter objectForKey:@"mimeType"]];
      }else
      {
          [formData appendPartWithFileURL:dataOrPath name:[dataParameter objectForKey:@"name"] fileName:[dataParameter objectForKey:@"fileName"] mimeType:[dataParameter objectForKey:@"mimeType"] error:nil];
      }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        [self handleRequestProgress:uploadProgress];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self handleResponseObject:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self handleRequestError:error];
    }];
}
@end
