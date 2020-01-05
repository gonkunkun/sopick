export const state = () => ({
  searchValues: {
    // thisPage: 1,
    typeValue: [],
    prefValue: []
  }
})

export const getters = {
  getThisPage: state => state.thisPage,
  getSearchValues: state => state.searchValues
}

// mutationsは状態を変化させる
// FIXME: ラベル名を直接引っ張ってこなくても、key: val で指定した値を更新したい
export const mutations = {
  updateThisPage(state, payload) {
    state.thisPage = payload
  },
  updateSearchValues(state, payload) {
    if (payload.label === "業種") {
      state.searchValues.typeValue = payload.values
    } else if (payload.label === "都道府県") {
      state.searchValues.prefValue = payload.values
    }
  }
}

export const actions = {}
