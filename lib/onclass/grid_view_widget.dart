import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   scrollDirection: Axis.vertical, // main vertical, cross horizontal
    //   crossAxisCount: 4,
    //   childAspectRatio: 0.5, // cross / main
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //   ],
    // );
    // return GridView.extent(
    //   maxCrossAxisExtent: 300,
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //     Container(
    //       margin: const EdgeInsets.all(8),
    //       color: Colors.red,
    //     ),
    //   ],
    // );
    return GridView.builder(
      itemCount: 14,
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 5,
      //   mainAxisSpacing: 32,
      //   crossAxisSpacing: 4,
      //   childAspectRatio: 2,
      // ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 32,
        crossAxisSpacing: 4,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

// Công thức: Width Màn hình / số lượng item ngang = Width từng item
