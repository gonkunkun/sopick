import { storiesOf } from "@storybook/vue"
import Bookmark from "./Bookmark.vue"

storiesOf("Icons", module)
  .add("Bookmark", () => ({
    components: { Bookmark },
    template: "<bookmark />"
  }),
  {
    info: {
      summary: "ブックマークボタン"
    }
  }
)
