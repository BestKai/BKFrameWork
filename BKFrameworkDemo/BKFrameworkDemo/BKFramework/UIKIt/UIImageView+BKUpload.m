//
//  UIImageView+BKUpload.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/22.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "UIImageView+BKUpload.h"

@implementation UIImageView (BKUpload)

- (void)bk_uploadImageWithURL:(NSString *)url parameterDictionary:(NSDictionary *)parameters andDataParameterDic:(NSDictionary *)dataParameter progress:(BKRequestProgressBlock)progressBlock successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock
{
    [[BKBaseRequest sharedManager] uploadDataWithUrl:url dataOrFilePath:UIImageJPEGRepresentation(self.image, 0.9) parameterDictionary:parameters andDataParameterDic:dataParameter progress:^(NSProgress *progress) {
        if (progressBlock) {
            progressBlock(progress);
        }
    } successed:^(id responseDic) {
        if (successBlock) {
            successBlock(responseDic);
        }
    } failed:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end
