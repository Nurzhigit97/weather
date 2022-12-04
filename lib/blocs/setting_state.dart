// ignore_for_file: public_member_api_docs, sort_constructors_first
//! для хранения свойств чтобы в Cubit передавать
class SettingState {
  final bool isToggle;
  final String? getCityByLocation;
  SettingState({this.getCityByLocation, required this.isToggle});
}
