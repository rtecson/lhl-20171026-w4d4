//
//  ViewController.m
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "School+CoreDataClass.h"
#import "Student+CoreDataClass.h"
#import "AppDelegate.h"


@interface ViewController ()

// Private properties
@property (strong, nonatomic, readonly) NSString *filePath;
@property (nonatomic, strong) NSMutableArray<Person *> *persons;
@property (nonatomic, strong) NSArray<School *> *schools;
@property (nonatomic, strong) NSArray<Student *> *students;

@end


@implementation ViewController

// MARK: - IBActions

- (IBAction)testArchiveUnarchiveButtonTapped:(UIButton *)sender {
    [self testArchiveUnarchive];
}

- (IBAction)testCoreDataButtonTapped:(UIButton *)sender {
    [self testCoreData];
}

// MARK: - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

// MARK: - Getter methods

@synthesize filePath = _filePath;  // Synthesize instance variable for read-only property
- (NSString *)filePath
{
    // Lazy instantiation
    if (_filePath == nil) {
        // Get user's documents directory
        NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                   NSUserDomainMask,
                                                                   YES);
        NSString* documentsPath = [directories firstObject];
        
        // Generate filepath of file
        NSString *filePath = [documentsPath stringByAppendingPathComponent:@"appdata"];
        _filePath = filePath;
    }
    
    return _filePath;
}

// MARK: - Private methods

- (void)testArchiveUnarchive {
    // Initialize persons array
    self.persons = [[NSMutableArray<Person *> alloc] init];
    
    // Create person object, Joe Smith
    Person *person = [[Person alloc] init];
    person.firstName = @"Joe";
    person.lastName = @"Smith";
    person.idNumber = @356;
    
    // Create pet objects for Joe Smith
    NSMutableSet<Pet *> *pets = [[NSMutableSet<Pet *> alloc] init];
    Pet *pet = [[Pet alloc] init];
    pet.name = @"Fifi";
    [pets addObject:pet];
    pet = [[Pet alloc] init];
    pet.name = @"Fifi2";
    [pets addObject:pet];
    person.pets = pets;
    [self.persons addObject:person];
    
    // Create person object for Jane Smith
    person = [[Person alloc] init];
    person.firstName = @"Jane";
    person.lastName = @"Smith";
    person.idNumber = @123;
    
    // Create pets for Jane Smith
    pets = [[NSMutableSet<Pet *> alloc] init];
    pet = [[Pet alloc] init];
    pet.name = @"Rufus";
    [pets addObject:pet];
    pet = [[Pet alloc] init];
    pet.name = @"Rufus2";
    [pets addObject:pet];
    person.pets = pets;
    [self.persons addObject:person];
    
    // Create person object for Rob Jones
    person = [[Person alloc] init];
    person.firstName = @"Rob";
    person.lastName = @"Jones";
    [self.persons addObject:person];
    
    // Create person object for Robyn Jones
    person = [[Person alloc] init];
    person.firstName = @"Robyn";
    person.lastName = @"Jones";
    [self.persons addObject:person];
    
    NSLog(@"persons = %@", self.persons);
    
    // Encode persons array into NSData
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.persons];
    
    // Save to disk
    [self saveDataToDisk:data];
    
    // Load from disk
    NSData *loadedData = [self loadDataFromDisk];
    
    // Decode NSData back into array of Person objects
    NSArray<Person *> *unarchivedPersons = [NSKeyedUnarchiver unarchiveObjectWithData:loadedData];
    
    NSLog(@"unarchivedPersons = %@", unarchivedPersons);
}

- (void)saveDataToDisk:(NSData *)data
{
    // Check if file exists, delete if yes
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:self.filePath]) {
        NSError *error;
        BOOL success = [fm removeItemAtPath:self.filePath
                                      error:&error];
        if (!success) {
            NSLog(@"Could not delete file %@:%@ ", self.filePath, [error localizedDescription]);
            return;
        }
    }
    
    [data writeToFile:self.filePath
           atomically:YES];
}

- (NSData *)loadDataFromDisk
{
    // Check if file exists
    NSData *loadedData;
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:self.filePath]) {
        // File exists, load contents of file into loadedData
        loadedData = [NSData dataWithContentsOfFile:self.filePath];
    }
    return loadedData;
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
    
//    // Create school managed object
//    School *school = [[School alloc] initWithContext:persistentContainer.viewContext];
//    school.name = @"Lighthouse Labs";
//    [appDelegate saveContext];
//
//    // Create student managed object
//    Student *student = [[Student alloc] initWithContext:persistentContainer.viewContext];
//    student.name = @"Joe Smith";
//    [student addSchoolObject:self.schools[0]];
//    [self.schools[0] addStudentObject:student];
//    [appDelegate saveContext];
    
    // View school objects
    if (self.schools.count > 0) {
        NSLog(@"schools[0].name = %@", self.schools[0].name);
        NSLog(@"schools[0].student = %@", self.schools[0].student);
        for (Student *student in self.schools[0].student) {
            NSLog(@"student.name = %@", student.name);
        }
    }
}

@end
