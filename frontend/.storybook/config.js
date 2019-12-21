import Vue from "vue"
import Vuetify from "vuetify"
import 'vuetify/dist/vuetify.css' 
import { configure, addDecorator } from '@storybook/vue'
import { withInfo } from "storybook-addon-vue-info"
import { withKnobs, String } from '@storybook/addon-knobs'


Vue.use(Vuetify)

addDecorator(withInfo)
addDecorator(withKnobs)

// 毎回テンプレートを<v-app>で囲みたくないため記述
addDecorator(() => ({
  vuetify: new Vuetify(),
  template: `
  <v-app>
    <v-content class="ma-5">
      <story />
    </v-content>
  </v-app>
  `,
}))

configure(require.context('../src/components', true, /\.stories\.js$/), module)

// const req = require.context("../src/components", true, /\.stories\.js$/)
// const loadStories = () => {
//   req.keys().forEach(req)
// }

// configure(loadStories, module)