part of 'pokemon_comments_cubit.dart';

@immutable
abstract class PokemonCommentsState {}

class PokemonCommentsInitial extends PokemonCommentsState {}

class PokemonCommentsLoading extends PokemonCommentsState {}

class PokemonCommentsEmpty extends PokemonCommentsState {}

class PokemonCommentsSuccess extends PokemonCommentsState {
  final PokemonComments pokemonComments;

  PokemonCommentsSuccess({
    required this.pokemonComments
  });
}
