// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "rails-ujs";
Rails.start();
import Turbolinks from "turbolinks";

import "controllers";
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

Turbolinks.start();
