//
//  UIImageView+BKUpload.h
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/22.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKBaseRequest.h"
@interface UIImageView (BKUpload)


/**
 Upload self image

 @param url <#url description#>
 @param parameters <#parameters description#>
 @param dataParameter @{@"name":@"fieldNameHere",@"fileName":@"avatar.jpg",@"mimeType":@"image/jpeg"}
 @param progressBlock <#progressBlock description#>
 @param successBlock <#successBlock description#>
 @param failureBlock <#failureBlock description#>
 */
- (void)bk_uploadImageWithURL:(NSString *)url parameterDictionary:(NSDictionary *)parameters andDataParameterDic:(NSDictionary*)dataParameter progress:(BKRequestProgressBlock)progressBlock successed:(BKRequestSuccessBlock)successBlock failed:(BKRequestFailureBlock)failureBlock;

@end
