import 'package:financeapp/data/list.dart';
import 'package:financeapp/screens/widgets/action_button/action_button.dart';
import 'package:financeapp/screens/widgets/appbar/appbarcomponent.dart';
import 'package:financeapp/screens/widgets/top_image/top_image.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchUserState();
  }
}

class SearchUserState extends State<SearchUser> {
  List<ListData> temp = [];
  TextEditingController textController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(fit: StackFit.expand, children: <Widget>[
        TopImage(),
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Row(
                  children: <Widget>[AppBarComponent()],
                ),
                actions: <Widget>[
                  ActionButton()
                ],
              ),
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(height: 20.0),
                      SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Search',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                      Container(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 120.0, right: 120.0),
                        child: Theme(
                          data: ThemeData(primaryColor: Colors.white),
                          child: TextField(
                            onChanged: (value) {
                              searchResult(value);
                            },
                            controller: textController,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                        ),
                      ),
                      Container(height: 110.0),
                      temp.length != 0 && textController.text.isNotEmpty
                          ? searchData()
                          : allData()
                    ],
                  ),
                ),
              )),
        ),
      ]),
    );
  }

  searchResult(String value) {
    setState(() {
      temp = dummydata
          .where(
              (data) => data.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget _condition(BuildContext context, int index) {
    if (dummydata[index].date.endsWith('1998')) {
      return _bluecontainer();
    } else {
      return _dotContainer();
    }
  }

  Widget _bluecontainer() {
    return Positioned(
        top: 20.0,
        left: 15.0,
        child: new Container(
            height: 30.0,
            width: 30.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: new Container(
                margin: new EdgeInsets.all(5.0),
                height: 20.0,
                width: 20.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blueAccent))));
  }

  Widget _dotContainer() {
    return Positioned(
      top: 20.0,
      left: 15.0,
      child: new Container(
          height: 30.0,
          width: 30.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: new Container(
              margin: new EdgeInsets.all(5.0),
              height: 20.0,
              width: 20.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent),
              child: Container(
                  margin: new EdgeInsets.all(2.0),
                  height: 20.0,
                  width: 20.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Container(
                      margin: new EdgeInsets.all(3.0),
                      height: 20.0,
                      width: 20.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent))))),
    );
  }

  Widget _taril(BuildContext context, int index) {
    if (dummydata[index].money.startsWith('-')) {
      return Text(
        '₹' + dummydata[index].money,
        style: TextStyle(
            color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 15.0),
      );
    } else {
      return Text('₹' + dummydata[index].money,
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15.0));
    }
  }

  Widget searchData() {
    return Container(
      height: 442.4,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: temp.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                    title: Text(temp[index].title),
                    subtitle: Text(temp[index].date),
                    trailing: _taril(context, index))),
            new Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 29.0,
              child: new Container(
                height: 20.0,
                width: 2.0,
                color: Colors.grey[200],
              ),
            ),
            _condition(context, index)
          ]);
        },
      ),
    );
  }

  Widget allData() {
    return Container(
      height: 442.4,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dummydata.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                    title: Text(dummydata[index].title),
                    subtitle: Text(dummydata[index].date),
                    trailing: _taril(context, index))),
            new Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 29.0,
              child: new Container(
                height: 20.0,
                width: 2.0,
                color: Colors.grey[200],
              ),
            ),
            _condition(context, index)
          ]);
        },
      ),
    );
  }
}
