//
//  Superheros+CoreDataProperties.h
//  Superheropedia
//
//  Created by Michael Moss on 11/11/15.
//  Copyright © 2015 Mike. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Superheros.h"

NS_ASSUME_NONNULL_BEGIN

@interface Superheros (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *textDescription;
@property (nullable, nonatomic, retain) NSString *requestURL;

@end

NS_ASSUME_NONNULL_END
