let isFixed = false;
let offsetTop: number;
export default function fixLayout(el: HTMLElement) {
  const left = el.offsetLeft;
  const width = el.offsetWidth;
  if (!isFixed) {
    offsetTop = el.offsetTop;
  }
  if (window.scrollY >= offsetTop && !isFixed) {
    el.style.cssText = `
      position: fixed;
      left: ${left}px;
      top: 0;
      width: ${width}px
    `;
    isFixed = true;
  } else if (window.scrollY < offsetTop && isFixed) {
    el.style.cssText = ``;
    isFixed = false;
  }
}
