// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
// import "./controllers"
// import * as bootstrap from "bootstrap"
import Rails from '@rails/ujs';
import DynamicTime from './dynamic_time';
Rails.start();
DynamicTime.init();

