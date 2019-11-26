// 共通API処理を記述
export let axios

// TODO ログイン機能実装 https://qiita.com/itouuuuuuuuu/items/1dc6401022e0d771c757
// export default function({ store, $axios }) {
export default function({ $axios }) {
  $axios.onRequest(config => {
    config.headers.common["Authorization"] = `Bearer token`
    config.headers.common["Accept"] = "application/json"
  })

  $axios.onResponse(response => {
    $axios.setHeader("Access-Control-Allow-Origin", "http://localhost:3031")
    return Promise.resolve(response)
  })

  $axios.onError(error => {
    return Promise.reject(error.response)
  })

  axios = $axios
}
