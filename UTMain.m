#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>

@interface UTAppDelegate : NSObject<UIAlertViewDelegate> {
}
@property (nonatomic, retain) UIWindow *window;

- (void)runTests;
@end

@implementation UTAppDelegate
@synthesize window;

// Run through all the registered classes and run test methods on any
// that are subclasses of SenTestCase. Terminate the application upon
// test completion.
- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [self runTests];
}

// Run through all the registered classes and run test methods on any
// that are subclasses of SenTestCase.
- (void)runTests {
    SenTestSuite *suite = [SenTestSuite testSuiteForBundlePath:[[NSBundle mainBundle] bundlePath]];
    SenTestRun *result = [suite run];
    exit([result failureCount]);
}

@end

// Creates an application that runs all tests from classes extending
// SenTestCase, outputs results and test run time, and terminates right
// afterwards.
int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"UTAppDelegate");
    [pool release];
    return retVal;
}
