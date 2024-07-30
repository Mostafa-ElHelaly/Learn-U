import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SearchPageBrowse extends StatefulWidget {
  const SearchPageBrowse({super.key});

  @override
  State<SearchPageBrowse> createState() => _SearchPageBrowseState();
}

class _SearchPageBrowseState extends State<SearchPageBrowse> {
  late TextEditingController searchcontroller;
  @override
  void initState() {
    searchcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchcontroller.dispose();
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
  String _searchQuery = '';
  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
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
                            controller: searchcontroller,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    searchcontroller.clear();
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
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Visibility(
                    visible: searchcontroller.text.isNotEmpty ||
                        _items.contains(searchcontroller.text),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredItems.isEmpty
                          ? _items.contains(searchcontroller.text)
                              ? _items.length
                              : 1
                          : _filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: _filteredItems.isEmpty
                              ? _items.contains(searchcontroller.text)
                                  ? Text(_items[index])
                                  : const Center(
                                      child: Text(
                                      'No Results Found',
                                      style: TextStyle(color: ColorManager.red),
                                    ))
                              : Text(_filteredItems[index]),
                        );
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
