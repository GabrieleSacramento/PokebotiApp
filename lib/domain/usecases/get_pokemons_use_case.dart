import 'package:pokeboti/domain/entities/pokemon.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';

//Declara uma classe abstrata que declara um Future que 
//chama a lista atual de pokemons
abstract class GetPokemonsUseCase {
  Future<PokemonList?> call({PokemonList? currentPokemonList});
}


class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  GetPokemonsUseCaseImp({required this.pokemonRepository});

 
  final PokemonRemoteRepository pokemonRepository;
  @override
  Future<PokemonList?> call({PokemonList? currentPokemonList}) async {
    //Cria uma lista de pokemonList vazia
    List<Pokemon> pokemonList = [];
    //Cria uma variavel que vai aguardar o retorno da api e vai
    //pegar os pokemnos passando a lista atual de pokemons
    final result = await pokemonRepository.getPokemons(
        currentPokemonList: currentPokemonList);

    //Verifica se a lista atual é diferente de nulo 
    //e retorna a lista vazia adicionando os pokemons
    //atrasves do método addAll que pega a lista atual de pokemonList
    //e os pokemons
    if (currentPokemonList != null) {
      pokemonList.addAll(currentPokemonList.pokemons);
    }
    //Verifica se o resultado é diferente de nulo e não é vazio
    //e adiciona mais pokemons
     if (result != null && result.pokemons.isNotEmpty) {
      pokemonList.addAll(result.pokemons);
    }

    return PokemonList(
      count: result!.count,
      next: result.next,
      previous: result.previous,
      pokemons: pokemonList,
    );
  }
}
