//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

- (BOOL)checkSameCity:(Person *)person;

- (Person *)registerChild;

@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

- (BOOL)checkSameCity:(Person *)person {
    
    if ([[person city] isEqualToString:[self city]]) {
        
        return YES;
        
    } else {
        
        return NO;
    }
}

- (Person *)registerChild {
    
    Person *child;
    
    child = [[Person alloc] init];
    
    [child setPhoneNumber:[self phoneNumber]];
    
    [child setCity:[self city]];
    
    return child;
    
}

- (void)printName {
    NSString *personName = self.name;
    NSLog(@"Name: %@", personName);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"This is Robert.");
        
        Person *person = [[Person alloc] init];
        [person setName:@"Robert"];
        
        [person printName];
        
        NSLog(@"He lives in New York City and has his own phone number.");
        [person setCity:@"New York City"];
        [person setPhoneNumber:@"718-123-4567"];
        
        NSLog(@"Robert met Jane.");
        
        Person *person2 = [[Person alloc] init];
        [person2 setName:@"Jane"];
        [person2 setCity:@"Chicago"];
        
        BOOL result = [person checkSameCity:person2];
        
        NSLog(@"Does she live in the same city as him? %s", result ? "Yes!":"No...");
        
        NSLog(@"Then Robert met Vanessa. She has a phone number too. Do they live in the same city?");
        
        Person *person3 = [[Person alloc] init];
        [person3 setName:@"Vanessa"];
        [person3 setPhoneNumber:@"718-123-4567"];
        [person3 setCity:@"New York City"];
        
        BOOL result2 =[person checkSameCity:person3];
        
        NSLog(@"%s", result2 ? "Yes!":"No...");
        
        NSLog(@"Robert and Vanessa have a child named Bunny who has the same phone number and city as they do.");
        
        Person *child = [person registerChild];
        
        [child setName:@"Bunny"];
        BOOL result3 = [child checkSameCity:person];
        
        NSLog(@"%s", result3 ? "Yes!":"No...");
        
    }
    return 0;
}
