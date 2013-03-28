#import "APIClient.h"


@interface APIClient ()

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation APIClient


- (id)init
{
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)get:(NSString *)urlString
    success:(void (^)(NSArray *))successBlock
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:20];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:self.queue
                           completionHandler:
    ^(NSURLResponse *response, NSData *data, NSError *error) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:nil];
        successBlock(array);
    }];
}

@end
