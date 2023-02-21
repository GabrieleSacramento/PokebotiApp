import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeboti/domain/entities/pokemon.dart';
import 'package:pokeboti/domain/usecases/get_pokemons_use_case.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit({required this.getPokemonsUseCase})
      : super(PokemonListInitial());

  //Instancia o usecase que contém a referencia direta
  //do repositório 
  final GetPokemonsUseCase getPokemonsUseCase;

  //Cria um método que pega os pokemons da lista atual de pokemnos
  //de forma assincrona
  void getPokemons({PokemonList? currentPokemonList}) async {
    //Cria uma variavel que vai aguardar o retorno do usecase
    //que vai receber a lista atual de pokemons
    final result =
        await getPokemonsUseCase(currentPokemonList: currentPokemonList);
    //Se a lista atual de pokemons for diferente de nula e o resultado dos
    //pokemons não for vazio, será emitido um estado de sucesso
    if (result != null && result.pokemons.isNotEmpty) {
      emit(PokemonListSuccess(pokemonList: result));
    //Caso seja vazio será emitido um estado de erro
    } else {
      throw ('');
    }
  }
}

//final _pokemonRepo = PokemonRepository();

// getPokemonList() async{
//   final pokemons = await _pokemonRepo.getPokemons();
//   emit(PokemonListLoaded(pokemonList: pokemons!));
// }
