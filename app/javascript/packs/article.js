import 'easymde/dist/easymde.min.css'
import EasyMDE from "easymde";
import Rails from '@rails/ujs'

window.onload = function () {
  // textareaをMarkdownエディタにする
  const easymde = new EasyMDE({
    element: document.getElementById("editor"),
  });
};