import axios from "axios"
import JsonApi from "devour-client"

// #TODO: 公開するときにはURLを別途指定
const baseDomain = "http://localhost:3031"
// The base URL is empty this time due we are using the jsonplaceholder API
const baseURL = `${baseDomain}`

export default {
  axios: axios.create({
    baseURL
    // 参考：https://qiita.com/07JP27/items/0923cbe3b6435c19d761
  }),
  jsonApi: new JsonApi({ apiUrl: baseURL })
}
