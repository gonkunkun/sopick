import { axios } from "../index.js"

export default {
  healthcheck() {
    return axios.$get(`healthcheck`)
  }
}
