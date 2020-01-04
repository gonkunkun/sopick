import { storiesOf } from "@storybook/vue"
import Loader from "./Loader.vue"

storiesOf("Loader", module).add(
  "Loader",
  () => {
    return {
      props: {},
      components: { Loader },
      template: `
        <loader />
      `
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているローダー"
    }
  }
)
