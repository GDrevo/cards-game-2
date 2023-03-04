// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ComputerCardsController from "./computer_cards_controller"
application.register("computer-cards", ComputerCardsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PlayAttackController from "./play_attack_controller"
application.register("play-attack", PlayAttackController)

import UserCardsController from "./user_cards_controller"
application.register("user-cards", UserCardsController)
