import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

int? startCountFromOne(int index) {
  return index + 1;
}

int calcNumOfLikes(
  int numberOfLikes,
  bool isLiked,
) {
  if (isLiked) {
    return numberOfLikes + 1;
  }
  return numberOfLikes;
}

double calculateAvgRating(
  int currentNumberOfRatings,
  double currentAvgRating,
  double newAddedRating,
) {
  var currentSumOfAllRating = currentAvgRating * currentNumberOfRatings;
  var newSumOfAllRating = currentSumOfAllRating + newAddedRating;
  var newNumberOfRatings = currentNumberOfRatings + 1;
  var newAvgRating = newSumOfAllRating / (newNumberOfRatings);

  return newAvgRating;
}
