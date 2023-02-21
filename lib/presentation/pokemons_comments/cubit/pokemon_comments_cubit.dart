import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeboti/domain/entities/pokemon_comments.dart';
import 'package:pokeboti/domain/usecases/get_pokemons_comments_use_case.dart';
import 'package:pokeboti/domain/usecases/save_comments_use_case.dart';

part 'pokemon_comments_state.dart';

class PokemonCommentCubit extends Cubit<PokemonCommentsState> {
  final SavePokemonComments savePokemonCommentsUseCase;
  final GetPokemonCommentsUseCase getPokemonCommentsUseCase;
  PokemonCommentCubit(
      {required this.savePokemonCommentsUseCase,
      required this.getPokemonCommentsUseCase})
      : super(PokemonCommentsInitial());

  saveComment({required String pokemonId, required String comment}) async {
    try {
      savePokemonCommentsUseCase(
        pokemonId: pokemonId,
        comments: comment,
      );
    } catch (error) {
      rethrow;
    }
  }

  getComments({required String pokemonId}) async {
    try {
      emit(PokemonCommentsLoading());
      final pokemonComments =
          await getPokemonCommentsUseCase(pokemonId: pokemonId);
      if (pokemonComments!.comments.isEmpty) {
        emit(PokemonCommentsEmpty());
        return;
      }
      emit(PokemonCommentsSuccess(pokemonComments: pokemonComments));
    } catch (error) {
      rethrow;
    }
  }
}
