// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/controllers/homeController.dart';
import 'package:interviewapp/views/MovieDetails.dart';

class MovieListScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
          child: ListView(children: [
        DrawerHeader(
            child: Container(
          width: 300.0,
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/vectors/dark-abstract-background-vector-illustration-vector-id929619614?b=1&k=6&m=929619614&s=612x612&w=0&h=bzXWUYZ7R9wMSTmWANhfhh2ct3RAnOBVKMhqLDE1KiY="),
            // fit: BoxFit.cover
          )),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon((Icons.supervised_user_circle_rounded)),
                color: Colors.white,
                iconSize: 60,
                onPressed: () {},
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    ("User"),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    ("User@gmail.com"),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          )),
        ))
      ])),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJfRi_wPUHXdTub64VODSqjDsCPs_dmysOww&usqp=CAU",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Watch Movies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 300,
                  child: Obx(() {
                    if (controller.movies.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.movies.length,
                        itemBuilder: (context, index) {
                          final movie = controller.movies[index];
                          print(movie.popularity.toString());
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movie)));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: movie.posterPath.isNotEmpty
                                      ? Image.network(
                                          'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(Icons.image),
                                ),
                                Container(
                                  
                                    height: 20,
                                    width: 150,
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(movie.title)),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                    width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.reviews_outlined,
                                              size: 15,
                                            ),
                                          ),
                                          Text(
                                            '${movie.popularity.toStringAsFixed(1)}',
                                            style:
                                                TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              size: 15,
                                            ),
                                          ),
                                          Text(
                                            '${movie.voteCount.toString()}',
                                            style:
                                                TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
