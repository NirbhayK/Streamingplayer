//
//  ViewController.m
//  Test
//
//  Created by Nirbhay Kundan on 02/08/13.
//  Copyright (c) 2013 Nirbhay Kundan. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

MPMoviePlayerController *mp;
UITextField *textField ;

- (void)viewDidLoad
{
  [self addTextField];
  [self addUIButton];
  [super viewDidLoad];
}

-(void) addMediaPlayer :(NSURL *)url {
  if(!mp){
    mp = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [mp setControlStyle:MPMovieControlStyleDefault];
    [mp setMovieSourceType:MPMovieSourceTypeStreaming];
    [mp setFullscreen:NO];
    [[mp view] setFrame: CGRectMake(50, 100, 600, 400)];
    [self.view addSubview:[mp view]];}
  else
  {
    [mp setContentURL:url];
  }
  
  [mp prepareToPlay];
  [mp play] ;
  
}

-(void) playMovie :(id)btn {
  if([textField text])
    [self addMediaPlayer:[NSURL URLWithString:[textField text]]];
}

-(void) addTextField{
  CGRect frame = CGRectMake(50, 60, 500, 30);
  textField = [[UITextField alloc] initWithFrame:frame];
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.textColor = [UIColor blackColor];
  textField.font = [UIFont systemFontOfSize:17.0];
  textField.placeholder = @"HLS URL Goes Here";
  textField.backgroundColor = [UIColor clearColor];
  textField.autocorrectionType = UITextAutocorrectionTypeYes;
  textField.keyboardType = UIKeyboardTypeDefault;
  textField.clearButtonMode = UITextFieldViewModeWhileEditing;
  [self.view addSubview:textField];
}
-(void) addUIButton {
  CGRect frame = CGRectMake(560, 60, 90, 30);
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [btn addTarget:self action:@selector(playMovie:) forControlEvents:UIControlEventTouchDown];
  btn.frame = frame;
  [btn setTitle:@"Play" forState:UIControlStateNormal];
  [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
