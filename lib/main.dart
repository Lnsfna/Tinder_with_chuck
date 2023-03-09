import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:tinder_with_chuck/joke.dart';
import 'package:tinder_with_chuck/card.dart';

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
  List<BigCard> cards = [];

  void updateJoke(int ind, bool like) {
    if (like) {
      toggleFavorite(ind);
    }
    Future<Joke> second = fetchJoke();
    second.then((jokeobj) {
      joke = jokeobj.get();
      cards[ind] = BigCard(value: joke);
    }).whenComplete(() => notifyListeners());
  }

  void fillCards() {
    Future<Joke> first = fetchJoke();
    first.then((jokeobj) {
      joke = jokeobj.get();
      cards.add(BigCard(value: joke));
    });
    Future<Joke> second = fetchJoke();
    second.then((jokeobj) {
      joke = jokeobj.get();
      cards.add(BigCard(value: joke));
    }).whenComplete(() => notifyListeners());
  }

  Set<String> favorites = {};

  void toggleFavorite(int ind) {
    if (!favorites.contains(cards[ind].value)) {
      favorites.add(cards[ind].value);
    }
  }

  void removeFavorite(String joke) {
    favorites.remove(joke);
    notifyListeners();
  }
}

bool onInit = true;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (onInit) {
      var appState = context.watch<MyAppState>();

      onInit = false;
      appState.fillCards();
    }

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.info),
            ),
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
            child: InfoPage(),
          ),
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

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPage();
}

class _GeneratorPage extends State<GeneratorPage> {
  final CardSwiperController controller = CardSwiperController();
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.6,
              child: CardSwiper(
                controller: controller,
                isVerticalSwipingEnabled: false,
                cards: appState.cards,
                onTapDisabled: () {},
                onSwipe: (index, direction) {
                  bool like = false;
                  if (direction.name == "left") {
                    like = true;
                  }

                  appState.updateJoke(index, like);
                },
              ),
            ),
            // const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.swipeLeft,
                    child: const Icon(Icons.favorite_border),
                  ),
                  FloatingActionButton(
                    onPressed: controller.swipeRight,
                    child: const Text("Next"),
                  ),
                ],
              ),
            )
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
        child: Text('No favorite jokes yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('You have '
              '${appState.favorites.length} favorite jokes:'),
        ),
        Expanded(
          child: SafeArea(
            minimum: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: ListView(
              children: [
                for (var pair in appState.favorites)
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.delete_outline,
                          semanticLabel: 'Delete'),
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
      ],
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.primary);

    return Scaffold(
        body: Column(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 3.0, color: theme.colorScheme.primary),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              size: 50,
              color: style.color,
            ),
            Text(
              "Tinder with Chuck",
              style: style,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.star_border, color: style.color),
              title: Text.rich(TextSpan(
                  style: TextStyle(color: theme.colorScheme.secondary),
                  children: const [
                    TextSpan(
                        text: 'Author:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(
                        text: 'Safina Alina', style: TextStyle(fontSize: 20))
                  ])),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: style.color,
              ),
              title: Text.rich(TextSpan(
                  style: TextStyle(color: theme.colorScheme.secondary),
                  children: const [
                    TextSpan(
                        text: 'Repository:  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(
                        text: 'https://github.com/Lnsfna/Tinder_with_chuck',
                        style: TextStyle(fontSize: 20))
                  ])),
            ),
          ],
        ),
      )
    ]));
  }
}
