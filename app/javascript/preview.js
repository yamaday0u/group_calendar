// プレビュー表示機能は新規投稿("/new/")か投稿編集("/edit/")ページでのみ有効にする
if (location.pathname.match("/users/edit") || location.pathname.match("/users/sign_up") || location.pathname.match("/groups/./edit") || location.pathname.match("/groups/new") || location.pathname.match("/omniauth/")) {
  document.addEventListener('DOMContentLoaded', function(){
    // プレビューを表示するための要素を取得
    const ImageList = document.getElementById('image-wrap');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div'); // 画像を表示するためのdiv要素を生成
      const blobImage = document.createElement('img'); // 画像を表示するためのimg要素を生成
      blobImage.setAttribute('src', blob); // img要素にsrc属性と値（引数blob）をセット
      blobImage.classList.add('image'); // img要素にclassをセット

      imageElement.appendChild(blobImage); // 生成したHTMLの要素をブラウザに表示させる
      ImageList.appendChild(imageElement);
    };

    if (document.getElementById('user_user_image')) {
      document.getElementById('user_user_image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img'); // 画像が表示されている場合のみ、すでに存在している画像を削除
        if (imageContent){
          imageContent.remove();
        }

        const file = e.target.files[0]; // 発火したイベントeの中の、targetの中の、filesという配列に格納された画像を変数に代入
        const blob = window.URL.createObjectURL(file); // 画像のURLを生成
        createImageHTML(blob); //定数createImageHTMLに代入した関数を呼び出し
      });
    }

    if (document.getElementById('group_group_image')) {
      document.getElementById('group_group_image').addEventListener('change', function(e){
        const imageContent = document.querySelector('img'); // 画像が表示されている場合のみ、すでに存在している画像を削除
        if (imageContent){
          imageContent.remove();
        }

        const file = e.target.files[0]; // 発火したイベントeの中の、targetの中の、filesという配列に格納された画像を変数に代入
        const blob = window.URL.createObjectURL(file); // 画像のURLを生成
        createImageHTML(blob); //定数createImageHTMLに代入した関数を呼び出し
      });
    }
  });
}