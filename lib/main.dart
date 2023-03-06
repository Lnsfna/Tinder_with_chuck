import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Joke {

  String value;


  Joke({
    required this.value,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      value: json['value'],
    );
  }

  String get(){
    return value;
  }
   
}

Future<Joke> fetchJoke() async {
    var r = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    if (r.statusCode == 200) {
      return Joke.fromJson(jsonDecode(r.body));
    } else {
      throw Exception('Loading failed');
    }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Tinder with Chuck',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}






class MyAppState extends ChangeNotifier {
  Future<Joke> future = fetchJoke();
  String joke = "";
  
  void extarctJoke(){
    Future<Joke> future = fetchJoke();
    future.then((jokeobj) {
    joke = jokeobj.get();
  }).whenComplete(() => notifyListeners());
  }

 Set<String> favorites= Set();

  void toggleFavorite() {
    if (favorites.contains(joke)) {
      favorites.remove(joke);
    } else {
      favorites.add(joke);
    }
    notifyListeners();
  }

  void removeFavorite(String joke) {
    favorites.remove(joke);
    notifyListeners();
  }
}


    
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, fontSize: 20
    );

    return
    //  SizedBox(
    //             width: 400,
    //             height: 500,
    //             child: SafeArea(child: Card(
    //               shadowColor: Color.fromARGB(255, 21, 20, 20).withOpacity(0.5),
                  
    //               color: theme.colorScheme.primary,

    //               semanticContainer: true,
    //               clipBehavior: Clip.antiAliasWithSaveLayer,
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10.0),
    //               ),
    //               elevation: 10,
    //               margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    //               child: Container(
    //                 padding: const EdgeInsets.fromLTRB(20, 265, 20, 20),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   image: DecorationImage(
    //                     image: AssetImage('../images/1.jpg'),
    //                     // fit: BoxFit.fitWidth,
    //                     alignment: Alignment.topCenter,
    //                   ),
    //                 ),
    //                 child: Text(value, style: style, textAlign: TextAlign.center,),
    //               ),
    //             ),
    //           ),
    // );
    SizedBox(
      height: 500,
      width: 400,
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
          child: Text(
            value,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: GeneratorPage(),
          ),
          Center(
            child: FavoritesPage(),
          ),
          
        ],
      ),
    );
  }
}


//   var selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = GeneratorPage();
//         break;
//       case 1:
//         page = Placeholder();
//         break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }
//     return Scaffold(
      
//       body: Row(
//         children: [
//           SafeArea(

            
//             child: NavigationRail(
              
//               extended: false,
//               destinations: const [
//                 NavigationRailDestination(
//                   icon: Icon(Icons.home),
//                   label: Text('Home'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.favorite),
//                   label: Text('Favorites'),
//                 ),
//               ],
//               selectedIndex: selectedIndex,
//               onDestinationSelected: (value) {
//                 setState(() {
//                   selectedIndex = value;
//                 });              
//               },
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Theme.of(context).colorScheme.primaryContainer,
//               child: page,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

bool onInit = true;
class GeneratorPage extends StatelessWidget {


  const GeneratorPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double startDx = 0;
    
    var appState = context.watch<MyAppState>();
    String value = appState.joke;
    if (onInit){
      appState.extarctJoke();
      onInit = false;

    }

    IconData icon;
    if (appState.favorites.contains(value)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable(
            
              axis: Axis.horizontal,
              
              child: BigCard(value: value,),
              feedback: BigCard(value: value,),
              childWhenDragging: BigCard(value: value,),
              
              onDragEnd: (drag) {
                if (drag.velocity.pixelsPerSecond.dx > 0){
                  print("swipe left");
                  print(drag.offset.distance);
                  print(drag.offset.direction.ceil());

                  appState.toggleFavorite();
                  appState.extarctJoke();
                }
                else{
                  print("swipe right");
                  print(drag.offset.direction.ceil());


                  appState.extarctJoke();
                }
              },


            ),
            const SizedBox(height: 20),
            
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: const Text('Like'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    appState.extarctJoke();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        Expanded(            
            child: SafeArea(
              minimum: EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: ListView(
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 400,
            //   childAspectRatio: 400 / 80,
            // ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                    color: theme.colorScheme.primary,
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                  ),
                  title: Text(
                    pair,
                  ),
                ),
            ],
          ),
            ),
        ),
      ]
      ,
    );
  }
}

