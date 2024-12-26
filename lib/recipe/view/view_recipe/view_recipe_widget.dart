import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/recipe/view/comment_component/comment_component_widget.dart';
import '/recipe/view/ingradient_component/ingradient_component_widget.dart';
import '/recipe/view/rating_bar_component/rating_bar_component_widget.dart';
import '/recipe/view/step_component/step_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'view_recipe_model.dart';
export 'view_recipe_model.dart';

class ViewRecipeWidget extends StatefulWidget {
  const ViewRecipeWidget({
    super.key,
    required this.recipeId,
  });

  final DocumentReference? recipeId;

  @override
  State<ViewRecipeWidget> createState() => _ViewRecipeWidgetState();
}

class _ViewRecipeWidgetState extends State<ViewRecipeWidget> {
  late ViewRecipeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewRecipeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // IsPostLikedFromUser
      _model.isLiked = (currentUserDocument?.likes.toList() ?? [])
          .contains(widget.recipeId);
      _model.isFavourite = (currentUserDocument?.favourites.toList() ?? [])
          .contains(widget.recipeId);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RecipesRecord>(
      stream: RecipesRecord.getDocument(widget.recipeId!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final viewRecipeRecipesRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                'CommentOnRecipe',
                queryParameters: {
                  'recipeId': serializeParam(
                    widget.recipeId,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.reviews,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            actions: [
              ToggleIcon(
                onPressed: () async {
                  safeSetState(() => _model.isFavourite = !_model.isFavourite!);
                  if (_model.isFavourite!) {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'favourites':
                              FieldValue.arrayUnion([widget.recipeId]),
                        },
                      ),
                    });
                  } else {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'favourites':
                              FieldValue.arrayRemove([widget.recipeId]),
                        },
                      ),
                    });
                  }
                },
                value: _model.isFavourite!,
                onIcon: Icon(
                  Icons.bookmark,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                offIcon: Icon(
                  Icons.bookmark_border,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              viewRecipeRecipesRecord.title,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displaySmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .displaySmallFamily),
                                  ),
                            ),
                            Text(
                              viewRecipeRecipesRecord.shortDescription,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 36.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      viewRecipeRecipesRecord.avgRating,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.automatic,
                                    ),
                                    '0.0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: ToggleIcon(
                                    onPressed: () async {
                                      safeSetState(() =>
                                          _model.isLiked = !_model.isLiked!);
                                      if (_model.isLiked!) {
                                        // AddLike

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'likes': FieldValue.arrayUnion(
                                                  [widget.recipeId]),
                                            },
                                          ),
                                        });
                                      } else {
                                        // RemoveLike

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'likes': FieldValue.arrayRemove(
                                                  [widget.recipeId]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value: _model.isLiked!,
                                    onIcon: Icon(
                                      Icons.favorite,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.favorite_border,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    viewRecipeRecipesRecord.imagePath,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  allowRotation: false,
                                  tag: viewRecipeRecipesRecord.imagePath,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: viewRecipeRecipesRecord.imagePath,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                viewRecipeRecipesRecord.imagePath,
                                fit: BoxFit.fitWidth,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/images/error_image.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'iuhglh4z' /* Ingredients */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<List<IngredientsRecord>>(
                          stream: queryIngredientsRecord(
                            parent: widget.recipeId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<IngredientsRecord>
                                ingredientsListIngredientsRecordList =
                                snapshot.data!;
                            if (ingredientsListIngredientsRecordList.isEmpty) {
                              return const EmptyWidgetWidget(
                                content: 'Ingredients',
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  ingredientsListIngredientsRecordList.length,
                              itemBuilder: (context, ingredientsListIndex) {
                                final ingredientsListIngredientsRecord =
                                    ingredientsListIngredientsRecordList[
                                        ingredientsListIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: wrapWithModel(
                                    model: _model.ingradientComponentModels
                                        .getModel(
                                      ingredientsListIndex.toString(),
                                      ingredientsListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: IngradientComponentWidget(
                                      key: Key(
                                        'Keyne9_${ingredientsListIndex.toString()}',
                                      ),
                                      ingredient:
                                          ingredientsListIngredientsRecord,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'vqayui8d' /* Steps */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final stepsList = viewRecipeRecipesRecord.steps
                                .map((e) => e)
                                .toList();
                            if (stepsList.isEmpty) {
                              return const EmptyWidgetWidget(
                                content: 'Steps',
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: stepsList.length,
                              itemBuilder: (context, stepsListIndex) {
                                final stepsListItem = stepsList[stepsListIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: wrapWithModel(
                                    model: _model.stepComponentModels.getModel(
                                      stepsListIndex.toString(),
                                      stepsListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: StepComponentWidget(
                                      key: Key(
                                        'Key5y5_${stepsListIndex.toString()}',
                                      ),
                                      stepNumber: functions
                                          .startCountFromOne(stepsListIndex)!,
                                      stepDescription: viewRecipeRecipesRecord
                                          .steps
                                          .elementAtOrNull(stepsListIndex),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<RatingRecord>>(
                            stream: queryRatingRecord(
                              parent: widget.recipeId,
                              queryBuilder: (ratingRecord) =>
                                  ratingRecord.where(
                                'rater',
                                isEqualTo: currentUserReference,
                                isNull: (currentUserReference) == null,
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<RatingRecord>
                                  ratingBarComponentRatingRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final ratingBarComponentRatingRecord =
                                  ratingBarComponentRatingRecordList.isNotEmpty
                                      ? ratingBarComponentRatingRecordList.first
                                      : null;

                              return wrapWithModel(
                                model: _model.ratingBarComponentModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: RatingBarComponentWidget(
                                  rating:
                                      ratingBarComponentRatingRecord?.rating,
                                  onChange: () async {
                                    // UpdateExistRatingDocument

                                    await ratingBarComponentRatingRecord!
                                        .reference
                                        .update(createRatingRecordData(
                                      rating: _model.ratingBarComponentModel1
                                          .ratingBarValue,
                                    ));
                                    // CalculateAverageOfRatings

                                    await widget.recipeId!
                                        .update(createRecipesRecordData(
                                      avgRating: functions.calculateAvgRating(
                                          viewRecipeRecipesRecord
                                              .ratings.length,
                                          viewRecipeRecipesRecord.avgRating,
                                          _model.ratingBarComponentModel1
                                              .ratingBarValue!),
                                    ));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        if (!(currentUserDocument?.recipesRated.toList() ?? [])
                            .contains(widget.recipeId))
                          Expanded(
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.ratingBarComponentModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: RatingBarComponentWidget(
                                  rating: 3.0,
                                  onChange: () async {
                                    // AddRecipeToUserRecipesRated

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'recipes_rated':
                                              FieldValue.arrayUnion(
                                                  [widget.recipeId]),
                                        },
                                      ),
                                    });
                                    // CreateNewRatingDocument

                                    await RatingRecord.createDoc(
                                            widget.recipeId!)
                                        .set(createRatingRecordData(
                                      rater: currentUserReference,
                                      rating: _model.ratingBarComponentModel2
                                          .ratingBarValue,
                                    ));
                                    // CalculateAverageOfRatings

                                    await widget.recipeId!
                                        .update(createRecipesRecordData(
                                      avgRating: functions.calculateAvgRating(
                                          viewRecipeRecipesRecord
                                              .ratings.length,
                                          viewRecipeRecipesRecord.avgRating,
                                          _model.ratingBarComponentModel2
                                              .ratingBarValue!),
                                    ));
                                  },
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'vp6w5m2y' /* Comments */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                        PagedListView<DocumentSnapshot<Object?>?,
                            CommentsRecord>.separated(
                          pagingController: _model.setCommentsListController(
                              CommentsRecord.collection(widget.recipeId)
                                  .orderBy('created_time', descending: true),
                              parent: widget.recipeId),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                          builderDelegate:
                              PagedChildBuilderDelegate<CommentsRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) =>
                                const EmptyWidgetWidget(
                              content: 'Comments',
                            ),
                            itemBuilder: (context, _, commentsListIndex) {
                              final commentsListCommentsRecord = _model
                                  .commentsListPagingController!
                                  .itemList![commentsListIndex];
                              return StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    commentsListCommentsRecord.commenter!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final commentComponentUsersRecord =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model:
                                        _model.commentComponentModels.getModel(
                                      commentsListCommentsRecord.reference.id,
                                      commentsListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CommentComponentWidget(
                                      key: Key(
                                        'Key80u_${commentsListCommentsRecord.reference.id}',
                                      ),
                                      userDisplayName:
                                          commentComponentUsersRecord
                                              .displayName,
                                      imagePath:
                                          commentComponentUsersRecord.photoUrl,
                                      comment: commentsListCommentsRecord.text,
                                      time: commentsListCommentsRecord
                                          .createdTime!,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
