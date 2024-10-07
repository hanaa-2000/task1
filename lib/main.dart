import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/E-Shop/services/provider_app.dart';
import 'package:task1/book_app/screens/main_screen.dart';
import 'package:task1/book_app/services/books_providers.dart';
import 'package:task1/screens/list_actors.dart';
import 'package:task1/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:task1/sun_glasses/screens/home_screen.dart';
import 'package:task1/todo_app/task_data.dart';
import 'package:task1/todo_app/todo_screen.dart';
import 'E-Shop/core/themes_app.dart';
import 'E-Shop/model/catelog_model.dart';
import 'E-Shop/screens/home_screen.dart';
import 'firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderAppTheme(),),
        ChangeNotifierProvider(create: (context){
          final cartModelProvider = CartModelProvider();

          // Set the catalog model here
          cartModelProvider.catalog = CatalogModel(); // Ensure this is your initialized catalog

          return cartModelProvider;
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<ProviderAppTheme>(context).themeMode,
          darkTheme: MyThemes.darkTheme(context),
          theme: MyThemes.lightTheme(context),
          home: HomeScreen(),
        );
      },

    );
  }
}
