import { storiesOf } from "@storybook/vue"
import Paginations from "./Paginations.vue"
import { text, number, object } from "@storybook/addon-knobs"

storiesOf("Paginations", module).add(
  "Pagination",
  () => {
    return {
      props: {
        currentPage: {
          default: number("currentPage", 1)
        },
        totalPages: {
          default: number("totalPages", 10)
        }
      },
      components: { Paginations },
      template: `
        <v-pagination
          v-model="currentPage"
          :length="totalPages"
        />
      `
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているページングアイコン"
    }
  }
)