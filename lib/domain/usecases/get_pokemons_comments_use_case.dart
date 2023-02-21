import 'package:pokeboti/domain/entities/pokemon_comments.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

abstract class GetPokemonCommentsUseCase {
  Future<PokemonComments?> call({required String pokemonId});
}

class GetPokemonCommentsUseCaseImp implements GetPokemonCommentsUseCase{
  GetPokemonCommentsUseCaseImp({required this.pokemonRepository});
  final PokemonRemoteRepository pokemonRepository;
  
  @override
  Future<PokemonComments?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonsComments(pokemonId: pokemonId);
  }
}