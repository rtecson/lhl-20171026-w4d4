//
//  School+CoreDataProperties.h
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "School+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface School (CoreDataProperties)

+ (NSFetchRequest<School *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Student *> *student;

@end

@interface School (CoreDataGeneratedAccessors)

- (void)addStudentObject:(Student *)value;
- (void)removeStudentObject:(Student *)value;
- (void)addStudent:(NSSet<Student *> *)values;
- (void)removeStudent:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
