import 'package:breakingbad/model/breaking_model.dart';
import 'package:breakingbad/service/breaking_service.dart';
import 'package:breakingbad/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';

class GlavniPAge extends StatefulWidget {
  const GlavniPAge({Key? key}) : super(key: key);

  @override
  _GlavniPAgeState createState() => _GlavniPAgeState();
}

class _GlavniPAgeState extends State<GlavniPAge> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FutureBuilder(
          future: Breakingservice.getBreakingservice(),
          builder: (context, AsyncSnapshot<List<BreakingBad>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Xatolik bor"),
              );
            } else {
              var data = snapshot.data;
              return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Color(0XFF09090F),
          expandedHeight: getProportionScreenHeight(205),
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://click-or-die.ru/wp-content/uploads/2020/09/100091920-1060771-breaking_bad_large-680x510.jpg",
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
              left: getProportionScreenWidth(20),
              right: getProportionScreenWidth(20),
              top: getProportionScreenHeight(10)),
          sliver: SliverToBoxAdapter(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.grey,
                ),
                height: 50,
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Characters",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/search",arguments: data);
              },
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.all(getProportionScreenHeight(8)),
                height: 200,
                child: Column(
                  children: [
                    Container(
                      height: getProportionScreenHeight(210),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.0)),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                data![index].img.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: getProportionScreenHeight(40),
                      child: Center(
                        child: Text(data[index].nickname.toString()),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15)),
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/info", arguments: data[index]);
              },
            );
          }, childCount: data!.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: getProportionScreenHeight(267),
              crossAxisCount: 2),
        ),
      ],
    );
            }
          },
        ),
      );
  }
}
