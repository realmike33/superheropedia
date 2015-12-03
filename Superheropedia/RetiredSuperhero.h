//
//  Superhero.h
//  Superheropedia
//
//  Created by Michael Moss on 11/9/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RetiredSuperhero : NSObject
@property NSString *name;
@property NSString *textDescription;
@property NSString *avatarUrl;
-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
+(void)retrieveSuperHeroWithCompletion:(void(^)(NSArray *))complete;
-(void)getImageWithCompletion:(void(^)(NSData *))complete;
@end
