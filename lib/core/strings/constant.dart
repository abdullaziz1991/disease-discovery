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
    "name": "Ginger",
    "benefits": [
      "Contains antioxidants that boost immunity",
      "Helps improve digestion",
      "Relieves nausea and vomiting"
    ],
    "heals_diseases": [
      "Colds and flu",
      "Digestive problems",
      "Inflammations and joint pain"
    ]
  },
  {
    "name": "Chamomile",
    "benefits": [
      "Helps calm nerves and improve sleep",
      "Reduces digestive system inflammation",
      "Has anti-inflammatory properties"
    ],
    "heals_diseases": [
      "Insomnia and stress",
      "Stomach disorders and IBS",
      "Skin inflammations and minor burns"
    ]
  },
  {
    "name": "Turmeric",
    "benefits": [
      "Contains curcumin with anti-inflammatory effects",
      "Helps improve heart health",
      "Supports liver health and detoxification"
    ],
    "heals_diseases": [
      "Joint inflammation",
      "Liver diseases",
      "Heart and arterial diseases"
    ]
  },
  {
    "name": "Cinnamon",
    "benefits": [
      "Regulates blood sugar levels",
      "Improves heart health",
      "Helps fight infections"
    ],
    "heals_diseases": [
      "Diabetes",
      "Heart diseases",
      "Fungal and bacterial infections"
    ]
  },
  {
    "name": "Mint",
    "benefits": [
      "Soothes stomach disorders",
      "Improves breath freshness",
      "Helps relieve stress"
    ],
    "heals_diseases": [
      "Digestive system issues",
      "Nausea and vomiting",
      "Migraine headaches"
    ]
  },
  {
    "name": "Rosemary",
    "benefits": [
      "Improves memory and concentration",
      "Boosts immune system health",
      "Contains powerful antioxidants"
    ],
    "heals_diseases": [
      "Headache and mental fatigue",
      "Digestive disorders",
      "Chronic inflammations"
    ]
  },
  {
    "name": "Anise",
    "benefits": [
      "Soothes stomach disorders",
      "Relieves cough and respiratory infections",
      "Helps calm the nerves"
    ],
    "heals_diseases": [
      "Respiratory infections",
      "Bloating and gas",
      "Insomnia and stress"
    ]
  },
  {
    "name": "Green Tea",
    "benefits": [
      "Boosts heart health",
      "Contains antioxidants",
      "Helps with weight loss"
    ],
    "heals_diseases": [
      "High blood pressure",
      "Heart diseases",
      "Digestive disorders"
    ]
  },
  {
    "name": "Sage",
    "benefits": [
      "Improves memory and concentration",
      "Helps relieve sore throat pain",
      "Has antibacterial properties"
    ],
    "heals_diseases": [
      "Memory disorders",
      "Throat infections",
      "Menstrual pain"
    ]
  },
  {
    "name": "Thyme",
    "benefits": [
      "Boosts respiratory system health",
      "Improves oral and dental health",
      "Supports digestive health"
    ],
    "heals_diseases": [
      "Respiratory infections",
      "Digestive issues",
      "Gum inflammations"
    ]
  },
  {
    "name": "Basil",
    "benefits": [
      "Improves respiratory system health",
      "Reduces throat inflammation",
      "Contains antioxidants"
    ],
    "heals_diseases": [
      "Respiratory infections",
      "Headache and stress",
      "Digestive problems"
    ]
  },
  {
    "name": "Lavender",
    "benefits": [
      "Helps relax and reduce stress",
      "Relieves headaches",
      "Improves sleep quality"
    ],
    "heals_diseases": [
      "Insomnia and stress",
      "Migraine pain",
      "Nervous system problems"
    ]
  },
  {
    "name": "Fenugreek",
    "benefits": [
      "Improves blood sugar levels",
      "Enhances digestive health",
      "Helps in milk production for breastfeeding mothers"
    ],
    "heals_diseases": ["Diabetes", "Digestive issues", "Inflammations"]
  },
  {
    "name": "Fennel",
    "benefits": [
      "Helps improve digestion",
      "Relieves colic and bloating",
      "Supports respiratory health"
    ],
    "heals_diseases": [
      "Bloating and colic",
      "Respiratory problems",
      "Stomach inflammations"
    ]
  },
  {
    "name": "Sweet Basil",
    "benefits": ["Reduces stress", "Relieves headaches", "Improves digestion"],
    "heals_diseases": ["Headache", "Stress", "Gas"]
  },
  {
    "name": "Tomato",
    "benefits": [
      "Improves heart health",
      "Rich in antioxidants",
      "Good for skin"
    ],
    "heals_diseases": ["Heart diseases", "Wrinkles", "High cholesterol"]
  },
  {
    "name": "Lemon",
    "benefits": [
      "Helps boost the immune system",
      "Reduces inflammation",
      "Good for skin health"
    ],
    "heals_diseases": ["Flu", "Skin problems", "High blood pressure"]
  },
  {
    "name": "Artichoke",
    "benefits": [
      "Improves liver function",
      "Lowers cholesterol levels",
      "Supports digestive health"
    ],
    "heals_diseases": [
      "Liver diseases",
      "High cholesterol",
      "Digestive problems"
    ]
  },
  {
    "name": "Onion",
    "benefits": [
      "Improves heart health",
      "Antibacterial properties",
      "Supports the immune system"
    ],
    "heals_diseases": ["Respiratory infections", "Heart diseases", "Diabetes"]
  },
  {
    "name": "Clove",
    "benefits": [
      "Helps relieve pain",
      "Has antibacterial properties",
      "Good for overall health"
    ],
    "heals_diseases": ["Toothache", "Inflammations", "Respiratory problems"]
  },
  {
    "name": "Cumin",
    "benefits": [
      "Improves digestion",
      "Helps eliminate gas",
      "Helps reduce stress"
    ],
    "heals_diseases": ["Digestive problems", "Bloating", "Stress"]
  },
  {
    "name": "Carrot",
    "benefits": [
      "Improves eye health",
      "Rich in antioxidants",
      "Helps lower cholesterol"
    ],
    "heals_diseases": ["Vision problems", "High cholesterol", "Weak immunity"]
  },
  {
    "name": "Rose",
    "benefits": ["Improves mood", "Reduces anxiety", "Relieves stress"],
    "heals_diseases": ["Anxiety", "Stress", "Depression"]
  },
  {
    "name": "Peach",
    "benefits": [
      "Rich in antioxidants",
      "Helps reduce inflammation",
      "Boosts overall health"
    ],
    "heals_diseases": ["Arthritis", "Diabetes", "Digestive problems"]
  },
  {
    "name": "Cantaloupe",
    "benefits": [
      "Good for body hydration",
      "Improves skin",
      "Rich in vitamin C"
    ],
    "heals_diseases": ["Dehydration", "Wrinkles", "Anemia"]
  },
  {
    "name": "Fig",
    "benefits": [
      "Helps improve digestion",
      "Rich in antioxidants",
      "Provides energy"
    ],
    "heals_diseases": ["Digestive issues", "Anemia", "Fatigue"]
  },
  {
    "name": "Parsley",
    "benefits": [
      "Supports kidney health",
      "Helps improve digestion",
      "Rich in essential vitamins"
    ],
    "heals_diseases": ["Kidney problems", "Digestion", "Inflammations"]
  },
  {
    "name": "Cabbage",
    "benefits": [
      "Helps improve digestion",
      "Good for skin health",
      "Reduces inflammation"
    ],
    "heals_diseases": ["Stomach inflammation", "Skin problems", "Diabetes"]
  }
];

Map<String, IconData> herbIcons = {
  "Ginger": Icons.local_florist,
  "Chamomile": Icons.spa,
  "Turmeric": Icons.eco,
  "Cinnamon": Icons.emoji_nature,
  "Mint": Icons.grass,
  "Rosemary": Icons.nature,
  "Anise": Icons.local_florist,
  "Green Tea": Icons.emoji_food_beverage,
  "Sage": Icons.spa,
  "Thyme": Icons.nature_people,
  "Basil": Icons.grass,
  "Lavender": Icons.local_florist,
  "Fenugreek": Icons.spa,
  "Fennel": Icons.eco,
  "Sweet Basil": Icons.local_florist,
  "Tomato": Icons.agriculture,
  "Lemon": Icons.lunch_dining,
  "Artichoke": Icons.restaurant,
  "Onion": Icons.local_dining,
  "Clove": Icons.spa,
  "Cumin": Icons.restaurant,
  "Carrot": Icons.agriculture,
  "Rose": Icons.local_florist,
  "Peach": Icons.food_bank,
  "Cantaloupe": Icons.lunch_dining,
  "Fig": Icons.eco,
  "Parsley": Icons.grass,
  "Cabbage": Icons.agriculture
};

// Map<String, IconData> herbIcons = {
//   "الزنجبيل": Icons.local_florist,
//   "البابونج": Icons.spa,
//   "الكركم": Icons.eco,
//   "القرفة": Icons.emoji_nature,
//   "النعناع": Icons.grass,
//   "إكليل الجبل": Icons.nature,
//   "اليانسون": Icons.local_florist,
//   "الشاي الأخضر": Icons.emoji_food_beverage,
//   "الميرمية": Icons.spa,
//   "الزعتر": Icons.nature_people,
//   "الريحان": Icons.grass,
//   "اللافندر": Icons.local_florist,
//   "الحلبة": Icons.spa,
//   "الشمر": Icons.eco,
//   "الحبق": Icons.local_florist,
//   "الطماطم": Icons.agriculture,
//   "الليمون": Icons.lunch_dining,
//   "الخرشوف": Icons.restaurant,
//   "البصل": Icons.local_dining,
//   "القرنفل": Icons.spa,
//   "الكمون": Icons.restaurant,
//   "الجزر": Icons.agriculture,
//   "الورد": Icons.local_florist,
//   "المرمية": Icons.spa,
//   "الخوخ": Icons.food_bank,
//   "الشمام": Icons.lunch_dining,
//   "التين": Icons.eco,
//   "البقدونس": Icons.grass,
//   "الكرنب": Icons.agriculture
// };
