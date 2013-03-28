#import "FakeAPIClient.h"


@implementation FakeAPIClient

- (void)get:(NSString *)url success:(void (^)(NSArray *))successBlock
{
    self.lastURL = url;
    self.lastSuccessBlock = successBlock;
}

@end
