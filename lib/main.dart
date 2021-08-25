import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:smooth/views/clientdashboard/clientdashboard.view.dart';
import 'package:smooth/views/home/home.view.dart';
import 'helpers/theme.dart';
import 'locator.dart';
import 'models/appuser.model.dart';
import 'routes.dart';

/// [globalInitializer()]
/// Function to initialise all the pre-app things
globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(AppUserAdapter());
  await Hive.openBox<AppUser>("user");
}

void main() async {
  await globalInitializer();

  initializeDateFormatting('fr_FR').then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Smooth App',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
      );
}

class TabManager extends StatefulWidget {
  static const String routeName = '/tabhome';

  TabManager({Key? key}) : super(key: key);

  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _screensList = [
    HomeView(),
    ClientDashboardView(),
  ];
  NotchedShape? shape;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          title: Text(
            "Smooth Bénin",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _screensList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(_selectedIndex);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.group,
              ),
            ),
          ],
        ),
      );
}
