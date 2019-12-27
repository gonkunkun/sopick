import { storiesOf } from "@storybook/vue"
import VuetifyChip from "./VuetifyChip.vue"
import { text } from "@storybook/addon-knobs"

storiesOf("Chips", module).add(
  "VuetiyChip",
  () => {
    const url = text("url", "http://google.com")
    const color = text("color", "pink")
    const brothelType = text("brothelType", "hogehoge")

    return {
      components: { VuetifyChip },
      template: `<vuetify-chip url="${url}" color="${color}" brothelType="${brothelType}" />`
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているチップス"
    }
  }
)
