//
//  BaseViewController.m
//  zhuangxiu
//
//  Created by quanqiuwa on 2019/2/14.
//  Copyright © 2019 TestProject. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
#import "BaseNavController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout =UIRectEdgeNone;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)saveShouCang:(HomeMode *)model {
    NSDictionary *dic = [model mj_JSONObject];
    NSArray *list = [[NSUserDefaults standardUserDefaults]objectForKey: ShouCang];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:list];
    [arr addObject:dic];
    NSArray *save = [NSArray arrayWithArray:arr];
    [[NSUserDefaults standardUserDefaults]setObject:save forKey:ShouCang];
}


- (void)deleteShouCang:(HomeMode *)model {
    NSArray *list = [[NSUserDefaults standardUserDefaults]objectForKey: ShouCang];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:list];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HomeMode *o = [HomeMode mj_objectWithKeyValues:obj];
        if ([model.photo_id  isEqualToString:o.photo_id]) {
            [arr removeObject:obj];
            *stop = YES;
        }
    }];
    NSArray *save = [NSArray arrayWithArray:arr];
    [[NSUserDefaults standardUserDefaults]setObject:save forKey:ShouCang];
}

- (NSArray *)getShoucang {
    NSArray *list = [[NSUserDefaults standardUserDefaults]objectForKey: ShouCang];
    return list;
}

- (void)gotoLoginViewController {
    LoginViewController *login = [LoginViewController new];
    BaseNavController *navi = [[BaseNavController  alloc]initWithRootViewController:login];
    [self presentViewController:navi animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
