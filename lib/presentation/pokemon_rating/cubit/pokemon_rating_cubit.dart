// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:pokeboti/domain/entities/pokemon_rating.dart';
// import 'package:pokeboti/domain/usecases/get_pokemons_rating_use_case.dart';
// import 'package:pokeboti/domain/usecases/save_pokemons_rating_use_case.dart';

// part 'pokemon_rating_state.dart';

// class PokemonRatingCubit extends Cubit<PokemonRatingState> {
//   PokemonRatingCubit(
//       {required this.getPokemonRatingUseCase,
//       required this.savePokemonRatingUseCase})
//       : super(PokemonRatingInitial());

//   final GetPokemonRatingUseCase getPokemonRatingUseCase;
//   final SavePokemonRatingUseCase savePokemonRatingUseCase;

//   void getPokemonRating({required String pokemonId}) async {
//     emit(PokemonRatingLoading());
//     try {
//       final result = await getPokemonRatingUseCase(pokemonId: pokemonId);
//       emit(PokemonRatingSuccess(pokemonRating: result));
//     } catch (error) {
//       emit(PokemonRatingError());
//     }
//   }

//   savePokemonRating({
//     required String pokemonId,
//     required double pokemonRating,
//   }) async {
//     savePokemonRatingUseCase(
//       pokemonId: pokemonId,
//       pokemonRating: pokemonRating,
//     );
//   }
// }