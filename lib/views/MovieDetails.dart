// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  var Alldata;
  MovieDetails(this.Alldata);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    print(widget.Alldata);
  }

  List userlist =["https://img.freepik.com/premium-vector/avatar-profile-colorful-illustration-2_549209-82.jpg?w=740",
  "https://img.freepik.com/premium-vector/people-concept-about-woman-design_25030-11526.jpg?size=626&ext=jpg&ga=GA1.1.1209391547.1676050961&semt=ais",
  "https://img.freepik.com/premium-vector/young-man-avatar-isolated-icon-vector-illustration-design_24877-15466.jpg?size=626&ext=jpg&ga=GA1.1.1209391547.1676050961&semt=ais",
  "https://img.freepik.com/free-vector/people-white_24877-49456.jpg?size=626&ext=jpg&ga=GA1.1.1209391547.1676050961&semt=ais",
  "https://img.freepik.com/free-icon/astronaut_318-402995.jpg?size=626&ext=jpg&ga=GA1.2.1209391547.1676050961&semt=ais",
  "https://img.freepik.com/free-icon/man_318-157609.jpg?size=626&ext=jpg&ga=GA1.1.1209391547.1676050961&semt=ais"
  
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200/${widget.Alldata.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200/${widget.Alldata.backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widget.Alldata.title.toString().length > 9
                                  ? Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        widget.Alldata.title
                                            .toString()
                                            .substring(0, 9),
                                        // overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white),
                                      ),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        widget.Alldata.title.toString(),
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white),
                                      ),
                                    ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 28.0, right: 20),
                            child: Row(
                              children: [
                                Center(
                                  child: MakeIcon(),
                                ),
                                Center(
                                  child: MakeIcon(),
                                ),
                                Center(
                                  child: MakeIcon(),
                                ),
                                Center(
                                  child: MakeIcon(),
                                ),
                                Center(
                                  child: MakeIcon(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.new_releases_outlined,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    widget.Alldata.releaseDate.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.reviews_outlined,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    widget.Alldata.popularity.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    widget.Alldata.voteCount.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Text(
                        " Directed By abc New Owner",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Text(
                      "  The Cast ",
                      maxLines: 5,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder:((context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userlist[index]),
                        ),
                      );
                    })),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Text(
                      "  Story  Line",
                      maxLines: 5,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        widget.Alldata.overview,
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
       bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          child: Text('  Resume Playing  '),
        ),
      ));
    
  }

  Icon MakeIcon() {
    return Icon(
      Icons.star,
      size: 18,
      color: Color.fromARGB(255, 226, 205, 12),
    );
  }
}
