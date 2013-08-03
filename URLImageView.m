//
//  URLImageView.m
//  Copyright (c) 2013 David Hrachovy
//

#import "URLImageView.h"

@implementation URLImageView

- (id)init
{
    self = [super init];
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    return self;
}

- (void)loadURL:(NSURL*)url
{
    self.image = nil;
    UIActivityIndicatorView *activity = (UIActivityIndicatorView*)[self viewWithTag:11];
    if (!activity) {
        activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        activity.tag = 11;
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self addSubview:activity];
    }
    [activity startAnimating];
    responseData = [[NSMutableData alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)padding:(unsigned int)padding
{
    self.frame = CGRectMake(self.frame.origin.x + padding, self.frame.origin.y + padding, self.frame.size.width - 2*padding, self.frame.size.height - 2*padding);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIActivityIndicatorView *activity = (UIActivityIndicatorView*)[self viewWithTag:11];
    [activity stopAnimating];
    activity.hidden = YES;
	NSLog(@"conneciton failed");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIActivityIndicatorView *activity = (UIActivityIndicatorView*)[self viewWithTag:11];
    [activity stopAnimating];
    activity.hidden = YES;
    self.alpha = 0.0;
    self.image = [[UIImage alloc] initWithData:responseData] ;
    [ UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
    }];
}

@end
