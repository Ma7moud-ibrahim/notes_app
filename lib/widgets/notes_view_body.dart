import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
        searchQuery = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: 'Notes',
            icon: isSearching ? Icons.close : Icons.search,
            onPressed: _toggleSearch,
          ),
          if (isSearching) ...[
            const SizedBox(height: 12),
            CustomTextField(
              hint: 'Search by title...',
              controller: searchController,
              onChange: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ],
          const SizedBox(height: 8),
          Expanded(child: NotesListView(searchQuery: searchQuery)),
        ],
      ),
    );
  }
}
