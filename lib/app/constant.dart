import 'package:flutter/material.dart';

List<String> allSymptoms = [
'high_temperature',
'cough',
'sore_throat',
'muscle_pain',
'fatigue',
'exhaustion',
'headache',
'increased_thirst',
'weight_loss',
'blurred_vision',
'dizziness',
'nosebleed',
'shortness_of_breath',
'difficulty_breathing',
'wheezing',
'chest_tightness',
'persistent_sadness',
'loss_of_interest',
'insomnia',
'hypersomnia',
'appetite_changes',
'weight_changes',
'difficulty_concentrating',
'joint_pain',
'joint_swelling',
'joint_stiffness',
'joint_redness',
'joint_warmth',
'chest_pain',
'chest_pressure',
'heart_palpitations',
'memory_loss',
'difficulty_thinking',
'problem_solving_difficulty',
'mood_changes',
'behavioral_changes',
'difficulty_performing_tasks',
'loss_of_appetite',
'nausea',
'vomiting',
'yellow_skin',
'yellow_eyes',
'jaundice',
'sneezing',
'runny_nose',
'itchy_eyes',
'skin_itching',
'skin_rash',
'persistent_cough',
'fever',
'abdominal_pain',
'burning_sensation',
'chronic_diarrhea',
'bloody_diarrhea',
'severe_back_pain',
'lower_back_pain',
'blood_in_urine',
'frequent_urination',
'painful_urination',
'cloudy_urine',
'foul_smelling_urine',
'weakness',
'pale_skin',
'recurrent_fever',
'night_sweats',
'hand_tremor',
'movement_difficulty',
'muscle_stiffness',
'muscle_weakness',
'numbness',
'tingling',
'balance_difficulty',
'ear_pain',
'hearing_loss',
'ear_discharge',
'rapid_weight_loss',
'weight_gain',
'feeling_cold',
'dry_skin',
'increased_appetite',
'rapid_heartbeat',
'persistent_fatigue',
'swollen_lymph_nodes',
'facial_weakness',
'arm_weakness',
'leg_weakness',
'speech_difficulty',
'loss_of_balance',
'severe_itching',
'skin_redness',
'skin_patches',
'severe_headache',
'light_sensitivity',
'sound_sensitivity',
'diarrhea',
'painful_swallowing',
'tonsil_redness',
'tonsil_swelling',
'skin_blisters',
'constant_anxiety',
'tension',
'increased_heartbeat',
'attention_difficulty',
'impulsivity',
'hyperactivity',
'joint_area_swelling',
'skin_itch',
'painless_genital_sores',
'painless_mouth_sores',
'joint_fever',
'heart_inflammation',
'blood_vessel_inflammation'

];

  List<Map<String, dynamic>> herbs = [
    {
      "name": "الزنجبيل",
      "benefits": [
        "يحتوي على مضادات الأكسدة التي تعزز المناعة",
        "يساعد في تحسين عملية الهضم",
        "يخفف الغثيان والقيء"
      ],
      "heals_diseases": [
        "نزلات البرد والإنفلونزا",
        "مشاكل الجهاز الهضمي",
        "الالتهابات وآلام المفاصل"
      ]
    },
    {
      "name": "البابونج",
      "benefits": [
        "يساعد في تهدئة الأعصاب وتحسين النوم",
        "يقلل من التهابات الجهاز الهضمي",
        "يمتلك خصائص مضادة للالتهابات"
      ],
      "heals_diseases": [
        "الأرق والتوتر",
        "اضطرابات المعدة والقولون العصبي",
        "التهابات الجلد والحروق الطفيفة"
      ]
    },
    {
      "name": "الكركم",
      "benefits": [
        "يحتوي على مادة الكركمين المضادة للالتهابات",
        "يساعد في تحسين صحة القلب",
        "يدعم صحة الكبد ويزيل السموم"
      ],
      "heals_diseases": [
        "التهابات المفاصل",
        "أمراض الكبد",
        "أمراض القلب والشرايين"
      ]
    },
    {
      "name": "القرفة",
      "benefits": [
        "تنظم مستوى السكر في الدم",
        "تحسن صحة القلب",
        "تساعد في مكافحة العدوى"
      ],
      "heals_diseases": [
        "السكري",
        "أمراض القلب",
        "الالتهابات الفطرية والبكتيرية"
      ]
    },
    {
      "name": "النعناع",
      "benefits": [
        "يهدئ اضطرابات المعدة",
        "يحسن رائحة الفم",
        "يساعد في تخفيف التوتر"
      ],
      "heals_diseases": [
        "مشاكل الجهاز الهضمي",
        "الغثيان والقيء",
        "آلام الصداع النصفي"
      ]
    },
    {
      "name": "إكليل الجبل",
      "benefits": [
        "يحسن الذاكرة والتركيز",
        "يعزز صحة الجهاز المناعي",
        "يحتوي على مضادات الأكسدة القوية"
      ],
      "heals_diseases": [
        "الصداع والتعب الذهني",
        "اضطرابات الجهاز الهضمي",
        "الالتهابات المزمنة"
      ]
    },
    {
      "name": "اليانسون",
      "benefits": [
        "يهدئ اضطرابات المعدة",
        "يخفف السعال والتهابات الجهاز التنفسي",
        "يساعد في تهدئة الأعصاب"
      ],
      "heals_diseases": [
        "التهابات الجهاز التنفسي",
        "الانتفاخات والغازات",
        "الأرق والتوتر"
      ]
    },
    {
      "name": "الشاي الأخضر",
      "benefits": [
        "يعزز صحة القلب",
        "يحتوي على مضادات الأكسدة",
        "يساعد في خسارة الوزن"
      ],
      "heals_diseases": [
        "ارتفاع ضغط الدم",
        "أمراض القلب",
        "اضطرابات الجهاز الهضمي"
      ]
    },
    {
      "name": "الميرمية",
      "benefits": [
        "تحسن الذاكرة والتركيز",
        "تساعد في تخفيف آلام الحلق",
        "تمتلك خصائص مضادة للبكتيريا"
      ],
      "heals_diseases": ["اضطرابات الذاكرة", "التهابات الحلق", "آلام الحيض"]
    },
    {
      "name": "الزعتر",
      "benefits": [
        "يعزز صحة الجهاز التنفسي",
        "يحسن صحة الفم والأسنان",
        "يدعم صحة الجهاز الهضمي"
      ],
      "heals_diseases": [
        "التهابات الجهاز التنفسي",
        "مشاكل الهضم",
        "التهابات اللثة"
      ]
    },
    {
      "name": "الريحان",
      "benefits": [
        "يحسن صحة الجهاز التنفسي",
        "يقلل من التهابات الحلق",
        "يحتوي على مضادات الأكسدة"
      ],
      "heals_diseases": [
        "التهابات الجهاز التنفسي",
        "الصداع والتوتر",
        "مشاكل الجهاز الهضمي"
      ]
    },
    {
      "name": "اللافندر",
      "benefits": [
        "يساعد في الاسترخاء وتقليل التوتر",
        "يخفف من الصداع",
        "يحسن جودة النوم"
      ],
      "heals_diseases": [
        "الأرق والتوتر",
        "آلام الصداع النصفي",
        "مشاكل الجهاز العصبي"
      ]
    },
    {
      "name": "الحلبة",
      "benefits": [
        "تحسن من مستوى السكر في الدم",
        "تعزز صحة الجهاز الهضمي",
        "تساعد في إدرار الحليب للأمهات المرضعات"
      ],
      "heals_diseases": ["السكري", "مشاكل الجهاز الهضمي", "الالتهابات"]
    },
    {
      "name": "الشمر",
      "benefits": [
        "يساعد في تحسين عملية الهضم",
        "يخفف من المغص والانتفاخ",
        "يدعم صحة الجهاز التنفسي"
      ],
      "heals_diseases": [
        "الانتفاخ والمغص",
        "مشاكل الجهاز التنفسي",
        "التهابات المعدة"
      ]
    },
    {
      "name": "الحبق",
      "benefits": ["يقلل من التوتر", "يخفف من آلام الرأس", "يحسن عملية الهضم"],
      "heals_diseases": ["الصداع", "التوتر", "الغازات"]
    },
    {
      "name": "الطماطم",
      "benefits": [
        "تحسن صحة القلب",
        "تحتوي على مضادات الأكسدة",
        "مفيدة للبشرة"
      ],
      "heals_diseases": ["أمراض القلب", "التجاعيد", "ارتفاع الكولسترول"]
    },
    {
      "name": "الليمون",
      "benefits": [
        "يساعد في تعزيز جهاز المناعة",
        "يخفف من الالتهابات",
        "مفيد لصحة البشرة"
      ],
      "heals_diseases": ["الإنفلونزا", "مشاكل الجلد", "الضغط المرتفع"]
    },
    {
      "name": "الخرشوف",
      "benefits": [
        "يحسن من وظائف الكبد",
        "يخفض مستوى الكولسترول",
        "يدعم صحة الجهاز الهضمي"
      ],
      "heals_diseases": ["أمراض الكبد", "الكولسترول المرتفع", "مشاكل الهضم"]
    },
    {
      "name": "البصل",
      "benefits": [
        "يحسن من صحة القلب",
        "مضاد للبكتيريا",
        "يدعم الجهاز المناعي"
      ],
      "heals_diseases": ["التهابات الجهاز التنفسي", "أمراض القلب", "السكري"]
    },
    {
      "name": "القرنفل",
      "benefits": [
        "يساعد في تخفيف الألم",
        "يحتوي على خصائص مضادة للبكتيريا",
        "مفيد للصحة العامة"
      ],
      "heals_diseases": ["آلام الأسنان", "التهابات", "مشاكل الجهاز التنفسي"]
    },
    {
      "name": "الكمون",
      "benefits": [
        "يحسن الهضم",
        "يساعد في التخلص من الغازات",
        "يساعد في تقليل التوتر"
      ],
      "heals_diseases": ["مشاكل الهضم", "الانتفاخ", "التوتر"]
    },
    {
      "name": "الجزر",
      "benefits": [
        "يحسن صحة العين",
        "يحتوي على مضادات الأكسدة",
        "يساعد في خفض الكولسترول"
      ],
      "heals_diseases": ["مشاكل الرؤية", "ارتفاع الكولسترول", "ضعف المناعة"]
    },
    {
      "name": "الورد",
      "benefits": ["يحسن المزاج", "يقلل من القلق", "يخفف من التوتر"],
      "heals_diseases": ["القلق", "التوتر", "الاكتئاب"]
    },
    {
      "name": "الخوخ",
      "benefits": [
        "يحتوي على مضادات الأكسدة",
        "يساعد في تقليل الالتهابات",
        "يعزز الصحة العامة"
      ],
      "heals_diseases": ["التهابات المفاصل", "السكري", "مشاكل الهضم"]
    },
    {
      "name": "الشمام",
      "benefits": ["مفيد لترطيب الجسم", "يحسن البشرة", "يحتوي على فيتامين C"],
      "heals_diseases": ["الجفاف", "التجاعيد", "الأنيميا"]
    },
    {
      "name": "التين",
      "benefits": [
        "يساعد في تعزيز الهضم",
        "يحتوي على مضادات الأكسدة",
        "يمنح الطاقة"
      ],
      "heals_diseases": ["مشاكل الهضم", "الأنيميا", "التعب"]
    },
    {
      "name": "البقدونس",
      "benefits": [
        "يدعم صحة الكلى",
        "يساعد في تحسين عملية الهضم",
        "يحتوي على فيتامينات مهمة"
      ],
      "heals_diseases": ["مشاكل الكلى", "الهضم", "الالتهابات"]
    },
    {
      "name": "الكرنب",
      "benefits": [
        "يساعد في تحسين الهضم",
        "مفيد لصحة الجلد",
        "يقلل من الالتهابات"
      ],
      "heals_diseases": ["التهابات المعدة", "مشاكل البشرة", "السكري"]
    },
  ];
  Map<String, IconData> herbIcons = {
    "الزنجبيل": Icons.local_florist,
    "البابونج": Icons.spa,
    "الكركم": Icons.eco,
    "القرفة": Icons.emoji_nature,
    "النعناع": Icons.grass,
    "إكليل الجبل": Icons.nature,
    "اليانسون": Icons.local_florist,
    "الشاي الأخضر": Icons.emoji_food_beverage,
    "الميرمية": Icons.spa,
    "الزعتر": Icons.nature_people,
    "الريحان": Icons.grass,
    "اللافندر": Icons.local_florist,
    "الحلبة": Icons.spa,
    "الشمر": Icons.eco,
    "الحبق": Icons.local_florist,
    "الطماطم": Icons.agriculture,
    "الليمون": Icons.lunch_dining,
    "الخرشوف": Icons.restaurant,
    "البصل": Icons.local_dining,
    "القرنفل": Icons.spa,
    "الكمون": Icons.restaurant,
    "الجزر": Icons.agriculture,
    "الورد": Icons.local_florist,
    "المرمية": Icons.spa,
    "الخوخ": Icons.food_bank,
    "الشمام": Icons.lunch_dining,
    "التين": Icons.eco,
    "البقدونس": Icons.grass,
    "الكرنب": Icons.agriculture
  };
