export const state = () => ({
  searchValues: {
    typeValue: [],
    prefValue: []
  }
})

export const getters = {
  getSearchValues: state => state.searchValues
}

// mutationsは状態を変化させる
// FIXME: ラベル名を直接引っ張ってこなくても、key: val で指定した値を更新したい
export const mutations = {
  updateSearchValues(state, payload) {
    if (payload.label === "業種") {
      state.searchValues.typeValue = payload.values
    } else if (payload.label === "都道府県") {
      state.searchValues.prefValue = payload.values
    }
  }
}

export const actions = {}
