//
//  AppDelegate.h
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
