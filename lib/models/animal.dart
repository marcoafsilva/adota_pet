// To parse this JSON data, do
//
//     final animal = animalFromJson(jsonString);

import 'dart:convert';

class Animal {
    String title;
    String img;
    String age;
    String city;
    String state;

    Animal({
        this.title,
        this.img,
        this.age,
        this.city,
        this.state,
    });

    factory Animal.fromJson(String str) => Animal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Animal.fromMap(Map<String, dynamic> json) => Animal(
        title: json["title"] == null ? null : json["title"],
        img: json["img"] == null ? null : json["img"],
        age: json["age"] == null ? null : json["age"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
    );

    Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "img": img == null ? null : img,
        "age": age == null ? null : age,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
    };
}
