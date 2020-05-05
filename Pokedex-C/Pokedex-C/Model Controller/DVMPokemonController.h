//
//  DVMPokemonController.h
//  Pokedex-C
//
//  Created by Karl Pfister on 5/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPokemon.h"
#import <UIKit/UIKit.h>



@interface DVMPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion: (void (^) (DVMPokemon *pokemon))completion;

+ (void)fetchSpriteImageForPokemon:(DVMPokemon *)pokemon completion: (void(^) (UIImage *))completion;

@end


