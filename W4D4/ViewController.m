//
//  ViewController.m
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "School+CoreDataClass.h"
#import "Student+CoreDataClass.h"
#import "AppDelegate.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<Person *> *persons;
@property (nonatomic, strong) NSArray<School *> *schools;
@property (nonatomic, strong) NSArray<Student *> *students;

@end


@implementation ViewController

- (IBAction)testArchiveUnarchiveButtonTapped:(UIButton *)sender {
    [self testArchiveUnarchive];
}

- (IBAction)testCoreDataButtonTapped:(UIButton *)sender {
    [self testCoreData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)testArchiveUnarchive {
    // Initialize persons array
    self.persons = [[NSMutableArray<Person *> alloc] init];
    
    // Create person objects
    Person *person = [[Person alloc] init];
    person.firstName = @"Joe";
    person.lastName = @"Smith";
    person.idNumber = @356;
    NSMutableSet<Pet *> *pets = [[NSMutableSet<Pet *> alloc] init];
    Pet *pet = [[Pet alloc] init];
    pet.name = @"Fifi";
    [pets addObject:pet];
    pet = [[Pet alloc] init];
    pet.name = @"Fifi2";
    [pets addObject:pet];
    person.pets = pets;
    [self.persons addObject:person];
    
    person = [[Person alloc] init];
    person.firstName = @"Jane";
    person.lastName = @"Smith";
    person.idNumber = @123;
    pets = [[NSMutableSet<Pet *> alloc] init];
    pet = [[Pet alloc] init];
    pet.name = @"Rufus";
    [pets addObject:pet];
    pet = [[Pet alloc] init];
    pet.name = @"Rufus2";
    [pets addObject:pet];
    person.pets = pets;
    [self.persons addObject:person];
    
    person = [[Person alloc] init];
    person.firstName = @"Rob";
    person.lastName = @"Jones";
    [self.persons addObject:person];
    
    person = [[Person alloc] init];
    person.firstName = @"Robyn";
    person.lastName = @"Jones";
    [self.persons addObject:person];
    
    NSLog(@"persons = %@", self.persons);
    
    // Encode persons array into NSData
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.persons];
    
    // Decode NSData back into array of Person objects
    NSArray<Person *> *unarchivedPersons = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"unarchivedPersons = %@", unarchivedPersons);
}

- (void)testCoreData {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSPersistentContainer *persistentContainer = appDelegate.persistentContainer;

    // Load schools and students from persistent storage
    NSError *error = nil;
    NSFetchRequest<School *> *fetchSchoolsRequest = [School fetchRequest];
//    fetchSchoolsRequest.predicate = [NSPredicate predicateWithFormat:@"ANY student.name == %@", @"Joe Smith"];
    self.schools = [persistentContainer.viewContext executeFetchRequest:fetchSchoolsRequest error:&error];
    error = nil;
    NSFetchRequest<Student *> *fetchStudentsRequest = [Student fetchRequest];
    self.students = [persistentContainer.viewContext executeFetchRequest:fetchStudentsRequest error:&error];
    
//    // View school objects
//    if (self.schools.count > 0) {
//        NSLog(@"schools[0].name = %@", self.schools[0].name);
//        NSLog(@"schools[0].student = %@", self.schools[0].student);
//        for (Student *student in self.schools[0].student) {
//            NSLog(@"student.name = %@", student.name);
//        }
//    }
    
//    // Create school managed object
//    School *school = [[School alloc] initWithContext:persistentContainer.viewContext];
//    school.name = @"Lighthouse Labs";
//    [appDelegate saveContext];

//    // Create student managed object
//    Student *student = [[Student alloc] initWithContext:persistentContainer.viewContext];
//    student.name = @"Joe Smith";
//    [student addSchoolObject:self.schools[0]];
//    [self.schools[0] addStudentObject:student];
//    [appDelegate saveContext];
}


@end
