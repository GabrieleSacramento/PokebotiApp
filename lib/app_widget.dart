import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeboti/domain/entities/pokemon.dart';
import 'package:pokeboti/presentation/pokemon_ability/cubit/pokemon_abilities_cubit.dart';
import 'package:pokeboti/presentation/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokeboti/presentation/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokeboti/presentation/pokemon_list/cubit/pokemon_list_cubit.dart';
import 'package:pokeboti/presentation/pokemon_list/pokemon_page.dart';
import 'package:pokeboti/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';
import 'package:pokeboti/presentation/pokemons_comments/cubit/pokemon_comments_cubit.dart';
import 'package:pokeboti/presentation/splash_screen.dart';
import 'package:pokeboti/locator.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon APP',
        theme: ThemeData(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        routes: {
          "/": (context) => const SplashScreenPage(),
          "/pokemon-page": (context) => BlocProvider(
                create: (context) => locator.get<PokemonListCubit>(),
                child: const PokemonListPage(),
              ),
          "/pokemon-detail-page": (context) => PokemonDetailsPage(
                pokemonDetailCubit: locator.get<PokemonDetailCubit>(),
                pokemon: ModalRoute.of(context)!.settings.arguments as Pokemon,
                pokemonCommentsCubit: locator.get<PokemonCommentCubit>(),
                pokemonAbilitiesCubit: locator.get<PokemonAbilitiesCubit>(),
                // pokemonRatingCubit: locator.get<PokemonRatingCubit>(),
                
              ),
        },
      ),
    );
  }
}
