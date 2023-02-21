part of 'pokemon_detail_cubit.dart';

@immutable
abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailsLoading extends PokemonDetailState {}


class PokemonDetailsSucess extends PokemonDetailState {
  final PokemonDetails pokemonDetails;

  PokemonDetailsSucess({required this.pokemonDetails});
}