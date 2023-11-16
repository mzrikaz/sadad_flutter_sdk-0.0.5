#import "SadadFlutterSdkPlugin.h"
#if __has_include(<sadad_flutter_sdk/sadad_flutter_sdk-Swift.h>)
#import <sadad_flutter_sdk/sadad_flutter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sadad_flutter_sdk-Swift.h"
#endif

@implementation SadadFlutterSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSadadFlutterSdkPlugin registerWithRegistrar:registrar];
}
@end
