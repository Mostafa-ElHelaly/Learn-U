import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/utils/methods.dart';
import 'package:Learn_U/core/widgets/Changing_Rating_Bar.dart';
import 'package:Learn_U/core/widgets/Loading.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/core/widgets/snack_bar.dart';
import 'package:Learn_U/features/Search_Page/data/model/searchModel.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/get_reviews_bloc/get_reviews_state.dart';
import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_bloc.dart';
import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_event.dart';
import 'package:Learn_U/features/category/Presentation/Manager/send_review_bloc/send_review_state.dart';
import 'package:Learn_U/features/category/Presentation/Widgets/FeedBack_Textfield.dart';
import 'package:Learn_U/features/category/Presentation/Widgets/Reviews_Card.dart';
import 'package:Learn_U/features/category/data/model/reviews_model.dart';
import 'package:Learn_U/features/profile/data/model/user_model.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_bloc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewsTab extends StatefulWidget {
  ReviewsTab({super.key, required this.courses});
  final SearchModel courses;

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  TextStyle labelstyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2, fontWeight: FontWeight.bold);
  late TextEditingController feedbackController;
  late SharedPreferences prefs;
  @override
  void initState() {
    _initSharedPreferences();
    feedbackController = TextEditingController();
    BlocProvider.of<ProfileBloc>(context).add(GetallUsersEvent());
    BlocProvider.of<GetReviewsBloc>(context)
        .add(GetallGetReviewEvent(course_id: widget.courses.id!));
    super.initState();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(
        () {}); // Ensure the state is updated after SharedPreferences is initialized
  }

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  double userrating = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewsBloc, GetReviewsState>(
      builder: (context, state) {
        if (state is GetReviewsSuccessState) {
          List<ReviewsModel> totalreview = state.GetReviews;
          return Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorManager.mainColor,
                      ),
                      SizedBox(width: ConfigSize.defaultSize! * 1),
                      Text(
                          state.GetReviews.isEmpty
                              ? "0 " +
                                  AppLocalizations.of(context)!.courserating
                              : Methods.instance
                                      .Calculate_Rating(state.GetReviews)
                                      .toStringAsFixed(1) +
                                  ' ' +
                                  AppLocalizations.of(context)!.courserating,
                          style: labelstyle),
                    ],
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 1),
                  Text(state.GetReviews.isEmpty
                      ? "0 " + ' ' + AppLocalizations.of(context)!.reviews
                      : state.GetReviews.length.toString() +
                          ' ' +
                          AppLocalizations.of(context)!.reviews),
                  SizedBox(height: ConfigSize.defaultSize! * 5),
                  BlocBuilder<ProfileBloc, UsersState>(
                      builder: (context, state) {
                    if (state is UsersSuccessState) {
                      UserModel current_user_data = state.users
                          .where((element) =>
                              element.email == prefs.getString("user_email"))
                          .toList()[0];
                      return Visibility(
                        visible: !totalreview
                                .map((e) => e.firstName)
                                .contains(current_user_data.first_name) &&
                            !totalreview
                                .map((e) => e.lastName)
                                .contains(current_user_data.last_name),
                        child: BlocListener<SendReviewsBloc, SendReviewsState>(
                          listener: (context, state) {
                            if (state is SendReviewsSuccessState) {
                              showLoading(context);
                              return successSnackBar(
                                  context, 'Review Sent Successfully');
                            }
                            if (state is SendReviewsErrorState) {
                              return errorSnackBar(context, state.errorMessage);
                            } else {
                              return showLoading(context);
                            }
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .shareyourfeedback,
                                    style: labelstyle,
                                  ),
                                  ChangingRatingBar(
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        userrating = rating;
                                      });
                                    },
                                    rating: '0',
                                  )
                                ],
                              ),
                              SizedBox(height: ConfigSize.defaultSize! * 3),
                              FeedbackTextfield(
                                controller: feedbackController,
                              ),
                              SizedBox(height: ConfigSize.defaultSize! * 1),
                              MainButton(
                                  onTap: () {
                                    print(widget.courses.id);
                                    print(int.parse(
                                        userrating.toString().substring(0, 1)));
                                    print(feedbackController.text);
                                    BlocProvider.of<SendReviewsBloc>(context)
                                        .add(
                                      SendallSendReviewEvent(
                                        course_id: widget.courses.id!,
                                        review_value: userrating * 2,
                                        review_message: feedbackController.text,
                                      ),
                                    );
                                  },
                                  title: AppLocalizations.of(context)!.confirm),
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is UsersErrorState) {
                      return Text('error');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.mainColor,
                        ),
                      );
                    }
                  }),
                  SizedBox(height: ConfigSize.defaultSize! * 5),
                  Text(
                    AppLocalizations.of(context)!.reviews,
                    style: labelstyle,
                  ),
                  SizedBox(height: ConfigSize.defaultSize! * 3),
                  Container(
                    height: ConfigSize.defaultSize! * 15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ConfigSize.defaultSize! * 1),
                          child: ReviewsCard(
                            user_first_name: totalreview[index].firstName,
                            user_last_name: totalreview[index].lastName,
                            updated_date: totalreview[index].updatestamp,
                            review: totalreview[index].message ?? 'NONE',
                            rating: double.parse(
                                totalreview[index].review.toString()),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: state.GetReviews.length,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is GetReviewsErrorState) {
          return Text(state.errorMessage);
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorManager.mainColor,
          ),
        );
      },
    );
  }
}
