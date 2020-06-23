//
//  DMCPokemon.h
//  Pokedex-C
//
//  Created by Mathias on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMCPokemon : NSObject
//copy for NSStrings.
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSString *spritePath;
@property (nonatomic, copy, readonly) NSArray<NSString *>*abilities;

- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)indentifier
                         spritePath:(NSString *)spritePath
                          abilities:(NSArray<NSString *> *)abilities;

/*
 1) The method type: Class (+) or Instance (-)
 2) Return type. In an initializer we return the instance type, or DMCPokemon in this instance
 3) Method name (initializer) with the first parameter's external name
 4) First paramater's type
 5) First parameter's pointer
 6) First parameter's internal name
 7) Second parameter's external name
 8) Second parameter's type
 9) Second paramater's internal name
 10) Third parameter's external name
 11) Third parameter's type
 12) Third parameter's pointer
 13) Third parameter's internal name
 14) Fourth parameter's external name
 15) Fourth parameter's type
 16) Generic typecasting for the fourth parameter (<>)
 17) Type for the generic typecasting (NSString)
 18) Pointer to the type for typecasting
 19) Fourth parameter's pointer
 20) Fourth parameter's internal name
 21) Semi-colon
*/

@end

//Convenience init

@interface DMCPokemon (JSONConvertable)
- (DMCPokemon *)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
