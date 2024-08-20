import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/custom_text_field.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/resource_manger/asset_path.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_bloc.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_event.dart';
import '../../features/Search_Page/presentation/manager/search_bloc/search_state.dart';

class SearchPageBrowse extends StatefulWidget {
  const SearchPageBrowse({super.key});

  @override
  State<SearchPageBrowse> createState() => _SearchPageBrowseState();
}

class _SearchPageBrowseState extends State<SearchPageBrowse> {
  late TextEditingController searchController;

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(SearchEvent());
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

  List<SearchModel> _filteredItems = [];

  void _updateSearchQuery(String query, List<SearchModel> list) {
    setState(() {
      _filteredItems = list
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState) {
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
                              _updateSearchQuery(value, state.SearchList);
                              print(state.SearchList[0].name);
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
                  searchController.text.isNotEmpty ||
                          _items.contains(searchController.text)
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _filteredItems.isEmpty
                              ? _items.contains(searchController.text)
                                  ? _items.length
                                  : 1
                              : _filteredItems.length,
                          itemBuilder: (context, index) {
                            return _filteredItems.isNotEmpty
                                ? ListTile(
                                    title: _filteredItems.isEmpty
                                        ? state.SearchList.contains(
                                                searchController.text)
                                            ? Text(state.SearchList[index].name
                                                .toString())
                                            : const Center(
                                                child: Text(
                                                'No Results Found',
                                                style: TextStyle(
                                                    color: ColorManager.red),
                                              ))
                                        : Text(state.SearchList[index].name
                                            .toString()),
                                  )
                                : Center(child: Text(' Start Searching Now '));
                          },
                        )
                      : Image.asset(
                          AssetsPath.search,
                          height: ConfigSize.defaultSize! * 30,
                          filterQuality: FilterQuality.high,
                        ),
                ],
              ),
            ),
          ),
        );
      }
      if (state is SearchErrorState) {
        return Center(child: Text(state.errorMessage));
      } else {
        return Center(
            child: CircularProgressIndicator(
          color: ColorManager.mainColor,
        ));
      }
    });
  }
}
