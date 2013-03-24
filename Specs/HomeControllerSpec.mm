#import "HomeController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HomeControllerSpec)

describe(@"HomeController", ^{
    __block HomeController *controller;
    __block UINavigationController *navController;

    beforeEach(^{
        controller = [[[HomeController alloc] init] autorelease];
        navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
        controller.view should_not be_nil;
    });


    describe(@"the home view", ^{
        it(@"should have a title", ^{
            controller.title should equal(@"Home");
        });
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
});

SPEC_END
