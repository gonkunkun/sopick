import { storiesOf } from "@storybook/vue"
import VuetifyChip from "./VuetifyChip.vue"
import { text } from "@storybook/addon-knobs"

storiesOf("Chips", module).add(
  "VuetiyChip",
  () => {
    const href = text("href", "http://google.com")
    const color = text("color", "pink")
    return {
      components: { VuetifyChip },
      template: `<vuetify-chip href="${href}" color="${color}" />`
    }
  },
  {
    info: {
      summary: "Vuetifyで用意されているチップス"
    }
  }
)
