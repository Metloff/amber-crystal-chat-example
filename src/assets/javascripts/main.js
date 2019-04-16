import 'bootstrap';
import Amber from 'amber';

let socket = new Amber.Socket('/chat');

let logout = document.getElementById('logout');
let message = document.getElementById('message');
let chat = document.getElementById('chat');
let roomID = document.getElementById('room_id');
let userID = document.getElementById('user_id');
let messageForm = document.getElementById('message-form');

function getUser() {
    return "alex"
//     return document.getElementById('user').innerText.trim();
}

// localStorage.setItem('user', getUser());

socket.connect().then(() => {
    let channel = socket.channel('chat_room:hello');

    channel.join();

    channel.on('message_new', payload => {
        if (payload.type == "info") {
            let p = document.createElement('p');
            p.innerText = payload.message;
            chat.appendChild(p);
            chat.scrollTop = chat.scrollHeight;
        } else {
            let div = document.createElement('div');
            div.innerHTML = `
            <div class="row chat-message-container">
                <div class="col-auto text-center">
                    <div class="circle"> ${ payload.message.username }</div>
                </div>
                <div class="col">
                    <div class="message-content">
                        <div class="mb-1"> ${ payload.message.message } </div>
                        <div class="text-right">
                            <small> ${ payload.message.created_at } </small> 
                        </div>
                    </div>
                </div>
            </div>`
            chat.appendChild(div);
            chat.scrollTop = chat.scrollHeight;
        }
    });

    messageForm.addEventListener('submit', event => {
        event.preventDefault();
        channel.push('message_new', {
            message: message.value,
            room_id: roomID.value,
            user_id: userID.value,
        });
        message.value = '';
    });
});
