//
//  HTTPManager.m
//  Unity-iPhone
//
//  Created by youdian on 2019/3/21.
//

#import "HTTPManager.h"



static HTTPManager *manager = nil;

#define HOST @"https://ar.zhyell.com/api/"

@implementation HTTPManager

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        if (!manager) {
            manager = [super allocWithZone:zone];
        }
    });
    return manager;
}
+(HTTPManager *)requestManager{
    return [[self alloc]init];
}

-(void)postDataWithUrl:(NSString *)urlString andParameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail( task, error);
    }];
}
-(void)getDataWithUr:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    [manager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail( task, error);
    }];
}

-(NSString *)getRequestUrlStringWithPath:(NSString *)path{
    return [NSString stringWithFormat:@"%@%@",HOST,path];
}



@end
