// 
// Map<String, String> extractSymptoms(String text) {
//   Map<String, String> symptoms = {
//     'itching': "0",
//     'skin_rash': "0",
//     'nodal_skin_eruptions': "0",
//     'continuous_sneezing': "0",
//     'shivering': "0",
//     'chills': "0",
//     'joint_pain': "0",
//     'stomach_pain': "0",
//     'acidity': "0",
//     'ulcers_on_tongue': "0",
//     'muscle_wasting': "0",
//     'vomiting': "0",
//     'burning_micturition': "0",
//     'spotting_ urination': "0",
//     'fatigue': "0",
//     'weight_gain': "0",
//     'anxiety': "0",
//     'cold_hands_and_feets': "0",
//     'mood_swings': "0",
//     'weight_loss': "0",
//     'restlessness': "0",
//     'lethargy': "0",
//     'patches_in_throat': "0",
//     'irregular_sugar_level': "0",
//     'cough': "0",
//     'high_fever': "0",
//     'sunken_eyes': "0",
//     'breathlessness': "0",
//     'sweating': "0",
//     'dehydration': "0",
//     'indigestion': "0",
//     'headache': "0",
//     'yellowish_skin': "0",
//     'dark_urine': "0",
//     'nausea': "0",
//     'loss_of_appetite': "0",
//     'pain_behind_the_eyes': "0",
//     'back_pain': "0",
//     'constipation': "0",
//     'abdominal_pain': "0",
//     'diarrhoea': "0",
//     'mild_fever': "0",
//     'yellow_urine': "0",
//     'yellowing_of_eyes': "0",
//     'acute_liver_failure': "0",
//     'fluid_overload': "0",
//     'swelling_of_stomach': "0",
//     'swelled_lymph_nodes': "0",
//     'malaise': "0",
//     'blurred_and_distorted_vision': "0",
//     'phlegm': "0",
//     'throat_irritation': "0",
//     'redness_of_eyes': "0",
//     'sinus_pressure': "0",
//     'runny_nose': "0",
//     'congestion': "0",
//     'chest_pain': "0",
//     'weakness_in_limbs': "0",
//     'fast_heart_rate': "0",
//     'pain_during_bowel_movements': "0",
//     'pain_in_anal_region': "0",
//     'bloody_stool': "0",
//     'irritation_in_anus': "0",
//     'neck_pain': "0",
//     'dizziness': "0",
//     'cramps': "0",
//     'bruising': "0",
//     'obesity': "0",
//     'swollen_legs': "0",
//     'swollen_blood_vessels': "0",
//     'puffy_face_and_eyes': "0",
//     'enlarged_thyroid': "0",
//     'brittle_nails': "0",
//     'swollen_extremeties': "0",
//     'excessive_hunger': "0",
//     'extra_marital_contacts': "0",
//     'drying_and_tingling_lips': "0",
//     'slurred_speech': "0",
//     'knee_pain': "0",
//     'hip_joint_pain': "0",
//     'muscle_weakness': "0",
//     'stiff_neck': "0",
//     'swelling_joints': "0",
//     'movement_stiffness': "0",
//     'spinning_movements': "0",
//     'loss_of_balance': "0",
//     'unsteadiness': "0",
//     'weakness_of_one_body_side': "0",
//     'loss_of_smell': "0",
//     'bladder_discomfort': "0",
//     'foul_smell_of urine': "0",
//     'continuous_feel_of_urine': "0",
//     'passage_of_gases': "0",
//     'internal_itching': "0",
//     'toxic_look_(typhos)': "0",
//     'depression': "0",
//     'irritability': "0",
//     'muscle_pain': "0",
//     'altered_sensorium': "0",
//     'red_spots_over_body': "0",
//     'belly_pain': "0",
//     'abnormal_menstruation': "0",
//     'dischromic _patches': "0",
//     'watering_from_eyes': "0",
//     'increased_appetite': "0",
//     'polyuria': "0",
//     'family_history': "0",
//     'mucoid_sputum': "0",
//     'rusty_sputum': "0",
//     'lack_of_concentration': "0",
//     'visual_disturbances': "0",
//     'receiving_blood_transfusion': "0",
//     'receiving_unsterile_injections': "0",
//     'coma': "0",
//     'stomach_bleeding': "0",
//     'distention_of_abdomen': "0",
//     'history_of_alcohol_consumption': "0",

//     'blood_in_sputum': "0",
//     'prominent_veins_on_calf': "0",
//     'palpitations': "0",
//     'painful_walking': "0",
//     'pus_filled_pimples': "0",
//     'blackheads': "0",
//     'scurring': "0",
//     'skin_peeling': "0",
//     'silver_like_dusting': "0",
//     'small_dents_in_nails': "0",
//     'inflammatory_nails': "0",
//     'blister': "0",
//     'red_sore_around_nose': "0",
//     'yellow_crust_ooze': "0"
//   };

//   String lowerText = text.toLowerCase();
// // تحويل النص لأحرف صغيرة
// //String lowerText = text.toLowerCase();

// // بداية الشروط
//   if (lowerText.contains(RegExp(r'حكه|هرش|حَكَّة|حكّة'))) {
//     symptoms['itching'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'طفح جلدي|بقع جلد|احمرار الجلد'))) {
//     symptoms['skin_rash'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تقرحات جلد|انتفاخات جلد'))) {
//     symptoms['nodal_skin_eruptions'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'عطس متواصل|عطاس مستمر'))) {
//     symptoms['continuous_sneezing'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'رعشة|ارتجاف'))) {
//     symptoms['shivering'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'قشعريرة|برد مفاجئ'))) {
//     symptoms['chills'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'الم مفاصل|تيبس المفاصل'))) {
//     symptoms['joint_pain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'الم معدة|وجع بطن'))) {
//     symptoms['stomach_pain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حموضه|حرقة معدة'))) {
//     symptoms['acidity'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تقرحات لسان|قروح لسان'))) {
//     symptoms['ulcers_on_tongue'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ضمور عضلات|هزال عضلي'))) {
//     symptoms['muscle_wasting'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ترجيع|استفراغ'))) {
//     symptoms['vomiting'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حرقان بول|الم عند التبول'))) {
//     symptoms['burning_micturition'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'نزول دم مع البول|بقع بول'))) {
//     symptoms['spotting_ urination'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تعب|إرهاق'))) {
//     symptoms['fatigue'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'زيادة وزن|سمنة مفاجئة'))) {
//     symptoms['weight_gain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'قلق|توتر'))) {
//     symptoms['anxiety'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'برودة أطراف|يدين وقدمين باردة'))) {
//     symptoms['cold_hands_and_feets'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تقلبات مزاج|تغيير المزاج'))) {
//     symptoms['mood_swings'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'فقدان وزن|نقص وزن'))) {
//     symptoms['weight_loss'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تململ|عدم راحة'))) {
//     symptoms['restlessness'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'خمول|كسل'))) {
//     symptoms['lethargy'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'بقع في الحلق|رقع بلعوم'))) {
//     symptoms['patches_in_throat'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'سكر غير منتظم|تذبذب سكر الدم'))) {
//     symptoms['irregular_sugar_level'] = "1";
//   }
// // أعراض الجهاز التنفسي
//   if (lowerText.contains(RegExp(r'سعال|كحه|كحة'))) {
//     symptoms['cough'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حمى شديدة|سخونة عالية'))) {
//     symptoms['high_fever'] = "1";
//   }

// // أعراض العيون
//   if (lowerText.contains(RegExp(r'عيون غائرة|انخفاض العيون'))) {
//     symptoms['sunken_eyes'] = "1";
//   }

// // أعراض تنفسية
//   if (lowerText.contains(RegExp(r'ضيق تنفس|اختناق'))) {
//     symptoms['breathlessness'] = "1";
//   }

// // أعراض عامة
//   if (lowerText.contains(RegExp(r'تعرق|إفراز عرق'))) {
//     symptoms['sweating'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'جفاف|قلة سوائل'))) {
//     symptoms['dehydration'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'عسر هضم|صعوبة هضم'))) {
//     symptoms['indigestion'] = "1";
//   }

// // ألام الرأس والعيون
//   if (lowerText.contains(RegExp(r'صداع|الم راس'))) {
//     symptoms['headache'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'الم خلف العين|وجع وراء العيون'))) {
//     symptoms['pain_behind_the_eyes'] = "1";
//   }

// // أعراض كبدية
//   if (lowerText.contains(RegExp(r'اصفرار الجلد|يبوسة الجلد'))) {
//     symptoms['yellowish_skin'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'بول داكن|لون بول غامق'))) {
//     symptoms['dark_urine'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'غثيان|دوخة'))) {
//     symptoms['nausea'] = "1";
//   }

// // أعراض غذائية
//   if (lowerText.contains(RegExp(r'فقدان شهية|عدم رغبة بالأكل'))) {
//     symptoms['loss_of_appetite'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'امساك|صعوبة إخراج'))) {
//     symptoms['constipation'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'اسهال|إسهال'))) {
//     symptoms['diarrhoea'] = "1";
//   }

// // ألام البطن
//   if (lowerText.contains(RegExp(r'الم بطن|وجع معدة'))) {
//     symptoms['abdominal_pain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حمى خفيفة|سخونة بسيطة'))) {
//     symptoms['mild_fever'] = "1";
//   }

// // أعراض بولية
//   if (lowerText.contains(RegExp(r'بول أصفر|لون بول فاتح'))) {
//     symptoms['yellow_urine'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'اصفرار العين|بياض عين مصفر'))) {
//     symptoms['yellowing_of_eyes'] = "1";
//   }

// // أعراض خطيرة
//   if (lowerText.contains(RegExp(r'فشل كبدي|توقف الكبد'))) {
//     symptoms['acute_liver_failure'] = "1";
//   }

// // أعراض السوائل والتورم
//   if (lowerText.contains(RegExp(r'احتباس سوائل|زيادة السوائل'))) {
//     symptoms['fluid_overload'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تورم البطن|انتفاخ المعدة'))) {
//     symptoms['swelling_of_stomach'] = "1";
//   }
//   if (lowerText
//       .contains(RegExp(r'تضخم الغدد الليمفاوية|انتفاخ العقد اللمفاوية'))) {
//     symptoms['swelled_lymph_nodes'] = "1";
//   }

// // أعراض عامة
//   if (lowerText.contains(RegExp(r'توعك|إرهاق عام'))) {
//     symptoms['malaise'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'زغللة|رؤية مشوشة'))) {
//     symptoms['blurred_and_distorted_vision'] = "1";
//   }

// // أعراض الجهاز التنفسي
//   if (lowerText.contains(RegExp(r'بلغم|مخاط'))) {
//     symptoms['phlegm'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تهيج الحلق|حكة الحلق'))) {
//     symptoms['throat_irritation'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'احمرار العين|عيون محتقنة'))) {
//     symptoms['redness_of_eyes'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ضغط الجيوب الأنفية|ألم الجيوب'))) {
//     symptoms['sinus_pressure'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'سيلان الأنف|رشح'))) {
//     symptoms['runny_nose'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'احتقان|انسداد الأنف')))
//     symptoms['congestion'] = "1";

// // أعراض صدرية
//   if (lowerText.contains(RegExp(r'ألم صدر|ضيق في الصدر'))) {
//     symptoms['chest_pain'] = "1";
//   }

// // أعراض عضلية
//   if (lowerText.contains(RegExp(r'ضعف في الأطراف|وهن في الأرجل'))) {
//     symptoms['weakness_in_limbs'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'سرعة نبضات القلب|خفقان'))) {
//     symptoms['fast_heart_rate'] = "1";
//   }

// // أعراض شرجية
//   if (lowerText.contains(RegExp(r'ألم أثناء التبرز|وجع عند الإخراج'))) {
//     symptoms['pain_during_bowel_movements'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ألم شرجي|حرقان في فتحة الشرج'))) {
//     symptoms['pain_in_anal_region'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'براز دموي|دم في البراز'))) {
//     symptoms['bloody_stool'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تهيج شرجي|حكة في الشرج'))) {
//     symptoms['irritation_in_anus'] = "1";
//   }

// // ألام الرقبة والدوخة
//   if (lowerText.contains(RegExp(r'ألم رقبة|تيبس الرقبة'))) {
//     symptoms['neck_pain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'دوخة|إحساس بالدوران'))) {
//     symptoms['dizziness'] = "1";
//   }

// // تشنجات وإصابات
//   if (lowerText.contains(RegExp(r'تشنجات|تقلصات عضلية'))) {
//     symptoms['cramps'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'كدمات|بقع زرقاء'))) {
//     symptoms['bruising'] = "1";
//   }

// // أعراض الوزن
//   if (lowerText.contains(RegExp(r'سمنة|زيادة وزن مفرطة'))) {
//     symptoms['obesity'] = "1";
//   }

// // تورم الأطراف
//   if (lowerText.contains(RegExp(r'تورم الساقين|قدمين متورمتين'))) {
//     symptoms['swollen_legs'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تورم الأوعية الدموية|عروق منتفخة'))) {
//     symptoms['swollen_blood_vessels'] = "1";
//   }
// // أعراض الوجه والعيون
//   if (lowerText.contains(RegExp(r'تورم الوجه|انتفاخ الوجه|وجه منتفخ'))) {
//     symptoms['puffy_face_and_eyes'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تضخم الغدة الدرقية|كبر حجم الدرقية'))) {
//     symptoms['enlarged_thyroid'] = "1";
//   }

// // أعراض الأظافر
//   if (lowerText.contains(RegExp(r'هشاشة أظافر|تقصف الأظافر'))) {
//     symptoms['brittle_nails'] = "1";
//   }

// // تورم الأطراف
//   if (lowerText.contains(RegExp(r'تورم الأطراف|انتفاخ اليدين والقدمين'))) {
//     symptoms['swollen_extremeties'] = "1";
//   }

// // أعراض غذائية
//   if (lowerText.contains(RegExp(r'جوع شديد|شراهة في الأكل'))) {
//     symptoms['excessive_hunger'] = "1";
//   }

// // حالات صحية خاصة
//   if (lowerText.contains(RegExp(r'علاقات جنسية خطرة|اتصالات غير شرعية'))) {
//     symptoms['extra_marital_contacts'] = "1";
//   }

// // أعراض الفم
//   if (lowerText.contains(RegExp(r'جفاف الشفاه|وخز في الشفاه'))) {
//     symptoms['drying_and_tingling_lips'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ثقل في اللسان|كلام متداخل'))) {
//     symptoms['slurred_speech'] = "1";
//   }

// // ألام المفاصل
//   if (lowerText.contains(RegExp(r'ألم ركبة|وجع ركبة'))) {
//     symptoms['knee_pain'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ألم ورك|وجع مفصل الفخذ'))) {
//     symptoms['hip_joint_pain'] = "1";
//   }

// // أعراض عضلية
//   if (lowerText.contains(RegExp(r'ضعف عضلات|وهن عضلي'))) {
//     symptoms['muscle_weakness'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تيبس الرقبة|صلابة الرقبة'))) {
//     symptoms['stiff_neck'] = "1";
//   }

// // أعراض المفاصل
//   if (lowerText.contains(RegExp(r'تورم المفاصل|انتفاخ المفاصل'))) {
//     symptoms['swelling_joints'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تيبس الحركة|صعوبة في الحركة'))) {
//     symptoms['movement_stiffness'] = "1";
//   }

// // أعراض عصبية
//   if (lowerText.contains(RegExp(r'دوار|شعور بالدوران'))) {
//     symptoms['spinning_movements'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'فقدان التوازن|عدم اتزان'))) {
//     symptoms['loss_of_balance'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ترنح|عدم ثبات'))) {
//     symptoms['unsteadiness'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ضعف في جانب واحد|شلل نصفي'))) {
//     symptoms['weakness_of_one_body_side'] = "1";
//   }

// // أعراض الحواس
//   if (lowerText.contains(RegExp(r'فقدان الشم|عدم تمييز الروائح'))) {
//     symptoms['loss_of_smell'] = "1";
//   }

// // أعراض بولية
//   if (lowerText.contains(RegExp(r'ألم مثانة|حرقة في المثانة'))) {
//     symptoms['bladder_discomfort'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'رائحة بول كريهة|بول نتن'))) {
//     symptoms['foul_smell_of urine'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'رغبة مستمرة في التبول|شعور دائم بالتبول'))) {
//     symptoms['continuous_feel_of_urine'] = "1";
//   }

// // أعراض هضمية
//   if (lowerText.contains(RegExp(r'غازات|انتفاخ البطن'))) {
//     symptoms['passage_of_gases'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حكة داخلية|هرش داخلي'))) {
//     symptoms['internal_itching'] = "1";
//   }

// // أعراض خطيرة
//   if (lowerText.contains(RegExp(r'مظهر سام|علامات تيفوئيد'))) {
//     symptoms['toxic_look_(typhos)'] = "1";
//   }
// // أعراض نفسية
//   if (lowerText.contains(RegExp(r'اكتئاب|حزن شديد'))) {
//     symptoms['depression'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تهيج|نرفزة'))) {
//     symptoms['irritability'] = "1";
//   }

// // ألام عضلية
//   if (lowerText.contains(RegExp(r'الم عضلات|وجع عضلي'))) {
//     symptoms['muscle_pain'] = "1";
//   }

// // أعراض عصبية
//   if (lowerText.contains(RegExp(r'تغير في الوعي|اضطراب إدراكي'))) {
//     symptoms['altered_sensorium'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'بقع حمراء على الجلد|طفح جلدي أحمر'))) {
//     symptoms['red_spots_over_body'] = "1";
//   }

// // أعراض هضمية
//   if (lowerText.contains(RegExp(r'الم بطن|انتفاخ البطن'))) {
//     symptoms['belly_pain'] = "1";
//   }

// // أعراض نسائية
//   if (lowerText.contains(RegExp(r'اضطراب الدورة الشهرية|نزيف غير طبيعي'))) {
//     symptoms['abnormal_menstruation'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'بقع جلدية ملونة|تصبغات جلدية'))) {
//     symptoms['dischromic _patches'] = "1";
//   }

// // أعراض العيون
//   if (lowerText.contains(RegExp(r'دماع العيون|تدميع'))) {
//     symptoms['watering_from_eyes'] = "1";
//   }

// // أعراض غذائية
//   if (lowerText.contains(RegExp(r'زيادة الشهية|جوع مفرط'))) {
//     symptoms['increased_appetite'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تبول متكرر|كثرة التبول'))) {
//     symptoms['polyuria'] = "1";
//   }

// // تاريخ عائلي
//   if (lowerText.contains(RegExp(r'تاريخ عائلي مرضي|أمراض وراثية'))) {
//     symptoms['family_history'] = "1";
//   }

// // أعراض تنفسية
//   if (lowerText.contains(RegExp(r'بلغم مخاطي|إفرازات لزجة'))) {
//     symptoms['mucoid_sputum'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'بلغم بني|بلغم صدئ'))) {
//     symptoms['rusty_sputum'] = "1";
//   }

// // أعراض عصبية
//   if (lowerText.contains(RegExp(r'صعوبة تركيز|شرود ذهني'))) {
//     symptoms['lack_of_concentration'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'اضطرابات بصرية|زغللة في العين'))) {
//     symptoms['visual_disturbances'] = "1";
//   }

// // إجراءات طبية
//   if (lowerText.contains(RegExp(r'نقل دم|تلقى دم'))) {
//     symptoms['receiving_blood_transfusion'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'حقن غير معقمة|إبر ملوثة'))) {
//     symptoms['receiving_unsterile_injections'] = "1";
//   }

// // حالات حرجة
//   if (lowerText.contains(RegExp(r'غيبوبة|فقدان الوعي'))) {
//     symptoms['coma'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'نزيف معدي|نزيف في المعدة'))) {
//     symptoms['stomach_bleeding'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'انتفاخ البطن|توسع البطن'))) {
//     symptoms['distention_of_abdomen'] = "1";
//   }

// // تاريخ شخصي
//   if (lowerText.contains(RegExp(r'تاريخ مع الكحول|إدمان كحول'))) {
//     symptoms['history_of_alcohol_consumption'] = "1";
//   }



// // أعراض تنفسية خطيرة
//   if (lowerText.contains(RegExp(r'دم في البلغم|نفث الدم'))) {
//     symptoms['blood_in_sputum'] = "1";
//   }

// // أوعية دموية
//   if (lowerText.contains(RegExp(r'أوردة بارزة في الساق|عروق ظاهرة'))) {
//     symptoms['prominent_veins_on_calf'] = "1";
//   }

// // أعراض قلبية
//   if (lowerText.contains(RegExp(r'خفقان|سرعة نبض|شعور بالنبض'))) {
//     symptoms['palpitations'] = "1";
//   }

// // أعراض حركية
//   if (lowerText.contains(RegExp(r'ألم عند المشي|صعوبة في المشي'))) {
//     symptoms['painful_walking'] = "1";
//   }

// // أعراض جلدية
//   if (lowerText.contains(RegExp(r'بثور صديدية|حبوب مليئة بالصديد'))) {
//     symptoms['pus_filled_pimples'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'رؤوس سوداء|كوميدونات'))) {
//     symptoms['blackheads'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'ندبات|آثار جلدية'))) {
//     symptoms['scurring'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'تقشير الجلد|تساقط الجلد'))) {
//     symptoms['skin_peeling'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'غبار فضي|طبقة فضية على الجلد'))) {
//     symptoms['silver_like_dusting'] = "1";
//   }

// // أعراض الأظافر
//   if (lowerText.contains(RegExp(r'نقرات في الأظافر|حفر صغيرة في الأظافر'))) {
//     symptoms['small_dents_in_nails'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'التهاب الأظافر|احمرار حول الأظافر'))) {
//     symptoms['inflammatory_nails'] = "1";
//   }

// // أمراض جلدية
//   if (lowerText.contains(RegExp(r'نفطات|فقاعات جلدية'))) {
//     symptoms['blister'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'احمرار حول الأنف|التهاب حول الأنف'))) {
//     symptoms['red_sore_around_nose'] = "1";
//   }
//   if (lowerText.contains(RegExp(r'قشور صفراء|إفرازات صفراء'))) {
//     symptoms['yellow_crust_ooze'] = "1";
//   }

//   return symptoms;
// }

