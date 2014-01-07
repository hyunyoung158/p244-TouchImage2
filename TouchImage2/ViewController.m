//
//  ViewController.m
//  TouchImage2
//
//  Created by Lee HyunYoung on 2014. 1. 7..
//  Copyright (c) 2014년 Lee HyunYoung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@end

@implementation ViewController

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)gesture {
    self.ballImage.transform = CGAffineTransformRotate(self.ballImage.transform, gesture.rotation);
    //연속된 값으로 반환되므로 0으로 초기화
    [gesture setRotation:0.0];
}



- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture locationInView:self.view];
    self.ballImage.center = point;
}

//확대, 축소
- (void)handlePinch:(UIPinchGestureRecognizer *)gesture {
    NSLog(@"--- %d",[gesture state]);
    CGFloat scale = gesture.scale;
    self.ballImage.transform = CGAffineTransformScale(self.ballImage.transform, scale, scale);
    //연속된 값으로 반환되므로 1로 초기화 이런줴스쳐는 서칭을 해바야게따욧
    [gesture setScale:1.0];
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    //코드로 작성
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [pan setDelegate:self];
    [self.ballImage addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [pinch setDelegate:self];
    [self.ballImage addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [rotate setDelegate:self];
    [self.ballImage addGestureRecognizer:rotate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
