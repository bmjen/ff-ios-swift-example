#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ff-ios-client-sdk.h"

FOUNDATION_EXPORT double ff_ios_client_sdkVersionNumber;
FOUNDATION_EXPORT const unsigned char ff_ios_client_sdkVersionString[];

