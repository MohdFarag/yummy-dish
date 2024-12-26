import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_widget_widget.dart';
import '/feed/recipe_component/recipe_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_favourites_model.dart';
export 'user_favourites_model.dart';

class UserFavouritesWidget extends StatefulWidget {
  const UserFavouritesWidget({super.key});

  @override
  State<UserFavouritesWidget> createState() => _UserFavouritesWidgetState();
}

class _UserFavouritesWidgetState extends State<UserFavouritesWidget> {
  late UserFavouritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserFavouritesModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          title: Text(
            FFLocalizations.of(context).getText(
              'kl3h7u6n' /* Favourites */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: const BoxDecoration(),
            child: AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final favouritesList =
                      (currentUserDocument?.favourites.toList() ?? [])
                          .toList();
                  if (favouritesList.isEmpty) {
                    return const Center(
                      child: EmptyWidgetWidget(),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {},
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: favouritesList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 24.0),
                      itemBuilder: (context, favouritesListIndex) {
                        final favouritesListItem =
                            favouritesList[favouritesListIndex];
                        return StreamBuilder<RecipesRecord>(
                          stream: RecipesRecord.getDocument(favouritesListItem),
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

                            final containerRecipesRecord = snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    containerRecipesRecord.poster!),
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
                                            containerRecipesRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: wrapWithModel(
                                      model:
                                          _model.recipeComponentModels.getModel(
                                        'recipe-${containerRecipesRecord.reference.id}',
                                        favouritesListIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: RecipeComponentWidget(
                                        key: Key(
                                          'Key7rg_${'recipe-${containerRecipesRecord.reference.id}'}',
                                        ),
                                        title: containerRecipesRecord.title,
                                        description: containerRecipesRecord
                                            .shortDescription,
                                        rating:
                                            containerRecipesRecord.avgRating,
                                        numberOfLikes: containerRecipesRecord
                                            .likers.length,
                                        numberOfComments: containerRecipesRecord
                                            .comments.length,
                                        recipeImagePath:
                                            containerRecipesRecord.imagePath,
                                        recipeId:
                                            containerRecipesRecord.reference,
                                        posterImagePath: valueOrDefault<String>(
                                          recipeComponentUsersRecord.photoUrl,
                                          'https://www.movedemocracy.org/wp-content/uploads/2022/09/headshot-placeholder.png',
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
        ),
      ),
    );
  }
}
