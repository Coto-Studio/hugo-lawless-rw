function resizeLogo(width) {
  if (width.matches) {
    // If media query matches
    logo.setAttribute("viewBox", "0 0 870 1000");
  } else {
    logo.setAttribute("viewBox", "0 0 3221 1000");
  }
}

const logo = document.getElementsByTagName("svg")[0];
const windowWidth = window.matchMedia("(max-width: 51.75em)");
resizeLogo(windowWidth); // Call listener function at run time
windowWidth.addListener(resizeLogo);
window.addEventListener("orientationchange", resizeLogo(windowWidth), false);
