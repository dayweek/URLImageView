//
//  URLImageView.h
//  Copyright (c) 2013 David Hrachovy
//

#import <UIKit/UIKit.h>

// for asynchronous URL image loading
@interface URLImageView : UIImageView {
    NSMutableData* responseData;
}

- (void) loadURL:(NSURL*)url;
- (void) padding:(unsigned int)padding;
@end
