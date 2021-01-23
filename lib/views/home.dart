import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:star_wars/viewModel/start_wars_viewmodel.dart';
import 'package:star_wars/widgets/busy_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  ScrollController controller;



  @override
  void initState() {
    super.initState();
    controller =  ScrollController();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {

      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StarWarsViewModel>.reactive(
      viewModelBuilder: () => StarWarsViewModel(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text(
                'StarWars',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: model.isBusy
                ? Indicator()
                : model.hasError
                    ? _key.currentState
                        .showSnackBar(SnackBar(content: Text(model.modelError)))
                    : ListView.builder(
                        itemCount: model.list.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "${model.list[index].name}",
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        }));
      },
    );
  }
}
