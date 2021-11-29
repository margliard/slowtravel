import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`);
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => {
          console.log(data)
          this.element.insertAdjacentHTML("beforeend", data)
        }
      }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
