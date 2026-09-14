import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: kPrimaryColor,
            child: CircleAvatar(radius: 30, backgroundColor: color),
          )
        : CircleAvatar(radius: 38, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentColor = 0;
  List<Color> colors = [
    Color(0xFFFFB3BA), // Pink
    Color(0xFFFFDFBA), // Peach
    Color(0xFFFFFFBA), // Yellow
    Color(0xFFBAFFC9), // Mint Green
    Color(0xFFBAE1FF), // Sky Blue
    Color(0xFFD4BAFF), // Lavender
    Color(0xFFFFC9DE), // Rose
    Color(0xFFC9FFF3), // Turquoise
    Color(0xFFFFE0B3), // Apricot
    Color(0xFFE0E0E0), // Light Grey
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                currentColor = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currentColor == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
