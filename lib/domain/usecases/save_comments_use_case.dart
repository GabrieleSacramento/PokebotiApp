import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

abstract class SavePokemonComments {
  void call({
    required String pokemonId,
    required String comments,
  });
}

class SavePokemonCommentsImp implements SavePokemonComments {
  SavePokemonCommentsImp({required this.pokemonRepository});
  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<void> call({
    required String pokemonId,
    required String comments,
  }) async{
    pokemonRepository.saveComment(pokemonId: pokemonId, comments: comments);
  }
}
