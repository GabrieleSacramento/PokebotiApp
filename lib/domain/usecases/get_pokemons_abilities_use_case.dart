import 'package:pokeboti/domain/entities/pokemon_abilities.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

abstract class GetPokemonsAbilitiesUseCase {
  Future<PokemonAbilities?> call({required String pokemonId});
}

class GetPokemonsAbilitiesUseCaseImp implements GetPokemonsAbilitiesUseCase {
  GetPokemonsAbilitiesUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override 
  Future<PokemonAbilities?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonsAbilities(pokemonId: pokemonId);
  }
}