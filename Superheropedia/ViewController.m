//
//  ViewController.m
//  Superheropedia
//
//  Created by Michael Moss on 11/9/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ViewController.h"
#import "RetiredSuperhero.h"
#import "Superheros+CoreDataProperties.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *superHeroes;
@property NSManagedObjectContext *moc;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.superHeroes = [[NSMutableArray alloc] init];
//    [RetiredSuperhero retrieveSuperHeroWithCompletion:^(NSArray *sHeroes) {
//        self.superHeroes = [sHeroes mutableCopy];
//    }];
//
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}

-(void)setSuperHeroes:(NSMutableArray *)superHeroes{
    _superHeroes = superHeroes;
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.superHeroes.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    RetiredSuperhero *superHero = [self.superHeroes objectAtIndex:indexPath.row];
    cell.textLabel.text = superHero.name;
    cell.detailTextLabel.text = superHero.textDescription;
    [superHero getImageWithCompletion:^(NSData *data) {
        UITableViewCell *cellToUpdate = [self.tableView cellForRowAtIndexPath:indexPath];
        if(cellToUpdate){
            cell.imageView.image = [UIImage imageWithData:data];
            [cell layoutSubviews];
        }
    }];
    return cell;
}

-(void)load{
    
}


@end
