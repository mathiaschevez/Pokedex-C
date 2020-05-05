//
//  DVMPokemonViewController.swift
//  Pokedex-C
//
//  Created by Karl Pfister on 5/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class DVMPokemonViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    @IBOutlet weak var pokemonSpriteImageView: UIImageView!


    var pokemon: DVMPokemon?
    var spriteImage: UIImage?

    override func viewWillAppear(_ animated: Bool) {
        fetchDefaultPokemon()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }

    func updateViews() {
         guard let pokemon = pokemon, let sprite = spriteImage else {return}
        pokemonNameLabel.text = pokemon.name
        pokemonIDLabel.text = "ID: \(pokemon.identifier)"
        pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
        pokemonSpriteImageView.image = sprite
    }

    func fetchDefaultPokemon() {
        DVMPokemonController.fetchPokemon(forSearchTerm: "12") { (pokemon) in
            DVMPokemonController.fetchSpriteImage(for: pokemon) { (sprite) in
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                    self.spriteImage = sprite
                    self.updateViews()
                }
            }
        }
    }
}

extension DVMPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DVMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            DVMPokemonController.fetchSpriteImage(for: pokemon) { (sprite) in
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                    self.spriteImage = sprite
                    self.updateViews()
                }
            }
        }
    }
}
