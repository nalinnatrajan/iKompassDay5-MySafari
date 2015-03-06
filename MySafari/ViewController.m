//
//  ViewController.m
//  MySafari
//
//  Created by Nalin Natrajan on 6/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

- (IBAction)onBackButtonPressed:(id)sender;

- (IBAction)onForwardButtonPressed:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *urlString = self.urlTextField.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    return YES;
    
}

- (IBAction)onBackButtonPressed:(id)sender {
    
    [self.webView goBack];
    
}

- (IBAction)onForwardButtonPressed:(id)sender {
    
    [self.webView goForward];

}

@end
