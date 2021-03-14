import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`;
    const chats = document.getElementById("chats");
    chats.insertAdjacentHTML("afterbegin", html);
    const newChat = document.getElementById("chat_text");
    newChat.value="";
  }
});
