import 'package:breakingbad/data/saved.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0XFF09090F),
        title: Text("Saved Page"),
      ),
      body: saved.isEmpty
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
          : InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (val) {
                        saved.removeAt(index);
                        setState(() {});
                      },
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, "/info",
                                arguments: saved[index]);
                          },
                          leading: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                saved[index].img.toString()),
                          ),
                          title: Text(saved[index].nickname.toString()),
                          subtitle: Text(saved[index].name.toString()),
                          trailing: Text(saved[index].status.toString()),
                        ),
                      ),
                    );
                  },
                  itemCount: saved.length,
                ),
              ),
            ),
            
    );
  }
}
