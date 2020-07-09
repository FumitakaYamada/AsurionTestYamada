//
//  MasterViewController.m
//  AsurionTestYamada
//
//  Created by Fumitaka Yamada on 2020/07/07.
//  Copyright © 2020 Fumitaka Yamada. All rights reserved.
//

#import "MasterViewController.h"
#import "Pet.h"
#import "PetTableViewCell.h"
#import "PetHeaderCellTableViewCell.h"

@interface MasterViewController ()

@property NSArray *pets;

@property bool isChatEnabled;
@property bool isCallEnabled;
@property NSString *workHours;

@end

@implementation MasterViewController

NSString * const configIdentifier = @"ConfigDownloadIdentifier";
NSString * const petIdentifier = @"PetDownloadIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PetHeaderCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"PetHeaderCellTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PetTableViewCell" bundle:nil] forCellReuseIdentifier:@"PetTableViewCell"];
    
    [self downloadConfigInfo];
    [self downloadPetInfo];
    
}

- (void)downloadConfigInfo {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:configIdentifier];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:configuration
                                  delegate:self
                             delegateQueue:nil];
    
    NSURL* requestURL = [NSURL URLWithString:@"https://drive.google.com/uc?export=download&id=1ZIocrS2sEyS1nReII0PjdHcE7KYkqZ9J"];
    NSURLSessionDownloadTask* task = [session downloadTaskWithURL:requestURL];
    [task resume];
}

- (void)downloadPetInfo {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:petIdentifier];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:configuration
                                  delegate:self
                             delegateQueue:nil];
    
    NSURL* requestURL = [NSURL URLWithString:@"https://drive.google.com/uc?export=download&id=1S3QmO-wbBoLQftGxloh2Cvz55-jQqB4F"];
    NSURLSessionDownloadTask* task = [session downloadTaskWithURL:requestURL];
    [task resume];
}

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData* data = [NSData dataWithContentsOfURL:location];
    if ([session.configuration.identifier isEqualToString:configIdentifier]) {
        if (data.length == 0) {
            NSLog(@"failed to download config");
            return;
        }
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&error];
        
        NSLog(@"config downloaded : %@, error :%@", json, error);
        
        NSDictionary *settings = json[@"settings"];
        
        self.workHours = settings[@"workHours"];
        self.isChatEnabled = settings[@"isChatEnabled"];
        self.isCallEnabled = settings[@"isCallEnabled"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        return;
    }
    
    if ([session.configuration.identifier isEqualToString:petIdentifier]) {
        if (data.length == 0) {
            NSLog(@"failed to download pet info");
            return;
        }
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&error];
        
        NSLog(@"pets downloaded : %@, error :%@", json, error);
        
        NSArray *petsJson = json[@"pets"];
        
        NSMutableArray *pets = [NSMutableArray array];
        
        for (NSDictionary *petDictionary in petsJson) {
            Pet *pet = [Pet new];
            
            pet.contentUrl = petDictionary[@"content_url"];
            pet.dateAddedString = petDictionary[@"date_added"];
            pet.imageUrl = petDictionary[@"image_url"];
            pet.title = petDictionary[@"title"];
            
            [pets addObject:pet];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.pets = pets;
            [self.tableView reloadData];
        });
        return;
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

#pragma mark - Table View

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return (self.isChatEnabled || self.isCallEnabled) ? 150 : 80;
        case 1:
            return 120;
            
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return self.pets.count;
            
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    switch (indexPath.section) {
        case 0:{
            PetHeaderCellTableViewCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"PetHeaderCellTableViewCell" forIndexPath:indexPath];
            if (self.workHours != nil) {
                headerCell.officeHoursLabel.text = [NSString stringWithFormat:@"Office Hours: %@", self.workHours];
            }
            
            cell = headerCell;
        }
            break;
        case 1:{
            PetTableViewCell *petCell = [tableView dequeueReusableCellWithIdentifier:@"PetTableViewCell" forIndexPath:indexPath];
            Pet *pet = self.pets[indexPath.row];
            
            [petCell setPet:pet];
            
            
            cell = petCell;
        }
            break;
        default:
            break;
    }

    
    return cell;
}

@end
