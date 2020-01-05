import Repository from "./Repository"

const resource = "prefectures"

export default {
  getPrefectures() {
    return Repository.axios.get(`${resource}`)
  }
}
