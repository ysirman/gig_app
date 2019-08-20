import Vue from 'vue/dist/vue.esm.js'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'

import Header from './components/vue-header.vue'

var app = new Vue({
  el: '#app',
  components: {
    'vue-header': Header,
  }
});