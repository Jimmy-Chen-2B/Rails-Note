import ax from "axios";

const token = document.querySelector("mata[name=csrf-token]").content;
ax.defaults.headers.common["X-CSRF-Token"] = token;

export default ax;
