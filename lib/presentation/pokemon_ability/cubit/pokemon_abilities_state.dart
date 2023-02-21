part of 'pokemon_abilities_cubit.dart';

@immutable
abstract class PokemonAbilitiesState {}

class PokemonAbilitiesInitial extends PokemonAbilitiesState {}

class PokemonAbilitiesLoading extends PokemonAbilitiesState {}

class PokemonAbilitiesSuccess extends PokemonAbilitiesState {
  PokemonAbilitiesSuccess({required this.pokemonAbilities});
  final PokemonAbilities pokemonAbilities;

}