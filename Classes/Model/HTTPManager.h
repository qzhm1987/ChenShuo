//
//  HTTPManager.h
//  Unity-iPhone
//
//  Created by youdian on 2019/3/21.
//

#import <Foundation/Foundation.h>


typedef void(^successBlock)(id responobject);
typedef void(^failBlock)(NSURLSessionDataTask *  task,NSError * error);

@interface HTTPManager : NSObject

/**
 获取网络请求管理类
 @return 网络管理类Manager
 */
+(HTTPManager *)requestManager;
/**
 二次封装AFNetWorkng POST
 * @ param urlString 请求接口地址
 * @ param parameters 参数
 * @ success 成功Block
 * @ fail 失败回调
 @ return
 */
-(void)postDataWithUrl:(NSString *)urlString andParameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail;


/**
 二次封装AFNetWorking GET
 * @ param urlString 请求接口地址
 * @ param parameters 参数
 * @ success 成功Block
 * @ fail 失败回调
 */
-(void)getDataWithUr:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail;


-(NSString *)getRequestUrlStringWithPath:(NSString *)path;

@end


