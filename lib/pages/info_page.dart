import 'package:breakingbad/data/saved.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:breakingbad/model/breaking_model.dart';
import 'package:breakingbad/size_config/size_config.dart';

class InfoPAge extends StatefulWidget {
  BreakingBad? breaking;
  InfoPAge({Key? key, this.breaking}) : super(key: key);

  @override
  _InfoPAgeState createState() => _InfoPAgeState();
}

class _InfoPAgeState extends State<InfoPAge> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFF09090F),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.breaking!.img.toString()),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: getProportionScreenWidth(100)),
                      child: Container(
                        height: getProportionScreenHeight(40),
                        width: getProportionScreenWidth(150),
                        child: Center(
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Name: ${widget.breaking!.name}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Birth Date: ${widget.breaking!.birthday}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Nickname in Breaking Bad: ${widget.breaking!.nickname}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Occupation: ${widget.breaking!.occupation![0]}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Portrayed: ${widget.breaking!.portrayed}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.arrow_forward_ios_sharp),
                        title: Text(
                          "Status: ${widget.breaking!.status}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          saved.add(widget.breaking!);
        },
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
