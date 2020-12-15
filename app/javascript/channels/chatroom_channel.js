import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const userId = parseInt(messagesContainer.dataset.currentUserId, 10);
   consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
    received(data) {
      const id = `message-${data.message_id}`
      const element = `<div class="message-container ${userId === data.user_id ? "sender" : ""}" id="${id}">
      <i class="author">
        <span>${data.user}</span>
        <small>${data.date}</small>
      </i>
      <p>${data.content}</p>
    </div>`
      messagesContainer.insertAdjacentHTML('beforeend', element);

      document.getElementById(id).scrollIntoView()
    }
  });
  }
}

export { initChatroomCable };