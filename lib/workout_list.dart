import 'models/models.dart';

List<WorkoutItem> WORKOUT = const [
  // Arms
  WorkoutItem(workout: {
    1: [
      Workout(workoutId: 1, workoutName: "Plank"),
      Workout(workoutId: 2, workoutName: "Side Plank"),
      Workout(workoutId: 3, workoutName: "Bicycles"),
      Workout(workoutId: 4, workoutName: "Knee Crunch"),
      Workout(workoutId: 5, workoutName: "Leg Raises"),
      Workout(workoutId: 6, workoutName: "Flutter Kicks"),
      Workout(workoutId: 7, workoutName: "Cross Crunch"),
      Workout(workoutId: 8, workoutName: "Heel Touches"),
      Workout(workoutId: 9, workoutName: "Russian Twist"),
      Workout(workoutId: 10, workoutName: "Cruches"),
      Workout(workoutId: 11, workoutName: "Reverse Crunches"),
      Workout(workoutId: 12, workoutName: "Flutter Kicks"),
      Workout(workoutId: 13, workoutName: "Knee-To-Elbow"),
      Workout(workoutId: 14, workoutName: "Pulse Ups"),
      Workout(workoutId: 15, workoutName: "Sit-Ups"),
      Workout(workoutId: 16, workoutName: "Scissors"),
    ]
  }),

  // Arms
  WorkoutItem(workout: {
    2: [
      Workout(workoutId: 1, workoutName: "Dumbbell bicep curl"),
      Workout(workoutId: 2, workoutName: "EZ Bar Curl"),
      Workout(workoutId: 3, workoutName: "Hammer curl"),
      Workout(workoutId: 4, workoutName: "Tricep kickbacks"),
      Workout(workoutId: 5, workoutName: "Concentration curl"),
      Workout(workoutId: 6, workoutName: "Barbell curl"),
      Workout(workoutId: 7, workoutName: "Dips"),
      Workout(workoutId: 8, workoutName: "Tricep Pushdown"),
      Workout(workoutId: 9, workoutName: "Overhead Tricep Extension"),
      Workout(workoutId: 10, workoutName: "Lying Tricep Extension"),
    ]
  }),

  // Back
  WorkoutItem(workout: {
    3: [
      Workout(workoutId: 1, workoutName: "Lat Pulldowns"),
      Workout(workoutId: 2, workoutName: "Pull Up"),
      Workout(workoutId: 3, workoutName: "Barbell Bent Over Row"),
      Workout(workoutId: 4, workoutName: "Deadlift"),
      Workout(workoutId: 5, workoutName: "Upright Row"),
      Workout(workoutId: 6, workoutName: "Hyper Extensions"),
      Workout(workoutId: 7, workoutName: "Supine Row"),
      Workout(workoutId: 8, workoutName: "Dumbbell Row"),
      Workout(workoutId: 9, workoutName: "Low Cable Row"),
      Workout(workoutId: 10, workoutName: "Stiff Arm Pulldown"),
    ]
  }),

  // Cardio Workouts
  WorkoutItem(workout: {
    4: [
      Workout(workoutId: 1, workoutName: "Running"),
      Workout(workoutId: 2, workoutName: "Cycling"),
      Workout(workoutId: 3, workoutName: "Stairs Row"),
      Workout(workoutId: 4, workoutName: "Jump Rope"),
      Workout(workoutId: 5, workoutName: "Elliptical"),
      Workout(workoutId: 6, workoutName: "Power Walking"),
      Workout(workoutId: 7, workoutName: "Swimming"),
      Workout(workoutId: 8, workoutName: "Boxing"),
      Workout(workoutId: 9, workoutName: "Hiking"),
    ]
  }),

  // Chest
  WorkoutItem(workout: {
    5: [
      Workout(workoutId: 1, workoutName: "Bench press"),
      Workout(workoutId: 2, workoutName: "Dumbbell bench press"),
      Workout(workoutId: 3, workoutName: "Cable flys"),
      Workout(workoutId: 4, workoutName: "Dumbbell flys"),
      Workout(workoutId: 5, workoutName: "Incline bench press"),
      Workout(workoutId: 6, workoutName: "Decline bench press"),
      Workout(workoutId: 7, workoutName: "Push Ups"),
      Workout(workoutId: 8, workoutName: "Incline dumbbell bench press"),
      Workout(workoutId: 9, workoutName: "Chest Dips"),
      Workout(workoutId: 10, workoutName: "Dumbbell Pullover"),
      Workout(workoutId: 11, workoutName: "Cable Chest Press"),
    ]
  }),

  // Shoulders
  WorkoutItem(workout: {
    6: [
      Workout(workoutId: 1, workoutName: "Shoulder Barbell Press"),
      Workout(workoutId: 2, workoutName: "Shoulder Dumbbell Press"),
      Workout(workoutId: 3, workoutName: "Arnold Press"),
      Workout(workoutId: 4, workoutName: "Shrugs"),
      Workout(workoutId: 5, workoutName: "Lateral Raise"),
      Workout(workoutId: 6, workoutName: "Bent Over Dumbbell Fly"),
      Workout(workoutId: 7, workoutName: "Front Raise"),
      Workout(workoutId: 8, workoutName: "Reverse Cable Crossover"),
      Workout(workoutId: 9, workoutName: "Reverse Pec Deck"),
    ]
  }),

  // Legs
  WorkoutItem(workout: {
    7: [
      Workout(workoutId: 1, workoutName: "Squat"),
      Workout(workoutId: 2, workoutName: "Lunges"),
      Workout(workoutId: 3, workoutName: "Wall sits"),
      Workout(workoutId: 4, workoutName: "Hip Abductions"),
      Workout(workoutId: 5, workoutName: "Leg extensions"),
      Workout(workoutId: 6, workoutName: "Leg curl"),
      Workout(workoutId: 7, workoutName: "Leg press"),
      Workout(workoutId: 8, workoutName: "Seated calf raises"),
      Workout(workoutId: 9, workoutName: "Standing calf raises"),
      Workout(workoutId: 10, workoutName: "Jump squats"),
      Workout(workoutId: 11, workoutName: "Straight Leg Deadlift"),
      Workout(workoutId: 12, workoutName: "Hip Thrust"),
      Workout(workoutId: 13, workoutName: "Donkey Kick"),
      Workout(workoutId: 14, workoutName: "Sumo Squat"),
    ]
  }),
];

Map<int, List<Workout>> WORKOUT2 = const {
  // Arms
  1: [
    Workout(workoutId: 1, workoutName: "Plank"),
    Workout(workoutId: 2, workoutName: "Side Plank"),
    Workout(workoutId: 3, workoutName: "Bicycles"),
    Workout(workoutId: 4, workoutName: "Knee Crunch"),
    Workout(workoutId: 5, workoutName: "Leg Raises"),
    Workout(workoutId: 6, workoutName: "Flutter Kicks"),
    Workout(workoutId: 7, workoutName: "Cross Crunch"),
    Workout(workoutId: 8, workoutName: "Heel Touches"),
    Workout(workoutId: 9, workoutName: "Russian Twist"),
    Workout(workoutId: 10, workoutName: "Cruches"),
    Workout(workoutId: 11, workoutName: "Reverse Crunches"),
    Workout(workoutId: 12, workoutName: "Flutter Kicks"),
    Workout(workoutId: 13, workoutName: "Knee-To-Elbow"),
    Workout(workoutId: 14, workoutName: "Pulse Ups"),
    Workout(workoutId: 15, workoutName: "Sit-Ups"),
    Workout(workoutId: 16, workoutName: "Scissors"),
  ],

  // Arms
  2: [
    Workout(workoutId: 1, workoutName: "Dumbbell bicep curl"),
    Workout(workoutId: 2, workoutName: "EZ Bar Curl"),
    Workout(workoutId: 3, workoutName: "Hammer curl"),
    Workout(workoutId: 4, workoutName: "Tricep kickbacks"),
    Workout(workoutId: 5, workoutName: "Concentration curl"),
    Workout(workoutId: 6, workoutName: "Barbell curl"),
    Workout(workoutId: 7, workoutName: "Dips"),
    Workout(workoutId: 8, workoutName: "Tricep Pushdown"),
    Workout(workoutId: 9, workoutName: "Overhead Tricep Extension"),
    Workout(workoutId: 10, workoutName: "Lying Tricep Extension"),
  ],

  // Back
  3: [
    Workout(workoutId: 1, workoutName: "Lat Pulldowns"),
    Workout(workoutId: 2, workoutName: "Pull Up"),
    Workout(workoutId: 3, workoutName: "Barbell Bent Over Row"),
    Workout(workoutId: 4, workoutName: "Deadlift"),
    Workout(workoutId: 5, workoutName: "Upright Row"),
    Workout(workoutId: 6, workoutName: "Hyper Extensions"),
    Workout(workoutId: 7, workoutName: "Supine Row"),
    Workout(workoutId: 8, workoutName: "Dumbbell Row"),
    Workout(workoutId: 9, workoutName: "Low Cable Row"),
    Workout(workoutId: 10, workoutName: "Stiff Arm Pulldown"),
  ],

  // Cardio Workouts
  4: [
    Workout(workoutId: 1, workoutName: "Running"),
    Workout(workoutId: 2, workoutName: "Cycling"),
    Workout(workoutId: 3, workoutName: "Stairs Row"),
    Workout(workoutId: 4, workoutName: "Jump Rope"),
    Workout(workoutId: 5, workoutName: "Elliptical"),
    Workout(workoutId: 6, workoutName: "Power Walking"),
    Workout(workoutId: 7, workoutName: "Swimming"),
    Workout(workoutId: 8, workoutName: "Boxing"),
    Workout(workoutId: 9, workoutName: "Hiking"),
  ],

  // Chest
  5: [
    Workout(workoutId: 1, workoutName: "Bench press"),
    Workout(workoutId: 2, workoutName: "Dumbbell bench press"),
    Workout(workoutId: 3, workoutName: "Cable flys"),
    Workout(workoutId: 4, workoutName: "Dumbbell flys"),
    Workout(workoutId: 5, workoutName: "Incline bench press"),
    Workout(workoutId: 6, workoutName: "Decline bench press"),
    Workout(workoutId: 7, workoutName: "Push Ups"),
    Workout(workoutId: 8, workoutName: "Incline dumbbell bench press"),
    Workout(workoutId: 9, workoutName: "Chest Dips"),
    Workout(workoutId: 10, workoutName: "Dumbbell Pullover"),
    Workout(workoutId: 11, workoutName: "Cable Chest Press"),
  ],

  // Shoulders
  6: [
    Workout(workoutId: 1, workoutName: "Shoulder Barbell Press"),
    Workout(workoutId: 2, workoutName: "Shoulder Dumbbell Press"),
    Workout(workoutId: 3, workoutName: "Arnold Press"),
    Workout(workoutId: 4, workoutName: "Shrugs"),
    Workout(workoutId: 5, workoutName: "Lateral Raise"),
    Workout(workoutId: 6, workoutName: "Bent Over Dumbbell Fly"),
    Workout(workoutId: 7, workoutName: "Front Raise"),
    Workout(workoutId: 8, workoutName: "Reverse Cable Crossover"),
    Workout(workoutId: 9, workoutName: "Reverse Pec Deck"),
  ],

  // Legs
  7: [
    Workout(workoutId: 1, workoutName: "Squat"),
    Workout(workoutId: 2, workoutName: "Lunges"),
    Workout(workoutId: 3, workoutName: "Wall sits"),
    Workout(workoutId: 4, workoutName: "Hip Abductions"),
    Workout(workoutId: 5, workoutName: "Leg extensions"),
    Workout(workoutId: 6, workoutName: "Leg curl"),
    Workout(workoutId: 7, workoutName: "Leg press"),
    Workout(workoutId: 8, workoutName: "Seated calf raises"),
    Workout(workoutId: 9, workoutName: "Standing calf raises"),
    Workout(workoutId: 10, workoutName: "Jump squats"),
    Workout(workoutId: 11, workoutName: "Straight Leg Deadlift"),
    Workout(workoutId: 12, workoutName: "Hip Thrust"),
    Workout(workoutId: 13, workoutName: "Donkey Kick"),
    Workout(workoutId: 14, workoutName: "Sumo Squat"),
  ],
};
