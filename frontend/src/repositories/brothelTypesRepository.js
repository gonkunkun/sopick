import Repository from "./Repository"

const resource = "brothelTypes"
// viewの定義
const jsonApi = Repository.jsonApi
jsonApi.define("brothelTypes", {
  id: "",
  name: "",
  type: "",
  identifier: ""
})

export default {
  getBrothelTypes() {
    console.log(jsonApi.findAll(resource))
    return jsonApi.findAll(resource)
  }
}
