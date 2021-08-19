import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import ax from "axios";

function addFavorite(id) {
  const url = `/api/v1/notes/${id}/favorite`;
  const token = document.querySelector("mata[name=csrf-token]").content;
  ax.defaults.headers.common["X-CSRF-Token"] = token;

  ax.post(url)
    .than((res) => {
      const icon = document.querySelector(".favorite_icon");
      if (res.data.status === "added") {
        icon.classList.remove("favorite-off");
        icon.classList.add("favorite-on");
      } else {
        icon.classList.remove("favorite-on");
        icon.classList.add("favorite-off");
      }
    })
    .catch((err) => {
      console.log(err);
    });
}

document.addEventListener("DOMContentLoaded", () => {
  const btn = document.querySelector("#favorite_btn");

  if (btn) {
    btn.addEventListener("click", (e) => {
      e.defaultPrevented();
      addFavorite(e.target.dataset.id);
    });
  }
});
