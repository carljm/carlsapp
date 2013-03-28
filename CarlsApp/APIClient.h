#import <Foundation/Foundation.h>


@interface APIClient : NSObject

- (void)get:(NSString *)url
    success:(void (^)(NSArray *))successBlock;

@end
