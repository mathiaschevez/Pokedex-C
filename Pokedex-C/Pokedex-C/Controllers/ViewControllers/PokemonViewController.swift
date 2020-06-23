//
//  PokemonViewController.swift
//  Pokedex-C
//
//  Created by Mathias on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIDLabel: UILabel!
    @IBOutlet weak var pokeAbilitiesLabel: UILabel!
    
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchDefaultPokemon()
    }
    
    //MARK: - Methods
    func fetchSpriteAndUpdateViews(pokemon: DMCPokemon) {
        DMCPokemonController.fetchImage(for: pokemon) { (image) in
            DispatchQueue.main.async {
                self.pokeImageView.image = image
                self.pokeNameLabel.text = pokemon.name.capitalized
                self.pokeIDLabel.text = "ID: \(pokemon.identifier)"
                self.pokeAbilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
   
    func fetchDefaultPokemon() {
        DMCPokemonController.fetchPokemon(forSearchTerm: "199") { (pokemon) in
            self.fetchSpriteAndUpdateViews(pokemon: pokemon)
        }
    }
}

//MARK: - SearchBar Delegate Extension
extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        DMCPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            self.fetchSpriteAndUpdateViews(pokemon: pokemon)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}
