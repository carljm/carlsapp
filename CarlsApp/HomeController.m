#import "HomeController.h"


@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(didTapNextButton:)];
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
    UIViewController *aboutController = [[UIViewController alloc] init];
    aboutController.title = @"About";
    [self.navigationController pushViewController:aboutController animated:YES];
}

@end
