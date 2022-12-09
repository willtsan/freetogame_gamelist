import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pravaler_gamelist/features/home/components/game_item.component.dart';
import 'package:pravaler_gamelist/features/home/controller/home.controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeController _controller = GetIt.I.get();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<String> ordenationOptions = <String>["Title", "Release Date"];

  String lastOrder = '';

  @override
  void initState() {
    super.initState();

    _controller.searchEnabled = false;
    _controller.getListOfGames();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Game List"),
          actions: [
            IconButton(
                onPressed: () {
                  _controller.searchEnabled = !_controller.searchEnabled;
                  _textEditingController.text = '';
                  _controller.applyFilters();
                  _scrollController.jumpTo(0);
                  setState(() {});
                },
                icon: const Icon(Icons.search)),
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 'Title':
                    _controller.orderData('title', reverse: lastOrder == value);
                    break;
                  case 'Release Date':
                    _controller.orderData('release_date',
                        reverse: lastOrder != value);
                    break;
                }

                if (lastOrder == value) {
                  lastOrder = '';
                } else {
                  lastOrder = value;
                }
                _scrollController.jumpTo(0);
              },
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.filter_alt),
              itemBuilder: (BuildContext context) {
                return ordenationOptions.map((String orderField) {
                  return PopupMenuItem<String>(
                    value: orderField,
                    child: Text(orderField),
                  );
                }).toList();
              },
            )
          ],
          bottom: _controller.searchEnabled == true
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Observer(builder: (context) {
                    if (_controller.isLoading) {
                      return const SizedBox.shrink();
                    } else {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextField(
                          controller: _textEditingController,
                          onChanged: (value) {
                            if (value.length > 3) {
                              _controller.applyFilters(filter: value);
                            } else {
                              _controller.applyFilters();
                            }

                            _scrollController.jumpTo(0);
                          },
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 5.0),
                              ),
                              hintStyle: TextStyle(color: Colors.black),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      );
                    }
                  }),
                )
              : null,
        ),
        body: Observer(builder: (context) {
          if (_controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (_controller.isError) {
              return _getError();
            } else {
              return _getBody();
            }
          }
        }),
      ),
    );
  }

  Widget _getError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 56),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              _controller.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              _controller.getListOfGames();
            },
            child: const Text(
              "Try Again",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getBody() {
    if (_controller.contentForDisplay.isEmpty) {
      return ListView(
        shrinkWrap: true,
        controller: _scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 32,
              ),
              Icon(
                Icons.warning,
                size: 56,
                color: Colors.yellow,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "No results in your search",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      );
    } else {
      return ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemCount: _controller.contentForDisplay.length,
        itemBuilder: ((context, index) => GameItemComponent(
              gameData: _controller.contentForDisplay[index],
            )),
        separatorBuilder: ((context, index) => const Divider()),
      );
    }
  }
}
