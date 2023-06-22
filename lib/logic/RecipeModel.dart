class Recipes {
  int? count;
  List<Results>? results;

  Recipes({this.count, this.results});

  Recipes.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  List<Sections>? sections;
  Nutrition? nutrition;
  String? description;
  List<Credits>? credits;
  String? thumbnailUrl;
  int? cookTimeMinutes;
  List<Instructions>? instructions;
  UserRatings? userRatings;
  int? id;
  int? numServings;
  String? yields;

  Results(
      {this.name,
      this.sections,
      this.nutrition,
      this.description,
      this.credits,
      this.thumbnailUrl,
      this.cookTimeMinutes,
      this.instructions,
      this.userRatings,
      this.id,
      this.numServings,
      this.yields});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    nutrition = json['nutrition'] != null
        ? Nutrition.fromJson(json['nutrition'])
        : null;
    description = json['description'];
    if (json['credits'] != null) {
      credits = <Credits>[];
      json['credits'].forEach((v) {
        credits!.add(Credits.fromJson(v));
      });
    }
    thumbnailUrl = json['thumbnail_url'];
    cookTimeMinutes = json['cook_time_minutes'];
    if (json['instructions'] != null) {
      instructions = <Instructions>[];
      json['instructions'].forEach((v) {
        instructions!.add(Instructions.fromJson(v));
      });
    }
    userRatings = json['user_ratings'] != null
        ? UserRatings.fromJson(json['user_ratings'])
        : null;
    id = json['id'];
    numServings = json['num_servings'];
    yields = json['yields'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    if (nutrition != null) {
      data['nutrition'] = nutrition!.toJson();
    }
    data['description'] = description;
    if (credits != null) {
      data['credits'] = credits!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_url'] = thumbnailUrl;
    data['cook_time_minutes'] = cookTimeMinutes;
    if (instructions != null) {
      data['instructions'] = instructions!.map((v) => v.toJson()).toList();
    }
    if (userRatings != null) {
      data['user_ratings'] = userRatings!.toJson();
    }
    data['id'] = id;
    data['num_servings'] = numServings;
    data['yields'] = yields;
    return data;
  }

  String getAllIstruction() {
    String Instruction = "";
    for (int i = 0; i < instructions!.length - 1; i++) {
      Instruction += instructions![i].displayText! + '\n';
    }
    return Instruction;
  }
}

class Sections {
  List<Components>? components;
  String? name;
  int? position;

  Sections({this.components, this.name, this.position});

  Sections.fromJson(Map<String, dynamic> json) {
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components!.add(Components.fromJson(v));
      });
    }
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (components != null) {
      data['components'] = components!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['position'] = position;
    return data;
  }

  String getAllIngredients() {
    String ingredients = "";
    for (int i = 0; i < components!.length - 1; i++) {
      ingredients += components![i].rawText! + '\n';
    }
    return ingredients;
  }
}

class Components {
  int? position;
  List<Measurements>? measurements;
  String? rawText;
  String? extraComment;
  Ingredient? ingredient;
  int? id;

  Components(
      {this.position,
      this.measurements,
      this.rawText,
      this.extraComment,
      this.ingredient,
      this.id});

  Components.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    if (json['measurements'] != null) {
      measurements = <Measurements>[];
      json['measurements'].forEach((v) {
        measurements!.add(Measurements.fromJson(v));
      });
    }
    rawText = json['raw_text'];
    extraComment = json['extra_comment'];
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    if (measurements != null) {
      data['measurements'] = measurements!.map((v) => v.toJson()).toList();
    }
    data['raw_text'] = rawText;
    data['extra_comment'] = extraComment;
    if (ingredient != null) {
      data['ingredient'] = ingredient!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Measurements {
  Unit? unit;
  String? quantity;
  int? id;

  Measurements({this.unit, this.quantity, this.id});

  Measurements.fromJson(Map<String, dynamic> json) {
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    quantity = json['quantity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    data['quantity'] = quantity;
    data['id'] = id;
    return data;
  }
}

class Unit {
  String? system;
  String? name;
  String? displayPlural;
  String? displaySingular;
  String? abbreviation;

  Unit(
      {this.system,
      this.name,
      this.displayPlural,
      this.displaySingular,
      this.abbreviation});

  Unit.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    name = json['name'];
    displayPlural = json['display_plural'];
    displaySingular = json['display_singular'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['system'] = system;
    data['name'] = name;
    data['display_plural'] = displayPlural;
    data['display_singular'] = displaySingular;
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Ingredient {
  int? updatedAt;
  String? name;
  int? createdAt;
  String? displayPlural;
  int? id;
  String? displaySingular;

  Ingredient(
      {this.updatedAt,
      this.name,
      this.createdAt,
      this.displayPlural,
      this.id,
      this.displaySingular});

  Ingredient.fromJson(Map<String, dynamic> json) {
    updatedAt = json['updated_at'];
    name = json['name'];
    createdAt = json['created_at'];
    displayPlural = json['display_plural'];
    id = json['id'];
    displaySingular = json['display_singular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['display_plural'] = displayPlural;
    data['id'] = id;
    data['display_singular'] = displaySingular;
    return data;
  }
}

class Nutrition {
  int? carbohydrates;
  int? fiber;
  String? updatedAt;
  int? protein;
  int? fat;
  int? calories;
  int? sugar;

  Nutrition(
      {this.carbohydrates,
      this.fiber,
      this.updatedAt,
      this.protein,
      this.fat,
      this.calories,
      this.sugar});

  Nutrition.fromJson(Map<String, dynamic> json) {
    carbohydrates = json['carbohydrates'];
    fiber = json['fiber'];
    updatedAt = json['updated_at'];
    protein = json['protein'];
    fat = json['fat'];
    calories = json['calories'];
    sugar = json['sugar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carbohydrates'] = carbohydrates;
    data['fiber'] = fiber;
    data['updated_at'] = updatedAt;
    data['protein'] = protein;
    data['fat'] = fat;
    data['calories'] = calories;
    data['sugar'] = sugar;
    return data;
  }
}

class Credits {
  String? name;
  String? type;

  Credits({this.name, this.type});

  Credits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

class Instructions {
  int? position;
  String? displayText;
  int? startTime;
  String? appliance;
  int? endTime;
  int? temperature;
  int? id;

  Instructions(
      {this.position,
      this.displayText,
      this.startTime,
      this.appliance,
      this.endTime,
      this.temperature,
      this.id});

  Instructions.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    displayText = json['display_text'];
    startTime = json['start_time'];
    appliance = json['appliance'];
    endTime = json['end_time'];
    temperature = json['temperature'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['display_text'] = displayText;
    data['start_time'] = startTime;
    data['appliance'] = appliance;
    data['end_time'] = endTime;
    data['temperature'] = temperature;
    data['id'] = id;
    return data;
  }
}

class UserRatings {
  int? countPositive;
  double? score;
  int? countNegative;

  UserRatings({this.countPositive, this.score, this.countNegative});

  UserRatings.fromJson(Map<String, dynamic> json) {
    countPositive = json['count_positive'];
    score = json['score'];
    countNegative = json['count_negative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count_positive'] = countPositive;
    data['score'] = score;
    data['count_negative'] = countNegative;
    return data;
  }
}
