//
//  AppDelegate.h
//  Pa3Practice (Core Data Exercise)
//
//  Created by Student1 on 29/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

//Import Employee headers
#import "Employee+CoreDataClass.h"
#import "Employee+CoreDataProperties.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

