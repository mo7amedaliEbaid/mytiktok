
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mytiktok/views/screens/add_video_screen.dart';
import 'package:mytiktok/views/screens/profile_screen.dart';
import 'package:mytiktok/views/screens/search_screen.dart';
import 'package:mytiktok/views/screens/video_screen.dart';

import 'controllers/auth_controller.dart';


List pages = [
  VideoScreen(),
  ProfileScreen(uid: authController.user.uid),
  SearchScreen(),
  const AddVideoScreen(),
];

// COLORS
const backgroundColor = Color(0xFF3D0303);
const buttonColor =Color(0xFFCE2020);
const borderColor = Colors.grey;

//spaces
SizedBox smallvertical_space=SizedBox(height: 5,);
SizedBox mediumvertical_space=SizedBox(height: 10,);
SizedBox mymaxvertical_space=SizedBox(height: 15,);


//styles
TextStyle normalred=TextStyle(
  fontSize: 20,
  color: Colors.red,
  fontWeight: FontWeight.w700,
);

TextStyle normalwhite=const  TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle smallwhite=const TextStyle(
fontSize: 12,
color: Colors.white,
);

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

const String errornetworkimage="https://hips.hearstapps.com/hmg-prod/images/sam-worthington-avatar-the-way-of-the-water-1670323169.jpg?crop=0.528xw:1.00xh;0.134xw,0&resize=1200:*";
