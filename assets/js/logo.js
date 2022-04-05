const link = document.getElementById("logo-link");
const logo = document.getElementById("lawless-svg");
const container = document.getElementById("logo-container");

const windowWidth = window.matchMedia("(min-width: 51.75em)");
const vbLarge = "0 0 3221 1000";
const vbSmall = "0 0 870 1000";

function resizeLogo(width) {
  // event.preventDefault();
  // if (logo.getAttribute("viewBox") == vbSmall) {
  console.log("Resize logo!");
  if (width.matches) {
    // container.style.width = null;
    logo.setAttribute("viewBox", vbLarge);
    logo.setAttribute("width", "100%");
    logo.style.width = "200px";
    console.log("Large logo!");
  } else {
    logo.setAttribute("viewBox", vbSmall);
    logo.removeAttribute("width");
    logo.removeAttribute("style");
    console.log("Small logo!");
    // container.style.width = null;
  }
}

// Call listener function at run time
resizeLogo(windowWidth);
windowWidth.addListener(resizeLogo);
// window.addEventListener("orientationchange", resizeLogo(windowWidth), false);
