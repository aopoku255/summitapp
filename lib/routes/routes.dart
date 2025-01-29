import 'package:cbfapp/screens/agenda/agenda.dart';
import 'package:cbfapp/screens/home.dart';
import 'package:cbfapp/screens/info/info.dart';
import 'package:cbfapp/screens/keynote_speaksers/keynote_speakers.dart';
import 'package:cbfapp/screens/login/HowToLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Define routes as a map
Map<String, WidgetBuilder> get appRoutes{
  return {
    '/': (context) => const Home(),
    '/howToLogIn': (context) => const HowToLogin(),
    '/info': (context) => const Info(),
    '/agenda': (context) => const Agenda(),
    '/keynoteSpeakers': (context) => const KeynoteSpeakers(),
    '/speakers': (context) => const HowToLogin(),
    '/exhibitors': (context) => const HowToLogin(),
    '/sponsors': (context) => const HowToLogin(),
    '/floorPlan': (context) => const HowToLogin(),
    '/search': (context) => const HowToLogin(),
    '/myProfile': (context) => const HowToLogin(),
  };
}

