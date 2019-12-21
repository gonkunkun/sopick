import { storiesOf } from "@storybook/vue"
import Bookmark from "./Bookmark.vue"
import Heart from "./Heart.vue"

storiesOf("Icons", module)
  .add("Bookmark", () => ({
      components: { Bookmark, Bookmark },
      template: "<bookmark />"
    }),
    {
      info: {
        summary: "ブックマークボタン"
      }
    }
  )
