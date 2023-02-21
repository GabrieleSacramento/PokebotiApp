import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:poke_design_system/theme/pokeds_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pokeboti/domain/entities/pokemon.dart';
import 'package:pokeboti/presentation/pokemon_ability/cubit/pokemon_abilities_cubit.dart';
import 'package:pokeboti/presentation/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokeboti/presentation/pokemon_detail/widgets/comments_widget.dart';
import 'package:pokeboti/presentation/pokemon_detail/widgets/poke_base_stats_widget.dart';
import 'package:pokeboti/presentation/pokemon_rating/cubit/pokemon_rating_cubit.dart';
import 'package:pokeboti/presentation/pokemons_comments/cubit/pokemon_comments_cubit.dart';
import 'package:shimmer/shimmer.dart';

class PokemonDetailsPage extends StatelessWidget {
  PokemonDetailsPage({
    super.key,
    required this.pokemon,
    required this.pokemonDetailCubit,
    required this.pokemonCommentsCubit,
    required this.pokemonAbilitiesCubit,
    // required this.pokemonRatingCubit
  });

  final PokemonDetailCubit pokemonDetailCubit;
  final PokemonCommentCubit pokemonCommentsCubit;
  final PokemonAbilitiesCubit pokemonAbilitiesCubit;
  // final PokemonRatingCubit pokemonRatingCubit;
  final Pokemon pokemon;

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder:
              ((BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.r,
                floating: true,
                centerTitle: false,
                backgroundColor: PokedsColors.primaryColor,
                pinned: true,
                title: Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h, right: 30.h),
                          child: Image.asset(
                              'assets/images/transparent_pokeball.png'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.h, right: 16.h),
                          child: Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id}.png',
                            height: 190.h,
                            width: 190.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => pokemonDetailCubit
                  ..getPokemonDetails(pokemonId: pokemon.id),
              ),
              BlocProvider(
                create: (context) => pokemonAbilitiesCubit
                  ..getPokemonsAbilities(pokemonId: pokemon.id),
              ),
              BlocProvider(
                create: (context) =>
                    pokemonCommentsCubit..getComments(pokemonId: pokemon.id),
              ),
          //     BlocProvider(
          //   create: (context) =>
          //       pokemonRatingCubit..getPokemonRating(pokemonId: pokemon.id),
          // ),
            ],
            child: SingleChildScrollView(
              child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
                  builder: (context, state) {
                if (state is PokemonDetailsSucess) {
                  return Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 24.sp, maxWidth: 80.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: PokedsColors.primaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    state.pokemonDetails.types[0].type.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                            color: PokedsColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.h, right: 20.h),
                              child: Column(
                                children: [
                                  Text(
                                    '${state.pokemonDetails.weight} kg',
                                    style: TextStyle(
                                      color: const Color(
                                        0xff212121,
                                      ),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 35.h,
                              color: PokedsColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    '${state.pokemonDetails.height} m',
                                    style: TextStyle(
                                      color: const Color(
                                        0xff212121,
                                      ),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 35.h,
                              color: PokedsColors.primaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    state.pokemonDetails.moves[0].move.name,
                                    style: TextStyle(
                                      color: const Color(
                                        0xff212121,
                                      ),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    'Move',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        BlocBuilder<PokemonAbilitiesCubit,
                            PokemonAbilitiesState>(
                          builder: (context, state) {
                            if (state is PokemonAbilitiesSuccess) {
                              return Column(
                                children: [
                                  Text(
                                    key: const Key('ability'),
                                    'Ability',
                                    style: TextStyle(
                                      color: PokedsColors.primaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      state.pokemonAbilities.effectEntries[1]
                                          .effect,
                                      style: TextStyle(
                                        color: const Color(0xff212121),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 23.h,
                                  ),
                                ],
                              );
                            }
                            return Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Text(
                                'Loading abilities...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                        Text(
                          'Base Stats',
                          style: TextStyle(
                            color: PokedsColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        for (var stat in state.pokemonDetails.stats) ...[
                          BaseStatsWidget(
                            name: stat.stat.name,
                            value: stat.baseStat,
                          )
                        ],
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'How much do you like this pokemon?',
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.w, right: 40.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Form(
                                key: formKey,
                                child: TextFormField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    hintText: 'Comments',
                                    hintStyle: TextStyle(
                                      fontSize: 12.h,
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.w, right: 40.w),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: PokedsColors.primaryColor,
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await pokemonCommentsCubit.saveComment(
                                    pokemonId: pokemon.id,
                                    comment: commentController.text,
                                  );
                                  await pokemonCommentsCubit.getComments(
                                      pokemonId: pokemon.id);
                                }
                              },
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<PokemonCommentCubit, PokemonCommentsState>(
                          builder: (context, state) {
                            if (state is PokemonCommentsSuccess) {
                              return CommentsWidget(
                                  pokemonComments: state.pokemonComments);
                            } else {
                              return Container();
                            }
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_iwmd6pyr.json',
                      width: 45.r,
                      height: 45.r,
                    ),
                  );
                }
              }),
            ),
          )),
    );
  }
}
