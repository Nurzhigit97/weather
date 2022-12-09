part of 'internet_bloc.dart';

abstract class InternetEvent {}

class ConnectedEvent extends InternetEvent {}

class NotConnectedEvent extends InternetEvent {}
