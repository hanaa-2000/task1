import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/E-Shop/screens/widgets/category_full_item.dart';
import 'package:task1/E-Shop/screens/widgets/floating_button_widget.dart';
import 'package:task1/E-Shop/screens/widgets/switch_toggle.dart';
import 'package:task1/E-Shop/services/provider_app.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ProviderAppTheme().loadDta();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderAppTheme>(context);
    final data = ProviderAppTheme().loadDta();

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("opps!!"),
            );
          } else if (snapshot.hasData) {

             var snap = snapshot.data;


            return Scaffold(
              backgroundColor: context.canvasColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "E-Shop",
                                  style: TextStyle(
                                    color: context.accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textScaler: const TextScaler.linear(3),
                                ),
                                Text(
                                  "Trending products",
                                  style: TextStyle(
                                    color: context.accentColor,
                                  ),
                                  textScaler: const TextScaler.linear(1.5),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: buildSwitchToggle(
                                  onToggle: (v) {
                                    Provider.of<ProviderAppTheme>(context,
                                            listen: false)
                                        .toggleThemeMode(v);
                                  },
                                  state: provider.isDarkTheme),
                            ),
                          ],
                        ),
                        20.heightBox,
                        Expanded(
                          child: ListView.builder(
                            itemCount: snap!.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var snap = snapshot.data![index];
                              return CategoryFullItem(
                                title: snap.name,
                                category: snap.desc,
                                price: snap.price,
                                img: snap.image,
                                catalog: snap,
                              );
                            },
                          ),
                        ),
                      ]),
                ),
              ),
              floatingActionButton: FloatingButtonWidget(
                catalog: snap[0],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
