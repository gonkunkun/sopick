import { storiesOf } from "@storybook/vue"
import Paginations from "./Paginations.vue"
import { number } from "@storybook/addon-knobs"

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
        },
        totalVisible: {
          default: number("totalVisible", 9)
        }
      },
      components: { Paginations },
      template: `
        <v-pagination
          v-model="currentPage"
          :length="totalPages"
          :total-visible="totalVisible"
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
