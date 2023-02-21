// import 'package:pokeboti/domain/entities/pokemon_rating.dart';
// import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

// abstract class SavePokemonRatingUseCase {
//   void call({
//     required String pokemonId,
//     required double pokemonRating,
//   });
// }

// class SavePokemonRatingUseCaseImpl implements SavePokemonRatingUseCase {
//   final PokemonRepository pokemonRepository;

//   SavePokemonRatingUseCaseImpl({required this.pokemonRepository});
//   @override
//   Future<void> call({
//     required String pokemonId,
//     required double pokemonRating,
//   }) async {
//     pokemonRepository.saveRating(
//         pokemonRating: PokemonRating(
//       id: pokemonId,
//       rating: pokemonRating,
//     ));
//   }
// }