import { storiesOf } from "@storybook/vue"
import VuetifyChip from "./VuetifyChip.vue"
import { text } from "@storybook/addon-knobs"

storiesOf("Chips", module).add(
  "VuetiyChip",
  () => {
    return {
      props: {
        url: {
          default: text("url", "http://google.com")
        },
        color: {
          default: text("color", "pink")
        },
        brothelType: {
          default: text("brothelType", "hogehoge")
        }
      },
      components: { VuetifyChip },
      template: `<vuetify-chip :url="url" :color="color" :brothelType="brothelType" />`
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているチップス"
    }
  }
)
