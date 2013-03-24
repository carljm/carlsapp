#import "AppDelegate.h"
#import "HomeController.h"


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *appDelegate;

    beforeEach(^{
        appDelegate = [[[AppDelegate alloc] init] autorelease];
    });

    describe(@"application:didFinishLaunchingWithOptions:", ^{
        __block BOOL launchedSuccessfully;

        beforeEach(^{
            launchedSuccessfully = [appDelegate application:nil
                              didFinishLaunchingWithOptions:nil];;
        });

        it(@"should launch successfully", ^{
            launchedSuccessfully should be_truthy;
        });

        describe(@"the window", ^{
            __block UIWindow *window;

            beforeEach(^{
                window = appDelegate.window;
            });

            it(@"should be visible", ^{
                window.hidden should_not be_truthy;
            });

            it(@"should be the key window", ^{
                window.isKeyWindow should be_truthy;
            });
        });

        describe(@"the root view controller", ^{
            __block UINavigationController *navController;

            beforeEach(^{
                navController = (UINavigationController *)appDelegate.window.rootViewController;
            });

            it(@"should be a nav controller", ^{
                navController should be_instance_of([UINavigationController class]);
            });

            it(@"should show a home controller by default", ^{
                navController.topViewController should be_instance_of([HomeController class]);
            });
        });
    });
});

SPEC_END
