//
//  DVMPokemon.h
//  Pokedex-C
//
//  Created by Karl Pfister on 5/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *>*abilities;
@property (nonatomic, copy, readonly) NSString *spritePath;

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *>*)abilities
                         spritePath:(NSString *)spritePath;

@end

@interface DVMPokemon (JSONConvertable)
- (DVMPokemon *)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END

