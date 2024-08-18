import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<String> _items = [
    'Course 1',
    'Course 2',
    'Course 3',
    'Course 4',
    'Course 5',
    'Course 6',
    'Course 7',
    'Course 8',
    'Course 9'
  ];

  List<String> _filteredItems = [];

  void _updateSearchQuery(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // This will hide the keyboard
      },
      child: Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorManager.mainColor,
                height: ConfigSize.defaultSize! * 15,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ConfigSize.defaultSize! * 2,
                      right: ConfigSize.defaultSize! * 2,
                      top: ConfigSize.defaultSize! * 4),
                  child: Column(
                    children: [
                      SizedBox(height: ConfigSize.defaultSize! * 2),
                      TextFormField(
                        onChanged: (value) {
                          _updateSearchQuery(value);
                        },
                        cursorColor: ColorManager.kPrimaryBlueDark,
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                searchController.clear();
                                FocusScope.of(context)
                                    .unfocus(); // This will hide the keyboard
                              },
                              icon: const Icon(Icons.clear,
                                  color: ColorManager.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  ConfigSize.defaultSize! * 1.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  ConfigSize.defaultSize! * 1.5)),
                          hintText: StringManager.search,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: ConfigSize.defaultSize! * 2),
              Visibility(
                visible: searchController.text.isNotEmpty ||
                    _items.contains(searchController.text),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredItems.isEmpty
                      ? _items.contains(searchController.text)
                          ? _items.length
                          : 1
                      : _filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: _filteredItems.isEmpty
                          ? _items.contains(searchController.text)
                              ? Text(_items[index])
                              : const Center(
                                  child: Text(
                                  'No Results Found',
                                  style: TextStyle(color: ColorManager.red),
                                ))
                          : Text(_filteredItems[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
