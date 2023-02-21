import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeboti/domain/entities/pokemon_detail.dart';
import 'package:pokeboti/domain/usecases/get_pokemons_details_use_case.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit({required this.getPokemonDetailsUseCase}) : super(PokemonDetailInitial());

  //Instancia o usecase que contém a referencia direta
  //do repositório 
  final GetPokemonDetailsUseCase getPokemonDetailsUseCase;

    //Cria um método que vai pegar os detalhes do pokemon
    //através do Id de forma assincrona
    void getPokemonDetails({required String pokemonId}) async {
    //Cria uma variavel que vai aguardar o retorno do usecase que
    //recebe o pokemon atraves do Id
    final pokemonDetails = await getPokemonDetailsUseCase(pokemonId: pokemonId);
    //Verifica se esse retorno é diferente de nulo e se não é vazio e emite 
    //o estado desejado
    if (pokemonDetails != null && pokemonDetails.abilities.isNotEmpty) {
      emit(PokemonDetailsSucess(pokemonDetails: pokemonDetails));
    //Caso seja vazio será emitido um estado de erro
    } else {
      throw('');
    }
  }
}
