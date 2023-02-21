
import 'package:pokeboti/domain/entities/pokemon.dart';

//Faz o mapeamento dos pokemons a partir de uma classe abstrata
//pegando o json e transformando em objeto
abstract class PokemonMapper {
  static PokemonList pokemonListFromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'], 
      next: json['next'], 
      previous: json ['previous'], 
      pokemons: 
      //Pega o resultado da lista mapeia os elementos e retorna uma lista dos objetos desejados, 
        List.from(json['results']).map((e) => Pokemon.fromJson(e)).toList(),
      );
  }
}