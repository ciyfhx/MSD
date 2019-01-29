//
//  AppDelegate.m
//  Pa3Practice (Core Data Exercise)
//
//  Created by Student1 on 29/1/19.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self addEmployee:@"Alvin" andID:100 andSalary:35000 andDept:@"admin"];
    [self addEmployee:@"Bob" andID:101 andSalary:25000 andDept:@"finance"];
    [self addEmployee:@"Carl" andID:102 andSalary:75000 andDept:@"sales"];
    [self addEmployee:@"Dan" andID:103 andSalary:33333 andDept:@"hr"];
    
    [self showEmployees];
    
    [self deleteLastEmployee];
    
    [self sortBySalary];
    
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

- (BOOL) addEmployee: (NSString*) empName andID:(NSInteger) empID andSalary:(NSInteger) empSalary andDept:(NSString*) empDept{
    
    //Validate
    if([empName length] == 0 || [empDept length] == 0){
        NSLog(@"Employee Name and Dept cannot be empty!");
        return NO;
    }
    
    NSManagedObjectContext* context = self.persistentContainer.viewContext;
    
    Employee* newEmployee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    
    if(newEmployee == nil){
        NSLog(@"Failed to create Employee!");
        return NO;
    }
    
    newEmployee.empName = empName;
    newEmployee.empID = empID;
    newEmployee.empDept = empDept;
    newEmployee.empSalary = (short)empSalary;
    
    NSError* error = nil;
    
    if([context save:&error]){
        return YES;
    }else{
        NSLog(@"Failed to save Employee. Error: %@", error);
        return NO;
    }
    
    
}

- (BOOL) showEmployees {
    NSManagedObjectContext* context = self.persistentContainer.viewContext;
    
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    
    NSError* error = nil;
    
    NSArray* employees = [context executeFetchRequest:request error:&error];
    
    if(error != nil){
        NSLog(@"Failed to fetch request. Error %@", error);
        return NO;
    }
    
    if([employees count] > 0){
        NSUInteger counter = 0;
        for (Employee* employee in employees) {
            NSLog(@"Employee Details No. (%lu): \n", counter);
            
            NSLog(@"ID: %d", employee.empID);
            NSLog(@"Name: %@", employee.empName);
            NSLog(@"Salary: %d", employee.empSalary);
            NSLog(@"Department: %@", employee.empDept);
            
            counter++;
        }
        return YES;
    }else{
        NSLog(@"Cannot find any employee!");
        return NO;
    }
    
}

- (BOOL) deleteLastEmployee {
    
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    
    NSManagedObjectContext* context = self.persistentContainer.viewContext;
    
    NSError* error = nil;
    
    NSArray* employees = [context executeFetchRequest:request error:&error];
    
    if(error != nil) {
        NSLog(@"Failed to fetch request. Error %@", error);
        return NO;
    }
    
    if([employees count] > 0){
        
        Employee* lastEmployee = [employees lastObject];
        
        [context deleteObject:lastEmployee];
        
        //Save
        if([context save:&error]){
            
            NSLog(@"Successfully deleted last employee in array");
            return YES;
        }else{
            NSLog(@"Unable to delete last employee");
            return NO;
        }
        
    }else{
        NSLog(@"Cannot find any employee");
        return NO;
    }
    
}

- (BOOL) sortBySalary {
    NSManagedObjectContext* context = self.persistentContainer.viewContext;
    
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"empSalary" ascending:YES];
    request.sortDescriptors = @[sortDescriptor];
    
    NSError* error = nil;
    
    NSArray* employees = [context executeFetchRequest:request error:&error];
    
    if(error != nil) {
        NSLog(@"Failed to fetch request. Error %@", error);
        return NO;
    }
    
    NSLog(@"Displaying sorted list of employees");
    
    if([employees count] > 0){
        NSUInteger counter = 0;
        for (Employee* employee in employees) {
            NSLog(@"Employee Details No. (%lu): \n", counter);
            
            NSLog(@"ID: %d", employee.empID);
            NSLog(@"Name: %@", employee.empName);
            NSLog(@"Salary: %d", employee.empSalary);
            NSLog(@"Department: %@", employee.empDept);
            
            counter++;
        }
        return YES;
    }else{
        NSLog(@"Cannot find any employee!");
        return NO;
    }
    
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Pa3Practice__Core_Data_Exercise_"];
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
