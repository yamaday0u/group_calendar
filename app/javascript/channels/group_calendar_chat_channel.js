import consumer from "./consumer"

consumer.subscriptions.create("GroupCalendarChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="each__chat">
                    <div class="chat__top">
                      <p class="chat__text">${data.content.text}</p> 
                    </div>
                    <div class="chat__bottom">
                      <p class="chat__information">${data.time}</p>
                      <p class="chat__information"><a href="/users/${data.user.id}">${data.user.name}</a></p>
                    </div>
                  </div>`;
    const chats = document.getElementById("chats");
    chats.insertAdjacentHTML("afterbegin", html);
    const newChat = document.getElementById("group_calendar_chat_text");
    newChat.value="";
  }
});
