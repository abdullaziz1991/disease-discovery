// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diseases_discovery_bloc.dart';

class DiseasesDiscoveryState extends Equatable {
  bool isListening;
  String recognizedText;
  String diagnosis;
  List<String> advices;
  List<String> filteredSymptoms;
  List<String> selectedSymptoms;
  Locale locale;
  final bool isSpeaking;
  final bool isDiagnosisSpoken;
  DiseasesDiscoveryState({
    List<String>? filteredSymptoms,
    this.isListening = false,
    this.recognizedText = "",
    this.diagnosis = "",
    this.advices = const [],
    this.selectedSymptoms = const [],
    this.locale = const Locale('ar'),
    this.isSpeaking = false,
    this.isDiagnosisSpoken = false,
  }) : filteredSymptoms = filteredSymptoms ?? allSymptoms;

  DiseasesDiscoveryState copyWith({
    bool? isListening,
    String? recognizedText,
    String? diagnosis,
    List<String>? advices,
    List<String>? filteredSymptoms,
    List<String>? selectedSymptoms,
    Locale? locale,
    bool? isSpeaking,
    bool? isDiagnosisSpoken,
  }) {
    return DiseasesDiscoveryState(
      isListening: isListening ?? this.isListening,
      recognizedText: recognizedText ?? this.recognizedText,
      diagnosis: diagnosis ?? this.diagnosis,
      filteredSymptoms: filteredSymptoms ?? this.filteredSymptoms,
      selectedSymptoms: selectedSymptoms ?? this.selectedSymptoms,
      advices: advices ?? this.advices,
      locale: locale ?? this.locale,
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isDiagnosisSpoken: isDiagnosisSpoken ?? this.isDiagnosisSpoken,
    );
  }

  @override
  List<Object?> get props => [
        isListening,
        recognizedText,
        diagnosis,
        advices,
        filteredSymptoms,
        selectedSymptoms,
        locale
      ];
}
