//
//  School+CoreDataProperties.h
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
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
