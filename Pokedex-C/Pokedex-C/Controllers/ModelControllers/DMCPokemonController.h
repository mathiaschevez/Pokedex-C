//
//  DMCPokemonController.h
//  Pokedex-C
//
//  Created by Mathias on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMCPokemon.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMCPokemonController : NSObject

//static func fetchPokemon(searchTerm: String, completion: (DMCPokemon) -> Void)
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^) (DMCPokemon *))completion;

+ (void)fetchImageForPokemon:(DMCPokemon *)pokemon completion:(void (^) (UIImage *))completion;
@end

NS_ASSUME_NONNULL_END
