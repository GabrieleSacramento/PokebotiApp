import 'package:get_it/get_it.dart';
import 'package:pokeboti/domain/usecases/get_pokemons_abilities_use_case.dart';
import 'package:pokeboti/domain/usecases/get_pokemons_use_case.dart';
import 'package:pokeboti/domain/repositories/pokemon_repositorie.dart';
import 'package:pokeboti/presentation/pokemon_ability/cubit/pokemon_abilities_cubit.dart';
import 'package:pokeboti/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';
import 'package:pokeboti/domain/usecases/save_comments_use_case.dart';
import 'package:pokeboti/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';

import 'domain/usecases/get_pokemons_comments_use_case.dart';
import 'domain/usecases/get_pokemons_details_use_case.dart';
import 'domain/usecases/get_pokemons_rating_use_case.dart';
import 'domain/usecases/save_pokemons_rating_use_case.dart';
import 'presentation/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'presentation/pokemons_comments/cubit/pokemon_comments_cubit.dart';

//O GetIt funciona como um localizador de serviço
//permitindo o registro e o gerenciamento das instancias
//das classes de serviço
//Auxilia também na ingeção de dependencia

final locator = GetIt.instance;

//Cria um método que vai registrar as dependencias
void registerDependencies() {
  //Somente quando utilizar o objeto tipado o registerLazySingleton
  //vai criar uma instancia
  //O registerLazySingleton permite o reuso do objeto
  locator.registerFactory<PokemonRemoteRepository>(
    () => PokemonRepository(),
  );

  locator.registerFactory<GetPokemonsUseCase>(
    () => GetPokemonsUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<PokemonListCubit>(
    () => PokemonListCubit(
      getPokemonsUseCase: locator.get<GetPokemonsUseCase>(),
    ),
  );

  locator.registerFactory<GetPokemonDetailsUseCase>(
    () => GetPokemonDetailsUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<PokemonDetailCubit>(
    () => PokemonDetailCubit(
      getPokemonDetailsUseCase: locator.get<GetPokemonDetailsUseCase>(),
    ),
  );

  locator.registerFactory<PokemonCommentCubit>(
    () => PokemonCommentCubit(
      getPokemonCommentsUseCase: locator.get<GetPokemonCommentsUseCase>(),
      savePokemonCommentsUseCase: locator.get<SavePokemonComments>(),
    ),
  );

  locator.registerFactory<SavePokemonComments>(
    () => SavePokemonCommentsImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonCommentsUseCase>(
    () => GetPokemonCommentsUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonsAbilitiesUseCase>(
      () => GetPokemonsAbilitiesUseCaseImp(
            pokemonRepository: locator.get<PokemonRemoteRepository>(),
          ));

  locator.registerFactory<PokemonAbilitiesCubit>(
    () => PokemonAbilitiesCubit(
      getPokemonAbilitiesUseCase: locator.get<GetPokemonsAbilitiesUseCase>(),
    ),
  );

  // locator.registerFactory<PokemonRatingCubit>(
  //   () => PokemonRatingCubit(
  //     getPokemonRatingUseCase: locator.get<GetPokemonRatingUseCase>(),
  //     savePokemonRatingUseCase: locator.get<SavePokemonRatingUseCase>(),
  //   ),
  // );

  // locator.registerFactory<SavePokemonRatingUseCase>(
  //   () => SavePokemonRatingUseCaseImpl(
  //     pokemonRepository: locator.get<PokemonRepository>(),
  //   ),
  // );

  locator.registerFactory<GetPokemonRatingUseCase>(
    () => GetPokemonRatingUseCaseImp(
      pokemonRepository: locator.get<PokemonRepository>(),
    ),
  );

}
