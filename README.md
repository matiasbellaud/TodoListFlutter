# Flutter Riverpod Todos

## Description

Cette application Flutter utilise Riverpod pour la gestion d'état et permet de gérer une liste de tâches (CRUD) avec l'API publique [DummyJSON](https://dummyjson.com/todos). Les utilisateurs peuvent afficher, ajouter, modifier et supprimer des tâches.

## Fonctionnalités

- 📌 Affichage de la liste des tâches
- ➕ Ajout d'une nouvelle tâche
- ✏️ Modification du nom d'une tâche
- ✅ Mise à jour de l'état de complétion d'une tâche
- 🗑 Suppression d'une tâche

## Technologies utilisées

- Flutter
- Riverpod
- HTTP (pour les appels API)

## Prérequis

- [Flutter](https://flutter.dev/docs/get-started/install) installé sur votre machine
- Un éditeur de code comme [Visual Studio Code](https://code.visualstudio.com/)

## Installation

> 1. Clonez le dépôt

```sh
git clone https://github.com/TodoListFlutter.git
cd TodoListFlutter
```

> 2. Installez les dépendances

```sh
flutter pub get
```

> 3. Exécutez l'application

```sh
flutter run
```

## Structure du projet

```tree
.
├── lib
│  ├── main.dart
│  ├── models
│  │  └── todo
│  │    ├── todo_model.dart
│  │    ├── todo_model.freezed.dart
│  │    └── todo_model.g.dart
│  ├── pages
│  │  ├── add_todo
│  │  │  └── add_todo.dart
│  │  └── home
│  │    └── home.dart
│  ├── services
│  │  └── api_todo.dart
│  └── widgets
│    └── todo_widget.dart
```

## Utilisation

- L'écran principal affiche la liste des tâches.
- Cliquez sur le bouton ➕ pour ajouter une nouvelle tâche.
- Cliquez sur une tâche pour modifier son nom.
- Cliquez sur ✅ ou ❌ pour marquer la tâche comme complétée ou non.
- Cliquez sur 🗑 pour supprimer une tâche.

## API

L'application utilise l'API publique [DummyJSON](https://dummyjson.com/todos) pour gérer les tâches. Voici quelques exemples de requêtes :

- **GET** `/todos` : Récupère la liste des tâches
- **POST** `/todos/add` : Ajoute une nouvelle tâche
- **PUT** `/todos/{id}` : Modifie une tâche existante
- **DELETE** `/todos/{id}` : Supprime une tâche

## Auteur

🚀 Développé par Evan Guillet, Kevin Chauffaux, Matias Bellaud, Maxime Fuzeau, Evan Ferron