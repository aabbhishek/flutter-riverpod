import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:testriver/api/dummy_data.dart';
import 'package:testriver/model/user/user.dart';
import 'package:testriver/state/user.dart';

final localFutureProvider = FutureProvider<dynamic>((ref) async {
  var temp = await ref.read(UserListModelProvider.notifier).getAllUserWR();
  return temp;
});

class SectionOneHome extends StatefulWidget {
  const SectionOneHome({Key? key}) : super(key: key);

  @override
  _SectionOneHomeState createState() => _SectionOneHomeState();
}

class _SectionOneHomeState extends State<SectionOneHome> {
  List<Map> filterContainer = [
    {"text": "One", "printText": "a", "color": Colors.amber},
    {"text": "Two", "printText": "b", "color": Colors.orangeAccent},
    {"text": "Three", "printText": "c", "color": Colors.orange},
    {"text": "Four", "printText": "d", "color": Colors.red},
  ];
  int filterTyoe = 0;
  List<User> userData = [];
  Color filterOn = Colors.amber;

  Future<void> getData() async {
    if (filterTyoe == 0) {
      userData = await GetData.getAllUser();
    } else {
      userData = await GetData.getUserByColor(filterOn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: SingleChildScrollView(child: mainUIP1()),
        // child: SingleChildScrollView(child: mainUIF1()),
        child: SingleChildScrollView(child: mainUIF2()),
      ),
    );
  }

  Widget mainUIP1() {
    return Consumer(builder: (context, watch, _) {
      AsyncValue<dynamic> value = watch(localFutureProvider);
// watch(stateCounterProvider.notifier).filterByEven();
      print("===============");
      print(value);
      return value.when(
          data: (value) => Column(children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Row(
                      children: getFilterList(filterContainer),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(height: 500, child: listView(value))
              ]),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (error, stackTrace) => Text('Error $error'));
    });
  }

  Widget mainUIF1() {
    return Consumer(builder: (ctx, watch, child) {
      print("STEP-1");
      var value =
          watch(UserListModelProvider.notifier).addListener((state) => state);
      print("STEP-2");
      return FutureBuilder(
        future: GetData.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    children: getFilterList(filterContainer),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Container(height: 500, child: listView(snapshot.data))
            ]);
          } else {
            return const CircularProgressIndicator(
                color: Colors.red, backgroundColor: Colors.white60);
          }
        },
      );
    });
  }

  Widget mainUIF2() {
    return FutureBuilder(
      future: GetData.getAllUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer(builder: (context, watch, child) {
            //var value = watch(UserListModelProvider.notifier).state;
            var value = context.read(UserListModelProvider.notifier).state;
            print("------------------------------------");
            print(value);
            print("################ Consumer BUILD ########################");

            return Column(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    children: getFilterList(filterContainer),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Container(height: 500, child: listView(value))
            ]);
          });
        } else {
          return const CircularProgressIndicator(
              color: Colors.red, backgroundColor: Colors.white60);
        }
      },
    );
  }

  Widget listView(dynamic userList) {
    print("========X X X X X X X X X  XXX========");
    print(userList);
    print("========X XX X X XX X  XX X========");
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return getCard(userList[index]);
      },
    );
  }

  List<GestureDetector> getFilterList(dynamic filterList) {
    List<GestureDetector> uiList = [];
    print(filterList);
    for (var element in filterList) {
      uiList.add(GestureDetector(
        child: Container(
            color: element["color"],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(element["text"]),
            )),
        onTap: () {
          print("RiverPod ROCKS");
          context
              .read(UserListModelProvider.notifier)
              .getAllUserFavColor(element["color"]);
        },
      ));
    }
    return uiList;
  }

  Widget getCard(User user) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: user.favoriteColor,
              ),
            ),
            title: Text(user.id.toString()),
            subtitle: Text(
              user.name,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
