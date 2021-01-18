import "inline-attachment/src/inline-attachment";
import "inline-attachment/src/codemirror-4.inline-attachment";
import 'easymde/dist/easymde.min.css'
import EasyMDE from "easymde";
import Rails from '@rails/ujs'

window.onload = function () {
  // textareaをMarkdownエディタにする
  const easymde = new EasyMDE({
    element: document.getElementById("editor"),
  });
  // エディタに画像がドラッグ&ドロップされた際の処理
  inlineAttachment.editors.codemirror4.attach(easymde.codemirror, {
    uploadUrl: "/articles/attach",
    uploadFieldName: "image",
    allowedTypes: ['image/jpeg', 'image/png', 'image/jpg', 'image/gif '],
    extraHeaders: { "X-CSRF-Token": Rails.csrfToken() }, //CSRF対策
  });
};
