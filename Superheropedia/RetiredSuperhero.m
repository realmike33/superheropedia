//
//  Superhero.m
//  Superheropedia
//
//  Created by Michael Moss on 11/9/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "RetiredSuperhero.h"

@implementation RetiredSuperhero

-(void)getImageWithCompletion:(void(^)(NSData *))complete{
    NSURL *url = [NSURL URLWithString:self.avatarUrl];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(data);
        });
    }];
    
    [task resume];
}

+(void)retrieveSuperHeroWithCompletion:(void(^)(NSArray *))complete{
    
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mmios8week/superheroes.json"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *superHeros = [[NSMutableArray alloc] init];
        NSArray *array;
        
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for(NSDictionary *dictionary in array){
            RetiredSuperhero *superHero = [[RetiredSuperhero alloc] initWithDictionary:dictionary];
            [superHeros addObject:superHero];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(superHeros);
        });
    }];
    [task resume];
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.name = [dictionary objectForKey:@"name"];
        self.textDescription = [dictionary objectForKey:@"description"];
        self.avatarUrl = [dictionary objectForKey:@"avatar_url"];
    }
    return self;
}

@end
