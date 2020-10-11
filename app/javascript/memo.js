function memo() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      // 200以外のHTTPステータスが返却された場合の処理
      const item = XHR.response.post;
      // itemは、レスポンスとして返却されたメモのレコードデータを取得
      const list = document.getElementById("list");
      // listは、HTMLを描画する場所を指定する際に使用する「描画する親要素」のlistの要素を取得
      const formText = document.getElementById("content");
      // formTextを取得する理由は、メモの入力フォームをリセットするため
      // なぜなら、この処理が終了した時に、入力フォームの文字は入力されたままになってしまうため
      // リセット対象の要素であるcontentという要素を取得
      const HTML = `
        <div class="post" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-content">
          ${item.content}
          </div>
        </div>`;
        // 「メモとして描画する部分のHTML」を定義
      list.insertAdjacentHTML("afterend", HTML);
      // listという要素に対して、insertAdjacentHTMLでHTMLを追加する
      // 第一引数にafterendを指定することで、要素listの直後に挿入できる
      formText.value = "";
      // 「メモの入力フォームに入力されたままの文字」はリセットされる。正確には、空の文字列に上書きされるような仕組み
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);