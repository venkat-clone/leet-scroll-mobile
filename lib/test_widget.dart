import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AutoNestedPageView());
  }
}

class AutoNestedPageView extends StatelessWidget {
  /// Generates a list of items for a specific page.
  List<Widget> _generateListItems(int pageIndex) {
    return List<Widget>.generate(
      40, // Each page will have 20 items
      (int itemIndex) => Text('X' * (itemIndex + 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final minHeight = MediaQuery.of(context).size.height;

    return NestedScrollPage();

    // ignore: dead_code
    return PageView.builder(
      // physics: const AlwaysScrollableScrollPhysics(),
      // scrollBehavior: ScrollBehavior(),
      // allowImplicitScrolling: true,
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, pageIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                minHeight: minHeight,
              ),
              child: ListView(
                primary: false,
                children: _generateListItems(pageIndex),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget test() {
    return CustomScrollView(slivers: []);
  }
}

class NestedScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nested Scroll Example')),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          // Page 1
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Page 1 - Item ${index + 1}'),
              );
            },
          ),
          // Page 2
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Page 2 - Item ${index + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
