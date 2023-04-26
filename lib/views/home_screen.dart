import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geeksynergy/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/welcome_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Company Details',
                  content: Column(
                    children: const [
                      Text('Geeksynergy Technologies Pvt Ltd'),
                      Text('Sanjayanagar, Bengaluru-56'),
                      Text('XXXXXXXXX09'),
                      Text('XXXXXX@gmail.com'),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.info)),
          IconButton(
              onPressed: () {
                authController.logout();
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (homeController) {
        var time;
        homeController.getMovieDetails();

        if (homeController.movies != null) {
          return ListView.builder(
              itemCount: homeController.movies.length,
              itemBuilder: (context, index) {
                final movieDetails = homeController.movies[index];
                int timestamp = movieDetails['releasedDate'];
                DateTime date =
                    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
                String formattedDate = DateFormat('d MMM').format(date);
                if (movieDetails['runTime'] == null) {
                  time = 0;
                } else {
                  time = movieDetails['runTime'];
                }
                return Container(
                  height: 220,
                  width: 100,
                  color: Colors.blue,
                  child: Card(
                    elevation: 5,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_drop_up,
                                        size: 35,
                                      )),
                                  Text('${movieDetails['voting']}'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        size: 35,
                                      )),
                                  const Text('Votes'),
                                ],
                              ),
                              Container(
                                height: 120,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${movieDetails['poster']}'))),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${movieDetails['title']}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Genre : ${movieDetails['genre']}'),
                                    Text(
                                      'Directer: ${movieDetails['director']}',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                    Text(
                                      'Starring :${movieDetails['stars']},',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text('$time Min'),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text('|'),
                                        ),
                                        Text('${movieDetails['language']}'),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Text('|'),
                                        ),
                                        Text('$formattedDate'),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${movieDetails['pageViews']} views | Voted by ${movieDetails['totalVoted']}  People',
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Watch Trailer')),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
