import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/data/models/get_news_model.dart';
import 'package:news_app/second_screen.dart';
import 'package:news_app/third_screen.dart';

import 'data/cubites/cubit/get_news_cubit.dart';

class newsscreen extends StatelessWidget {
  newsscreen({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),

                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 107, 105, 105),
                      ),
                      hintText: "  Dogecoin to the Moon...",
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'Nunito'),

                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 178, 177, 183)),
                      ),
                      // border: ,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 201, 195, 195)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // border:
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 217, 81, 63)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  "assets/Group 38 (2).svg",
                  height: 16,
                  width: 13,
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                TextButton(
                  onPressed: () async {
                    context.read<GetNewsCubit>().getNews();
                  },
                  child: Text(
                    ' Lastes News',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 110,
                ),
                Text(
                  ' See All',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 11, 4, 214),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_right_alt),
                  color: Color.fromARGB(255, 11, 4, 214),
                ),
              ],
            ),
          ),
          BlocBuilder<GetNewsCubit, GetNewsState>(
            builder: (context, state) {
              if (state is GetNewsInitial) {
                return Text("Please press the button to get news");
              } else if (state is GetNewsLoading) {
                return CircularProgressIndicator();
              } else if (state is GetNewsSuccess) {
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.response.articles.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          ThirdScreen(
                                        index: index,
                                      ),
                                    ),
                                  );
                                }
                                ;
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width *
                                    380 /
                                    200,
                                height: MediaQuery.of(context).size.height *
                                    300 /
                                    850,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(state.response
                                            .articles[index].urlToImage ??
                                        "https://media.istockphoto.com/id/1264074047/vector/breaking-news-background.jpg?s=612x612&w=0&k=20&c=C5BryvaM-X1IiQtdyswR3HskyIZCqvNRojrCRLoTN0Q="),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              state.response.articles[index]
                                                      .author ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              state.response.articles[index]
                                                  .description,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            state.response.articles[index]
                                                    .publishedAt ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("Somethinge went wrone"),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
