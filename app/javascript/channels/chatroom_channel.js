import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const userId = parseInt(messagesContainer.dataset.currentUserId, 10);
   consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
    received(data) {

      document.querySelector('#message_content').value = ''
      
      const id = `message-${data.message_id}`
      const element = `<div class="message-container my-3 ${userId === data.user_id ? "sender" : "receiver"}" id="${id}">
      <div class="speech-bubble">
        <i class="author">
          <span>${data.user}</span>
          <small>${data.date}</small>
        </i>
        <p>${data.content}</p>
      </div>
    </div>`
      messagesContainer.insertAdjacentHTML('beforeend', element);

      document.getElementById(id).scrollIntoView()
    }
  });
  }
}

export { initChatroomCable };