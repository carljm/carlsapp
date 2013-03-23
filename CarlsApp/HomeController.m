#import "HomeController.h"


@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SEL mySelector = @selector(didTapNextButton:);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                              style:UIBarButtonItemStyleBordered target:self action:mySelector];
    self.title = @"Home";
}

- (IBAction)didTapTalkButton:(id)sender
{
    UIAlertView *nameAlertView = [[UIAlertView alloc] initWithTitle:@"Welcome!"
                                                            message:[NSString stringWithFormat:@"Hello there, %@", self.nameTextField.text]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
    [nameAlertView show];
}

- (IBAction)didTapNextButton:(id)sender
{
    UIViewController *secondController = [[UIViewController alloc] init];
    [self.navigationController pushViewController:secondController animated:YES];
}

@end
