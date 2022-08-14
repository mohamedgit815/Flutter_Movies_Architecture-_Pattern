import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies_app/Core/Services/service_locator.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_bloc.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/movie_event.dart';
import 'package:flutter_movies_app/Movies/Presentation/Controller/prov_state.dart';
import 'package:flutter_movies_app/Movies/Presentation/Widgets/now_playing_widget.dart';
import 'package:flutter_movies_app/Movies/Presentation/Widgets/popular_widget.dart';
import 'package:flutter_movies_app/Movies/Presentation/Widgets/top_rated_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<MovieBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedEvent()) ,
      child: Scaffold(
        appBar: AppBar() ,
        backgroundColor: Colors.grey.shade900 ,
        body: SingleChildScrollView(
          key: const Key('movieScrollView') ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              const NowPlayingWidget() ,

              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,

              const PopularWidget() ,

              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ) ,

              const TopRatedWidget() ,

              const SizedBox(height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}