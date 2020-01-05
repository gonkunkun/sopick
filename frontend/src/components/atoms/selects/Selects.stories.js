import { storiesOf } from "@storybook/vue"
import SelectChips from "./SelectChips.vue"
import { array } from "@storybook/addon-knobs"

storiesOf("Selects", module).add(
  "SelectChips",
  () => {
    return {
      props: {
        items: {
          default: array("items", ["a", "b", "c", "d"])
        },
        values: {
          default: array("values", ["a", "b"])
        }
      },
      components: { SelectChips },
      template: `<select-chips :items="items" :values="values" />`
    }
  },
  {
    info: {
      summary: "セレクトボックス"
    }
  }
)
