// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MovieType {
  String title;
  bool isSelected;
  MovieType({
    required this.title,
    required this.isSelected,
  });
}

class FavoriteMovieWidget extends StatefulWidget {
  const FavoriteMovieWidget({super.key});
  @override
  State<FavoriteMovieWidget> createState() => _FavoriteMovieWidgetState();
}

class _FavoriteMovieWidgetState extends State<FavoriteMovieWidget> {
  List<MovieType> values = [
    MovieType(title: 'Action', isSelected: false),
    MovieType(title: 'Animation', isSelected: false),
    MovieType(title: 'Love', isSelected: false),
    MovieType(title: 'Comedy', isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorite type of movie',
            style: TextStyle(color: Colors.black),
          ),
          Wrap(
            children: values
                .map(
                  (e) => Row(
                    mainAxisSize: MainAxisSize.min, //Check Box List Tile
                    children: [
                      Checkbox(
                        value: e.isSelected,
                        onChanged: (selected) {
                          setState(() {
                            final index = values.indexWhere(
                              (element) => element.title == e.title,
                            );
                            values[index].isSelected = selected ?? false;
                          });
                          print(
                            values
                                .where((element) => element.isSelected)
                                .map((e) => e.title)
                                .join(', '),
                          );
                        },
                      ),
                      Text(
                        e.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
