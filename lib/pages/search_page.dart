import 'package:breakingbad/model/breaking_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchPAge extends StatefulWidget {
  List<BreakingBad>? data;
  SearchPAge({Key? key, this.data}) : super(key: key);

  @override
  _SearchPAgeState createState() => _SearchPAgeState();
}

class _SearchPAgeState extends State<SearchPAge> {
  List<BreakingBad>? _breaking;
  Set<BreakingBad> search = {};
  @override
  void initState() {
    super.initState();
    _breaking = widget.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: TextFormField(
          decoration: InputDecoration(
            labelText: "Search",
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onChanged: (val) {
            search.clear();
            setState(() {});
            for (BreakingBad data in _breaking!) {
              if (val.length == 0) {
                search.clear();
                setState(() {});
              } else if (data.nickname!.toLowerCase().contains(val)) {
                search.add(data);
                setState(() {});
              }
            }
          },
        ),
      ),
      body: search.isEmpty
          ? Center(
              child: Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://thumbs.gfycat.com/AnotherIncredibleDipper-size_restricted.gif"))),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/info",
                            arguments: search.toList()[index]);
                      },
                      trailing: Text(search.toList()[index].status.toString()),
                      title: Text(search.toList()[index].nickname.toString()),
                      subtitle: Text(search.toList()[index].name.toString()),
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            search.toList()[index].img.toString()),
                      ),
                    ),
                  );
                },
                itemCount: search.length,
              ),
            ),
    );
  }
}
