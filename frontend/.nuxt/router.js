import Vue from 'vue'
import Router from 'vue-router'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _2826b7a7 = () => interopDefault(import('../src/pages/actors/index.vue' /* webpackChunkName: "pages/actors/index" */))
const _8ef4cf00 = () => interopDefault(import('../src/pages/posts/index.vue' /* webpackChunkName: "pages/posts/index" */))
const _f554e064 = () => interopDefault(import('../src/pages/posts/new.vue' /* webpackChunkName: "pages/posts/new" */))
const _719fbae8 = () => interopDefault(import('../src/pages/posts/_id.vue' /* webpackChunkName: "pages/posts/_id" */))
const _78e9a93c = () => interopDefault(import('../src/pages/index.vue' /* webpackChunkName: "pages/index" */))

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: decodeURI('/'),
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/actors",
    component: _2826b7a7,
    name: "actors"
  }, {
    path: "/posts",
    component: _8ef4cf00,
    name: "posts"
  }, {
    path: "/posts/new",
    component: _f554e064,
    name: "posts-new"
  }, {
    path: "/posts/:id",
    component: _719fbae8,
    name: "posts-id"
  }, {
    path: "/",
    component: _78e9a93c,
    name: "index"
  }],

  fallback: false
}

export function createRouter () {
  return new Router(routerOptions)
}
