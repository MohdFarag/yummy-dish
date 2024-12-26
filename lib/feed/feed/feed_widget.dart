import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget_widget.dart';
import '/components/notification_badge_widget.dart';
import '/feed/recipe_component/recipe_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:text_search/text_search.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('CreateRecipe');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('UserProfile');
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'https://www.movedemocracy.org/wp-content/uploads/2022/09/headshot-placeholder.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GradientText(
                        FFLocalizations.of(context).getText(
                          'r2ya93rg' /* Yummy Dish */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineMediumFamily),
                            ),
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary
                        ],
                        gradientDirection: GradientDirection.ttb,
                        gradientType: GradientType.linear,
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.notificationBadgeModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const NotificationBadgeWidget(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _model.searchFieldTextController,
                      focusNode: _model.searchFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.searchFieldTextController',
                        const Duration(milliseconds: 2000),
                        () async {
                          if (_model.searchFieldTextController.text == '') {
                            _model.isSearching = false;
                            safeSetState(() {});
                          } else {
                            _model.isSearching = true;
                            safeSetState(() {});
                            await queryRecipesRecordOnce()
                                .then(
                                  (records) => _model
                                      .simpleSearchResults = TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [record.category]),
                                        )
                                        .toList(),
                                  )
                                      .search(
                                          _model.searchFieldTextController.text)
                                      .map((r) => r.object)
                                      .toList(),
                                )
                                .onError(
                                    (_, __) => _model.simpleSearchResults = [])
                                .whenComplete(() => safeSetState(() {}));
                          }
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'p8cwjriq' /* Search... */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.searchFieldTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
            ),
            if (_model.isSearching)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      final searchedRecipes =
                          _model.simpleSearchResults.toList();
                      if (searchedRecipes.isEmpty) {
                        return const Center(
                          child: EmptyWidgetWidget(),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          safeSetState(
                              () => _model.firestoreRequestCompleter = null);
                          await _model.waitForFirestoreRequestCompleted();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: searchedRecipes.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 24.0),
                          itemBuilder: (context, searchedRecipesIndex) {
                            final searchedRecipesItem =
                                searchedRecipes[searchedRecipesIndex];
                            return StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  searchedRecipesItem.poster!),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final recipeComponentUsersRecord =
                                    snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ViewRecipe',
                                      queryParameters: {
                                        'recipeId': serializeParam(
                                          searchedRecipesItem.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model:
                                        _model.recipeComponentModels1.getModel(
                                      'recipe-${searchedRecipesItem.reference.id}',
                                      searchedRecipesIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: RecipeComponentWidget(
                                      key: Key(
                                        'Key7ba_${'recipe-${searchedRecipesItem.reference.id}'}',
                                      ),
                                      title: searchedRecipesItem.title,
                                      description:
                                          searchedRecipesItem.shortDescription,
                                      rating: searchedRecipesItem.avgRating,
                                      numberOfLikes:
                                          searchedRecipesItem.likers.length,
                                      numberOfComments:
                                          searchedRecipesItem.comments.length,
                                      recipeImagePath:
                                          searchedRecipesItem.imagePath,
                                      recipeId: searchedRecipesItem.reference,
                                      posterImagePath: valueOrDefault<String>(
                                        recipeComponentUsersRecord.photoUrl,
                                        'https://www.movedemocracy.org/wp-content/uploads/2022/09/headshot-placeholder.png',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (!_model.isSearching)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<List<RecipesRecord>>(
                    future: (_model.firestoreRequestCompleter ??=
                            Completer<List<RecipesRecord>>()
                              ..complete(queryRecipesRecordOnce(
                                queryBuilder: (recipesRecord) => recipesRecord
                                    .orderBy('created_time', descending: true),
                              )))
                        .future,
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
                      List<RecipesRecord> recipesFeedRecipesRecordList =
                          snapshot.data!;
                      if (recipesFeedRecipesRecordList.isEmpty) {
                        return const Center(
                          child: EmptyWidgetWidget(),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          safeSetState(
                              () => _model.firestoreRequestCompleter = null);
                          await _model.waitForFirestoreRequestCompleted();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: recipesFeedRecipesRecordList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 24.0),
                          itemBuilder: (context, recipesFeedIndex) {
                            final recipesFeedRecipesRecord =
                                recipesFeedRecipesRecordList[recipesFeedIndex];
                            return StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  recipesFeedRecipesRecord.poster!),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final recipeComponentUsersRecord =
                                    snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ViewRecipe',
                                      queryParameters: {
                                        'recipeId': serializeParam(
                                          recipesFeedRecipesRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model:
                                        _model.recipeComponentModels2.getModel(
                                      'recipe-${recipesFeedRecipesRecord.reference.id}',
                                      recipesFeedIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: RecipeComponentWidget(
                                      key: Key(
                                        'Keykxl_${'recipe-${recipesFeedRecipesRecord.reference.id}'}',
                                      ),
                                      title: recipesFeedRecipesRecord.title,
                                      description: recipesFeedRecipesRecord
                                          .shortDescription,
                                      rating:
                                          recipesFeedRecipesRecord.avgRating,
                                      numberOfLikes: valueOrDefault<int>(
                                        recipesFeedRecipesRecord.likers.length,
                                        0,
                                      ),
                                      numberOfComments: valueOrDefault<int>(
                                        recipesFeedRecipesRecord
                                            .comments.length,
                                        0,
                                      ),
                                      recipeImagePath:
                                          recipesFeedRecipesRecord.imagePath,
                                      recipeId:
                                          recipesFeedRecipesRecord.reference,
                                      posterImagePath: valueOrDefault<String>(
                                        recipeComponentUsersRecord.photoUrl,
                                        'https://www.movedemocracy.org/wp-content/uploads/2022/09/headshot-placeholder.png',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
