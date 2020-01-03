import Repository from "./Repository"

const resource = "actors"
// viewの定義
const jsonApi = Repository.jsonApi
jsonApi.define("actor", {
  id: "",
  brothel_id: "",
  girl_id: "",
  name: "",
  age: "",
  tall: "",
  bust: "",
  cup: "",
  waist: "",
  hip: "",
  actor_page_url: "",
  updated_at: "",
  brothel: {
    jsonApi: "hasOne",
    type: "brothel"
  },
  actor_images: {
    jsonApi: "hasMany",
    type: "actor_image"
  }
})
jsonApi.define("brothel", {
  brothel_name: "",
  brothel_name_en: "",
  brothel_url: "",
  prefecture: "",
  area: "",
  area_en: "",
  area_id: "",
  area_detail_id: "",
  brothel_type: ""
})
jsonApi.define("actor_image", {
  image_path: "",
  updated_at: ""
})

export default {
  getActors(pageNumber = 1) {
    // return Repository.get(`${resource}`)
    return jsonApi.findAll(resource, {
      page: pageNumber
    })
  }

  // createPost(payload) {
  //   return Repository.post(`${resource}`, payload);
  // }
}
