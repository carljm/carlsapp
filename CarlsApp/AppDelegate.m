#import "AppDelegate.h"
#import "HomeController.h"
#import "APIClient.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)options
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    APIClient *apiClient = [[APIClient alloc] init];

    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[HomeController alloc] initWithAPIClient:apiClient]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
