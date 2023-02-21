import 'package:dio/dio.dart';
import 'package:pokeboti/domain/entities/pokemon_abilities.dart';
import 'package:pokeboti/domain/entities/pokemon_comments.dart';
import 'package:pokeboti/data/pokemon_mapper.dart';
import 'package:hive/hive.dart';
import 'package:pokeboti/domain/entities/pokemon_rating.dart';
import 'package:pokeboti/settings/hive_config.dart';

import '../entities/pokemon.dart';
import '../entities/pokemon_detail.dart';


const COMMENT_IDENTIFIER = 'comments';
abstract class PokemonRemoteRepository {
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList});
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId});
  Future<PokemonComments?> getPokemonsComments({required String pokemonId});
  Future<PokemonAbilities?> getPokemonsAbilities({required String pokemonId});
  Future<PokemonRating?> getRating({required String pokemonId});
  void saveComment({required String pokemonId, required String comments});
  void saveRating({required PokemonRating pokemonRating});

}

class PokemonRepository implements PokemonRemoteRepository {
  var box = Hive.box(AppConstants.ratingHiveBoxName);

  var dio  = Dio();
  
  @override
  Future<PokemonList?> getPokemons({PokemonList? currentPokemonList}) async {
    try {
      var url = 'https://pokeapi.co/api/v2/pokemon/?limit=15&offset=10';
      if(currentPokemonList != null) {
        url = currentPokemonList.next;
      }
      final response  = await dio.get(url);
      if(response.statusCode == 200) {
        final pokemonList  = PokemonMapper.pokemonListFromJson(response.data);
        return pokemonList;
      }
    } 
    catch(error) {
      throw Exception('Erro ao carregar dados da api');
    }
    return null;
  }
  
  @override
  Future<PokemonDetails?> getPokemonDetails({required String pokemonId}) async{
    try {
      var url = 'https://pokeapi.co/api/v2/pokemon/$pokemonId/';
      
      final response  = await dio.get(url);
      if(response.statusCode == 200) {
        final pokemonDetails  = PokemonDetails.fromJson(response.data);
        return pokemonDetails;
      }
    } 
    catch(error) {
      throw Exception('Erro ao carregar dados da api');
    }
    return null;
  }

  @override 
  Future<PokemonComments?> getPokemonsComments({required String pokemonId}) async{
    try{
      final comments =  await box.get(pokemonId + COMMENT_IDENTIFIER);

      if (comments == null) {
        return PokemonComments(id: pokemonId, comments: []);
      }
      return PokemonComments(id: pokemonId, comments: comments['comments']);
    } catch (error) {
      rethrow;
    }

    }

    @override
    void saveComment({required String pokemonId, required String comments}) async{
      try{
        final existentCommments =  await getPokemonsComments(pokemonId: pokemonId);
        await box.put(pokemonId + COMMENT_IDENTIFIER, {
          "comments": [...existentCommments!.comments, comments]
        });
      } catch(error){
        rethrow;
      }
    }

    @override
  Future<PokemonRating> getRating({required String pokemonId}) async {
    try {
      final rating = await box.get(pokemonId);

      if (rating == null) {
        return PokemonRating(id: '', rating: 0);
      }
      return PokemonRating(id: pokemonId, rating: rating['rating']);
    } catch (error) {
      rethrow;
    }
  }

     @override
  void saveRating({required PokemonRating pokemonRating}) async {
    try {
      await box.put(
        pokemonRating.id,
        {
          'rating': pokemonRating.rating,
        },
      );
    } catch (error) {
      rethrow;
    }
  }
    
      @override
      Future<PokemonAbilities?> getPokemonsAbilities({required String pokemonId}) async{
        try {
      var url = 'https://pokeapi.co/api/v2/ability/$pokemonId/';
      
      final response  = await dio.get(url);
      if(response.statusCode == 200) {
        final pokemonAbilities  = PokemonAbilities.fromJson(response.data);
        return pokemonAbilities;
      }
    } 
    catch(error) {
      throw Exception('Erro ao carregar dados da api');
    }
    return null;
      }
  }