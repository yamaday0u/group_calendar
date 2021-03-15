import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="each-chat">
                    <p class="chat-time">${data.time}</p>
                    <p class="chat-text">${data.content.text}</p>
                    <p class="chat-user">${data.user.name}</p>
                  </div>`;
    const chats = document.getElementById("chats");
    chats.insertAdjacentHTML("afterbegin", html);
    const newChat = document.getElementById("chat_text");
    newChat.value="";
  }
});
