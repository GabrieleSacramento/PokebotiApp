import 'package:pokeboti/domain/entities/pokemon_abilities.dart';
import 'package:pokeboti/domain/entities/pokemon_rating.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

abstract class GetPokemonRatingUseCase {
  Future<PokemonRating?> call({required String pokemonId});
}

class GetPokemonRatingUseCaseImp implements GetPokemonRatingUseCase {
  GetPokemonRatingUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override 
  Future<PokemonRating?> call({required String pokemonId}) async {
    return await pokemonRepository.getRating(pokemonId: pokemonId);
  }
}