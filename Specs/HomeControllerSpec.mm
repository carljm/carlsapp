#import "HomeController.h"
#import "FakeAPIClient.h"


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HomeControllerSpec)

describe(@"HomeController", ^{
    __block HomeController *controller;
    __block UINavigationController *navController;
    __block FakeAPIClient *apiClient;

    beforeEach(^{
        apiClient = [[FakeAPIClient alloc] init];
        controller = [[[HomeController alloc] initWithAPIClient:apiClient] autorelease];
        navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
        controller.view should_not be_nil;
    });

    it(@"should have a title", ^{
        controller.title should equal(@"Home");
    });

    describe(@"tapping the about button", ^{
        __block UIViewController *aboutController;

        beforeEach(^{
            [controller.navigationItem.rightBarButtonItem tap];
            aboutController = navController.topViewController;
        });

        it(@"displays about screen", ^{
            aboutController.title should equal(@"About");
        });
    });

    describe(@"making the app talk", ^{
        context(@"when there is text in the name field", ^{
            beforeEach(^{
                controller.nameTextField.text = @"Carl";
            });

            context(@"when the talk button is tapped", ^{
                __block UIAlertView *alert;

                beforeEach(^{
                    controller.talkButton should_not be_nil;
                    [controller.talkButton tap];
                });

                describe(@"the alert view", ^{

                    beforeEach(^{
                        alert = [UIAlertView currentAlertView];
                        alert should_not be_nil;
                    });

                    it(@"has a title", ^{
                        alert.title should equal(@"Welcome!");
                    });

                    it(@"has a message", ^{
                        alert.message should contain(@"Carl");
                    });

                    it(@"has a cancel button", ^{
                        [alert buttonTitleAtIndex:alert.cancelButtonIndex] should equal(@"Ok");
                    });
                });
            });
        });
    });

    describe(@"showing repo info from github", ^{
        beforeEach(^{
            [controller.showRepositoriesButton tap];
        });

        it(@"requests the correct url", ^{
            apiClient.lastURL should equal(@"https://api.github.com/users/carljm/repos/");
        });

        context(@"when the request is successful", ^{
            __block UIAlertView *alert;

            beforeEach(^{
                NSDictionary *repoDocument = @{@"full_name": @"carljm/django"};
                apiClient.lastSuccessBlock(@[repoDocument]);
                alert = [UIAlertView currentAlertView];
                alert should_not be_nil;
            });

            it(@"should show an alert with the list of repos", ^{
                alert.title should equal(@"Your repos:");
                alert.message should contain(@"carljm/django");
            });
        });
    });
});

SPEC_END
