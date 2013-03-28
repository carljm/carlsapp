#import "APIClient.h"

@interface FakeAPIClient : APIClient

@property (copy, nonatomic) NSString *lastURL;
@property (copy, nonatomic) void (^lastSuccessBlock)(NSArray *);

@end
