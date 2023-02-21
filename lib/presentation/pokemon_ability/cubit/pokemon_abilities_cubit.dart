import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeboti/domain/entities/pokemon_abilities.dart';

import '../../../domain/usecases/get_pokemons_abilities_use_case.dart';


part 'pokemon_abilities_state.dart';

class PokemonAbilitiesCubit extends Cubit<PokemonAbilitiesState> {
  PokemonAbilitiesCubit({required this.getPokemonAbilitiesUseCase})
   : super(PokemonAbilitiesInitial());

  final GetPokemonsAbilitiesUseCase getPokemonAbilitiesUseCase;

  void getPokemonsAbilities({required String pokemonId}) async {
    emit(PokemonAbilitiesLoading());

    final pokemonAbilities  =  await getPokemonAbilitiesUseCase(pokemonId: pokemonId);

    if(pokemonAbilities != null && pokemonAbilities.effectEntries.isNotEmpty) {
      emit(PokemonAbilitiesSuccess(pokemonAbilities: pokemonAbilities));
    }else {
      throw("");
    }
  }
}
