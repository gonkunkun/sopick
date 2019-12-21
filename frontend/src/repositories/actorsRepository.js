import Repository from "./Repository"

const resource = "/actors"
export default {
  // get() {
  //   return Repository.get(`${resource}`)
  // },

  getActors() {
    return Repository.get(`${resource}/index`)
  }

  // createPost(payload) {
  //   return Repository.post(`${resource}`, payload);
  // }
}
