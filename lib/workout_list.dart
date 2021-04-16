import 'models/models.dart';

List<WorkoutItem> WORKOUT = const [
  // Arms
  WorkoutItem(workout: {
    1: [
      Workout(id: 1, name: "Plank"),
      Workout(id: 2, name: "Side Plank"),
      Workout(id: 3, name: "Bicycles"),
      Workout(id: 4, name: "Knee Crunch"),
      Workout(id: 5, name: "Leg Raises"),
      Workout(id: 6, name: "Flutter Kicks"),
      Workout(id: 7, name: "Cross Crunch"),
      Workout(id: 8, name: "Heel Touches"),
      Workout(id: 9, name: "Russian Twist"),
      Workout(id: 10, name: "Cruches"),
      Workout(id: 11, name: "Reverse Crunches"),
      Workout(id: 12, name: "Flutter Kicks"),
      Workout(id: 13, name: "Knee-To-Elbow"),
      Workout(id: 14, name: "Pulse Ups"),
      Workout(id: 15, name: "Sit-Ups"),
      Workout(id: 16, name: "Scissors"),
    ]
  }),

  // Arms
  WorkoutItem(workout: {
    2: [
      Workout(id: 1, name: "Dumbbell bicep curl"),
      Workout(id: 2, name: "EZ Bar Curl"),
      Workout(id: 3, name: "Hammer curl"),
      Workout(id: 4, name: "Tricep kickbacks"),
      Workout(id: 5, name: "Concentration curl"),
      Workout(id: 6, name: "Barbell curl"),
      Workout(id: 7, name: "Dips"),
      Workout(id: 8, name: "Tricep Pushdown"),
      Workout(id: 9, name: "Overhead Tricep Extension"),
      Workout(id: 10, name: "Lying Tricep Extension"),
    ]
  }),

  // Back
  WorkoutItem(workout: {
    3: [
      Workout(id: 1, name: "Lat Pulldowns"),
      Workout(id: 2, name: "Pull Up"),
      Workout(id: 3, name: "Barbell Bent Over Row"),
      Workout(id: 4, name: "Deadlift"),
      Workout(id: 5, name: "Upright Row"),
      Workout(id: 6, name: "Hyper Extensions"),
      Workout(id: 7, name: "Supine Row"),
      Workout(id: 8, name: "Dumbbell Row"),
      Workout(id: 9, name: "Low Cable Row"),
      Workout(id: 10, name: "Stiff Arm Pulldown"),
    ]
  }),

  // Cardio Workouts
  WorkoutItem(workout: {
    4: [
      Workout(id: 1, name: "Running"),
      Workout(id: 2, name: "Cycling"),
      Workout(id: 3, name: "Stairs Row"),
      Workout(id: 4, name: "Jump Rope"),
      Workout(id: 5, name: "Elliptical"),
      Workout(id: 6, name: "Power Walking"),
      Workout(id: 7, name: "Swimming"),
      Workout(id: 8, name: "Boxing"),
      Workout(id: 9, name: "Hiking"),
    ]
  }),

  // Chest
  WorkoutItem(workout: {
    5: [
      Workout(id: 1, name: "Bench press"),
      Workout(id: 2, name: "Dumbbell bench press"),
      Workout(id: 3, name: "Cable flys"),
      Workout(id: 4, name: "Dumbbell flys"),
      Workout(id: 5, name: "Incline bench press"),
      Workout(id: 6, name: "Decline bench press"),
      Workout(id: 7, name: "Push Ups"),
      Workout(id: 8, name: "Incline dumbbell bench press"),
      Workout(id: 9, name: "Chest Dips"),
      Workout(id: 10, name: "Dumbbell Pullover"),
      Workout(id: 11, name: "Cable Chest Press"),
    ]
  }),

  // Shoulders
  WorkoutItem(workout: {
    6: [
      Workout(id: 1, name: "Shoulder Barbell Press"),
      Workout(id: 2, name: "Shoulder Dumbbell Press"),
      Workout(id: 3, name: "Arnold Press"),
      Workout(id: 4, name: "Shrugs"),
      Workout(id: 5, name: "Lateral Raise"),
      Workout(id: 6, name: "Bent Over Dumbbell Fly"),
      Workout(id: 7, name: "Front Raise"),
      Workout(id: 8, name: "Reverse Cable Crossover"),
      Workout(id: 9, name: "Reverse Pec Deck"),
    ]
  }),

  // Legs
  WorkoutItem(workout: {
    7: [
      Workout(id: 1, name: "Squat"),
      Workout(id: 2, name: "Lunges"),
      Workout(id: 3, name: "Wall sits"),
      Workout(id: 4, name: "Hip Abductions"),
      Workout(id: 5, name: "Leg extensions"),
      Workout(id: 6, name: "Leg curl"),
      Workout(id: 7, name: "Leg press"),
      Workout(id: 8, name: "Seated calf raises"),
      Workout(id: 9, name: "Standing calf raises"),
      Workout(id: 10, name: "Jump squats"),
      Workout(id: 11, name: "Straight Leg Deadlift"),
      Workout(id: 12, name: "Hip Thrust"),
      Workout(id: 13, name: "Donkey Kick"),
      Workout(id: 14, name: "Sumo Squat"),
    ]
  }),
];

Map<int, List<ListItem>> WORKOUT2 = const {
  // Arms
  1: [
    ListItem(id: 1, name: "Plank"),
    ListItem(id: 2, name: "Side Plank"),
    ListItem(id: 3, name: "Bicycles"),
    ListItem(id: 4, name: "Knee Crunch"),
    ListItem(id: 5, name: "Leg Raises"),
    ListItem(id: 6, name: "Flutter Kicks"),
    ListItem(id: 7, name: "Cross Crunch"),
    ListItem(id: 8, name: "Heel Touches"),
    ListItem(id: 9, name: "Russian Twist"),
    ListItem(id: 10, name: "Cruches"),
    ListItem(id: 11, name: "Reverse Crunches"),
    ListItem(id: 12, name: "Flutter Kicks"),
    ListItem(id: 13, name: "Knee-To-Elbow"),
    ListItem(id: 14, name: "Pulse Ups"),
    ListItem(id: 15, name: "Sit-Ups"),
    ListItem(id: 16, name: "Scissors"),
  ],

  // Arms
  2: [
    ListItem(id: 1, name: "Dumbbell bicep curl"),
    ListItem(id: 2, name: "EZ Bar Curl"),
    ListItem(id: 3, name: "Hammer curl"),
    ListItem(id: 4, name: "Tricep kickbacks"),
    ListItem(id: 5, name: "Concentration curl"),
    ListItem(id: 6, name: "Barbell curl"),
    ListItem(id: 7, name: "Dips"),
    ListItem(id: 8, name: "Tricep Pushdown"),
    ListItem(id: 9, name: "Overhead Tricep Extension"),
    ListItem(id: 10, name: "Lying Tricep Extension"),
  ],

  // Back
  3: [
    ListItem(id: 1, name: "Lat Pulldowns"),
    ListItem(id: 2, name: "Pull Up"),
    ListItem(id: 3, name: "Barbell Bent Over Row"),
    ListItem(id: 4, name: "Deadlift"),
    ListItem(id: 5, name: "Upright Row"),
    ListItem(id: 6, name: "Hyper Extensions"),
    ListItem(id: 7, name: "Supine Row"),
    ListItem(id: 8, name: "Dumbbell Row"),
    ListItem(id: 9, name: "Low Cable Row"),
    ListItem(id: 10, name: "Stiff Arm Pulldown"),
  ],

  // Cardio Workouts
  4: [
    ListItem(id: 1, name: "Running"),
    ListItem(id: 2, name: "Cycling"),
    ListItem(id: 3, name: "Stairs Row"),
    ListItem(id: 4, name: "Jump Rope"),
    ListItem(id: 5, name: "Elliptical"),
    ListItem(id: 6, name: "Power Walking"),
    ListItem(id: 7, name: "Swimming"),
    ListItem(id: 8, name: "Boxing"),
    ListItem(id: 9, name: "Hiking"),
  ],

  // Chest
  5: [
    ListItem(id: 1, name: "Bench press"),
    ListItem(id: 2, name: "Dumbbell bench press"),
    ListItem(id: 3, name: "Cable flys"),
    ListItem(id: 4, name: "Dumbbell flys"),
    ListItem(id: 5, name: "Incline bench press"),
    ListItem(id: 6, name: "Decline bench press"),
    ListItem(id: 7, name: "Push Ups"),
    ListItem(id: 8, name: "Incline dumbbell bench press"),
    ListItem(id: 9, name: "Chest Dips"),
    ListItem(id: 10, name: "Dumbbell Pullover"),
    ListItem(id: 11, name: "Cable Chest Press"),
  ],

  // Shoulders
  6: [
    ListItem(id: 1, name: "Shoulder Barbell Press"),
    ListItem(id: 2, name: "Shoulder Dumbbell Press"),
    ListItem(id: 3, name: "Arnold Press"),
    ListItem(id: 4, name: "Shrugs"),
    ListItem(id: 5, name: "Lateral Raise"),
    ListItem(id: 6, name: "Bent Over Dumbbell Fly"),
    ListItem(id: 7, name: "Front Raise"),
    ListItem(id: 8, name: "Reverse Cable Crossover"),
    ListItem(id: 9, name: "Reverse Pec Deck"),
  ],

  // Legs
  7: [
    ListItem(id: 1, name: "Squat"),
    ListItem(id: 2, name: "Lunges"),
    ListItem(id: 3, name: "Wall sits"),
    ListItem(id: 4, name: "Hip Abductions"),
    ListItem(id: 5, name: "Leg extensions"),
    ListItem(id: 6, name: "Leg curl"),
    ListItem(id: 7, name: "Leg press"),
    ListItem(id: 8, name: "Seated calf raises"),
    ListItem(id: 9, name: "Standing calf raises"),
    ListItem(id: 10, name: "Jump squats"),
    ListItem(id: 11, name: "Straight Leg Deadlift"),
    ListItem(id: 12, name: "Hip Thrust"),
    ListItem(id: 13, name: "Donkey Kick"),
    ListItem(id: 14, name: "Sumo Squat"),
  ],
};
