// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diseases_discovery_bloc.dart';

abstract class DiseasesDiscoveryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// حدث لبدء أو إيقاف الاستماع
class ToggleListeningEvent extends DiseasesDiscoveryEvent {
  final BuildContext context;
  ToggleListeningEvent({required this.context});
}

// حدث لتحديث النص المستمع إليه
class UpdateRecognizedTextEvent extends DiseasesDiscoveryEvent {
  final String newText;
  UpdateRecognizedTextEvent(this.newText);

  @override
  List<Object?> get props => [newText];
}

// حدث لمسح النص المخزن
class ClearRecognizedTextEvent extends DiseasesDiscoveryEvent {}

class SendForDiagnosisEvent extends DiseasesDiscoveryEvent {
//  final DiagnosticMethod method;
  final BuildContext context;
  //final List<String>? selectedSymptoms; , this.selectedSymptoms
  SendForDiagnosisEvent({
    //   required this.method,
    required this.context,
  });
}

// حدث لتحديث البحث في القائمة
class SearchSymptoms extends DiseasesDiscoveryEvent {
  final String query;
  SearchSymptoms(this.query);
}

// حدث لاختيار أو إلغاء اختيار عرض معين
class ToggleSymptomSelection extends DiseasesDiscoveryEvent {
  final String symptom;
  ToggleSymptomSelection(this.symptom);

  @override
  List<Object> get props => [symptom];
}

class ResetValuesEvent extends DiseasesDiscoveryEvent {}

class ChangeLanguageEvent extends DiseasesDiscoveryEvent {
  final BuildContext context;
  ChangeLanguageEvent({required this.context});
  // final Locale locale;
//  ChangeLanguageEvent(this.locale);
}

class SetIsSpeakingEvent extends DiseasesDiscoveryEvent {
  final bool isSpeaking;
  SetIsSpeakingEvent(this.isSpeaking);
}

class SetDiagnosisSpokenEvent extends DiseasesDiscoveryEvent {
  final bool isSpoken;
  SetDiagnosisSpokenEvent(this.isSpoken);
}

class ToggleSpeechEvent extends DiseasesDiscoveryEvent {
  final BuildContext context;
  ToggleSpeechEvent({required this.context});
}

class StopSpeechEvent extends DiseasesDiscoveryEvent {}

class UpdateSpeakingStatus extends DiseasesDiscoveryEvent {
  final bool isSpeaking;

  UpdateSpeakingStatus(this.isSpeaking);
}

class StopDiagnosisSpokenEvent extends DiseasesDiscoveryEvent {}
