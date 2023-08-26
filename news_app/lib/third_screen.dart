import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:news_app/data/cubites/cubit/get_news_cubit.dart';

class ThirdScreen extends StatelessWidget {
  int index;
  ThirdScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 217, 81, 63),
          onPressed: () {},
          child: SvgPicture.asset("assets/fav.svg")),
      body: BlocBuilder<GetNewsCubit, GetNewsState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.49,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state
                                    .response.articles[index].urlToImage ??
                                "https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q="),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 5),
                height: MediaQuery.of(context).size.height * 0.55,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Text(
                        state.response.articles[index].content ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'NUnito'),
                      )
                    ]),
                  ),
                ),
              ),
              Positioned(
                  top: 280,
                  child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 160,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 213, 213),
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  state.response.articles[index].publishedAt ??
                                      "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'NUnito'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.response.articles[index].description ??
                                      "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'NUnito'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.response.articles[index].author ?? "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'NUnito'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))) ////
            ],
          );
        },
      ),
    );
  }
}
