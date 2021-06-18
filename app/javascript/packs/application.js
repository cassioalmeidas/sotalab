// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "sweet_alert_confirm"
import "bootstrap"
import "datatable"

window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

global.toastr = require("toastr")

import I18n from 'i18n-js/index.js.erb'
window.I18n = I18n
I18n.locale = document.documentElement.getAttribute('lang')


Rails.start()
Turbolinks.start()
ActiveStorage.start()
