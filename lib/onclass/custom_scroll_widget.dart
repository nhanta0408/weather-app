import 'package:flutter/material.dart';

class CustomSrollViewOnClassWiget extends StatelessWidget {
  const CustomSrollViewOnClassWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const Icon(Icons.home),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.menu),
            ),
          ],
          expandedHeight: 120, // expand <-> collapse
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32)
                  .copyWith(bottom: 16),
              child: const Text(
                'This is Custom Scroll View',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
            ),
            centerTitle: true,
          ),
          pinned: true,
        ),
        // = ListView.builder <=> SliverList.builder
        SliverGrid.builder(
          itemCount: 11,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green[900],
              ),
              alignment: Alignment.center,
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            );
          },
        ),
        SliverGrid.builder(
          itemCount: 11,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 50,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.purple[900],
              ),
              alignment: Alignment.center,
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Danh sách giao dịch',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ), // Widget trong Custom Scroll View
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber[900],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue[900],
                ),
                alignment: Alignment.center,
                child: Text(
                  index.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
