//
//  GlancePageViewController.m
//  Kiba
//
//  Created by admin_user on 5/5/16.
//  Copyright © 2016 WorldStar. All rights reserved.
//

#import "GlancePageViewController.h"

@interface GlancePageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong) NSMutableArray *pages;

@end

@implementation GlancePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.pages = [NSMutableArray array];
    [self.pages addObject:[self viewControllerAtIndex:0]];
    [self.pages addObject:[self viewControllerAtIndex:1]];
    [self.pages addObject:[self viewControllerAtIndex:2]];
    
    self.delegate = self;
    self.dataSource = self;
    
    // Customize page indicator.
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setViewControllers:[NSArray arrayWithObject:self.pages[0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO completion:nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[NSClassFromString(@"_UIQueuingScrollView") class]]) {
            CGRect frame = view.frame;
            frame.size.height = view.superview.frame.size.height;
            view.frame = frame;
            [self.view sendSubviewToBack:view];
        }
    }
}

#pragma mark - Get page content at index

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    NSArray *identifiers = [NSArray arrayWithObjects:
                            @"GlancePage1",
                            @"GlancePage2",
                            @"GlancePage3",
                            nil];
    return [self.storyboard instantiateViewControllerWithIdentifier:identifiers[index]];
}

#pragma mark - UIPageViewController Delegate / DataSource Methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ([self.pages indexOfObject:viewController] == 0) {
        return nil;
    } else {
        return [self.pages objectAtIndex:[self.pages indexOfObject:viewController] - 1];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if ([self.pages indexOfObject:viewController] == 2) {
        return nil;
    } else {
        return [self.pages objectAtIndex:[self.pages indexOfObject:viewController] + 1];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

@end
