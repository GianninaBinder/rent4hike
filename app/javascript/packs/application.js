// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

/// if you don't have turnbolinks then use this:
//// document.addEventListener('DOMContentLoaded', () => {
window.addEventListener('turbolinks:load', () => {
  $('.select2').select2({
    tags: true,
    tokenSeparators: [',', ' '],
    multiple: false
  });
})
