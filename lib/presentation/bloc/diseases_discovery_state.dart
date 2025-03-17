// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diseases_discovery_bloc.dart';

class DiseasesDiscoveryState extends Equatable {
  bool isListening;
  String recognizedText;
  String diagnosis;
  List<String> advices;
   List<String> filteredSymptoms;
   List<String> selectedSymptoms;
  DiseasesDiscoveryState({
    this.isListening = false,
    this.recognizedText = "",
    this.diagnosis = "",
     this.advices=const [],
    List<String>? filteredSymptoms,
     this.selectedSymptoms=const [],
  }):filteredSymptoms=filteredSymptoms??allSymptoms;

  DiseasesDiscoveryState copyWith({
    bool? isListening,
    String? recognizedText,
    String? diagnosis,
    List<String>? advices,
    List<String>? filteredSymptoms,
    List<String>? selectedSymptoms,
  }) {
    return DiseasesDiscoveryState(
      isListening: isListening ?? this.isListening,
      recognizedText: recognizedText ?? this.recognizedText,
      diagnosis: diagnosis ?? this.diagnosis,
      filteredSymptoms: filteredSymptoms ?? this.filteredSymptoms,
      selectedSymptoms: selectedSymptoms ?? this.selectedSymptoms,
      advices: advices ?? this.advices,
    );
  }

  @override
  List<Object?> get props => [
        isListening,
        recognizedText,
        diagnosis,
        advices,
        filteredSymptoms,
        selectedSymptoms
      ];
}
