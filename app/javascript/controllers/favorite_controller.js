import { Controller } from "stimulus";
import Rails from "@rails/ujs";
console.log("+++++++++++");
export default class extends Controller {
  static targets = ["icon"];
  static values = { id: Number };
  toggleFavorite(e) {
    e.preventDefault();
    this.addFavorite(this.idValue);
  }

  addFavorite(id) {
    const url = `/api/v1/notes/${id}/favorite`;
    console.log("try");
    Rails.ajax({
      url: url,
      type: "post",
      data: "",
      success: (data) => {
        const icon = this.iconTarget;
        console.log(data);
        if (data.status === "added") {
          console.log("SUCCESS");
          icon.classList.remove("favorite-off");
          icon.classList.add("favorite-on");
        } else {
          icon.classList.remove("favorite-on");
          icon.classList.add("favorite-off");
        }
      },
      error: function (err) {
        console.log(err);
      },
    });
  }
}

// ax.post(url)
//       .than((res) => {
//         const icon = document.querySelector(".favorite_icon");
//         if (res.data.status === "added") {
//           icon.classList.remove("favorite-off");
//           icon.classList.add("favorite-on");
//         } else {
//           icon.classList.remove("favorite-on");
//           icon.classList.add("favorite-off");
//         }
//       })
//       .catch((err) => {
//         console.log(err);
//       });
