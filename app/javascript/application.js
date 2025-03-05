import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"
import * as Turbo from "@hotwired/turbo";
window.Turbo = Turbo;


window.Stimulus = Application.start()
const context = require.context("./controllers", true, /\.js$/)
Stimulus.load(definitionsFromContext(context))

console.log("🔥 Stimulus foi carregado com sucesso!", window.Stimulus);
import "@hotwired/turbo-rails"
