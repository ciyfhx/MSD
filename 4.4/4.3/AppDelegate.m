//
//  AppDelegate.m
//  4.3
//
//  Created by Student1 on 2019-01-24.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
#import "Person+CoreDataProperties.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self createNewPersonWithFirstName:@"Shinji"
                              lastName:@"Kagawa"
                                   age:28];

    [self createNewPersonWithFirstName:@"Robert"
                              lastName:@"Lewandowski"
                                   age:28];

    [self displayPersons];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];

}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"4_3"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

- (BOOL)createNewPersonWithFirstName:(NSString *)paramFirstName
                            lastName:(NSString *)paramLastName
                                 age:(NSUInteger)paramAge {
    BOOL result = NO;

    if([paramFirstName length] == 0 ||
            [paramLastName length] == 0)
    {
        NSLog(@"First and Last names are mandatory!");
        return NO;
    }
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    Person *newPerson =  [NSEntityDescription
                       insertNewObjectForEntityForName:@"Person"
                       inManagedObjectContext:context];

    if(newPerson == nil)
    {
        NSLog(@"Failed to create new person!");
        return NO;
    }

    [newPerson setValue:paramFirstName forKey:@"firstName"];
    [newPerson setValue:paramLastName forKey:@"lastName"];
    [newPerson setValue:[NSNumber numberWithUnsignedLong:paramAge] forKey:@"age"];

    NSError *savingError = nil;

    if([context save:&savingError])
    {
        return YES;
    }
    else
    {
        NSLog(@"Failed to save the new person. Error: %@", savingError);
    }

    return result;
}

- (BOOL)displayPersons
{
    BOOL result = NO;

    NSManagedObjectContext *context = self.persistentContainer.viewContext;

    // Tell the request we want to read the contents of the Person entity
    // Create the fetch request first
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
            initWithEntityName:@"Person"];

    NSError *requestError = nil;

    // and execute the fetch request on the context
    NSArray *persons = [context
            executeFetchRequest:fetchRequest
                          error:&requestError];

    // Make sure we get the array
    if([persons count] > 0)
    {
        // Go thru the persons array one by one
        NSUInteger counter = 1;

        for(Person *thisPerson in persons)
        {
            NSLog(@"Person %lu First Name = %@",
                    (unsigned long)counter,
                    thisPerson.firstName);

            NSLog(@"Person %lu Last Name = %@",
                    (unsigned long)counter,
                    thisPerson.lastName);

            NSLog(@"Person %lu Age = %ld",
                    (unsigned long)counter,
                    (unsigned long)thisPerson.age);

            counter++;
        }
    }
    else {
        NSLog(@"Could not find any Person entities in the context");
    }
    return result;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
