

import 'package:pokeboti/domain/entities/pokemon_detail.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

abstract class GetPokemonDetailsUseCase {
  Future<PokemonDetails?> call({required String pokemonId});
}

class GetPokemonDetailsUseCaseImp implements GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCaseImp({required this.pokemonRepository});
  //Cria uma instancia do repositorio
  final PokemonRemoteRepository pokemonRepository;

  @override
  //Declara um future que vai retornar os detalhes do pokemon
  //atraves do Id 
  Future<PokemonDetails?> call({required String pokemonId}) {
    //retorna a instancia do repositorio pegando os detalhes atraves do Id
    return pokemonRepository.getPokemonDetails(pokemonId: pokemonId);
  }
}
