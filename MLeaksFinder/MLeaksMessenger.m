/**
 * Tencent is pleased to support the open source community by making MLeaksFinder available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company. All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 *
 * https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */

#import "MLeaksMessenger.h"

static __weak UIAlertView *alertView;

@implementation MLeaksMessenger

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    [self alertWithTitle:title message:message handler:nil additionalButtonTitle:nil];
}

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
               handler:(void (^)(UIAlertAction *action))handler
 additionalButtonTitle:(NSString *)additionalButtonTitle {
//    [alertView dismissWithClickedButtonIndex:0 animated:NO];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertView *alertViewTemp = [[UIAlertView alloc] initWithTitle:title
//                                                            message:message
//                                                           delegate:delegate
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:additionalButtonTitle, nil];
//    [alertViewTemp show];
//    alertView = alertViewTemp;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        if (additionalButtonTitle == nil) {
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler]];
        } else {
            [alert addAction:[UIAlertAction actionWithTitle:additionalButtonTitle style:UIAlertActionStyleDefault handler:handler]];
        }
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
    NSLog(@"%@: %@", title, message);
}

@end
