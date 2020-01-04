import Vue from 'vue'
import Router from 'vue-router'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _3b048c16 = () => interopDefault(import('../src/pages/actors/index.vue' /* webpackChunkName: "pages/actors/index" */))
const _0373fa31 = () => interopDefault(import('../src/pages/posts/index.vue' /* webpackChunkName: "pages/posts/index" */))
const _0f22a9bf = () => interopDefault(import('../src/pages/posts/new.vue' /* webpackChunkName: "pages/posts/new" */))
const _15529bfe = () => interopDefault(import('../src/pages/actors/_id.vue' /* webpackChunkName: "pages/actors/_id" */))
const _0926564e = () => interopDefault(import('../src/pages/posts/_id.vue' /* webpackChunkName: "pages/posts/_id" */))
const _27eb63ad = () => interopDefault(import('../src/pages/index.vue' /* webpackChunkName: "pages/index" */))

// TODO: remove in Nuxt 3
const emptyFn = () => {}
const originalPush = Router.prototype.push
Router.prototype.push = function push (location, onComplete = emptyFn, onAbort) {
  return originalPush.call(this, location, onComplete, onAbort)
}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: decodeURI('/'),
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/actors",
    component: _3b048c16,
    name: "actors"
  }, {
    path: "/posts",
    component: _0373fa31,
    name: "posts"
  }, {
    path: "/posts/new",
    component: _0f22a9bf,
    name: "posts-new"
  }, {
    path: "/actors/:id",
    component: _15529bfe,
    name: "actors-id"
  }, {
    path: "/posts/:id",
    component: _0926564e,
    name: "posts-id"
  }, {
    path: "/",
    component: _27eb63ad,
    name: "index"
  }],

  fallback: false
}

export function createRouter () {
  return new Router(routerOptions)
}
