import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ForthScreen extends StatelessWidget {
  ForthScreen({super.key});
  String text2 =
      'They had the artsy, rustic venue, the tailored dress and a guest list including about 150 of their closest friends and family. But the pandemic had other plans, forcing Carly Chalmers and Mitchell Gauvin to make a difficult decision about their wedding..';
  String text =
      'A World Health Organization official said Monday it is reclassifying the highly contagious triple-mutant Covid variant spreading in India as a “variant of concern,” indicating that it’s become a.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Row(children: [
                  Icon(Icons.arrow_back_ios),
                  Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Text(
                      "Hot Updates",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 217, 81, 63),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/man2.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Monday, 10 May 2021"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "WHO classifies triple-mutant Covid variant from India as global health risk",
                style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                    height: 2),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: ReadMoreText(
                  text,
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: ' less',
                  lessStyle: const TextStyle(color: Colors.blue),
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Published by Berkeley Lovelace Jr.",
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/dress.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Sunday, 9 May 2021"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Published by Berkeley Lovelace Jr.",
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: ReadMoreText(
                  text2,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'less',
                  lessStyle: const TextStyle(color: Colors.blue),
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Published by Kristen Rogers",
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
