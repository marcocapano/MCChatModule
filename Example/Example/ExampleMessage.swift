//
//  Message.swift
//  MCChatModule
//
//  Created by Marco Capano on 06/08/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation
import MCChatModule

struct ExampleMessage: MessageType {
    ///The message's content.
    var text: String
    
    ///The sender of the message.
    var sender: SenderType
    
    static var mockMessages: [ExampleMessage] = {
        let me = ExampleUser(name: "Marco", id: "myID")
        let someGuy = ExampleUser(name: "Stranger", id: "strangerID")
        
        return [
            ExampleMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sed mollis tortor. Etiam ac justo.", sender: me),
            ExampleMessage(text: "Suspendisse potenti. Nam auctor condimentum turpis, sit amet ornare ligula aliquam at. Nulla ut mi faucibus, aliquam erat id, dignissim ipsum. Ut vulputate tortor in malesuada posuere. Pellentesque aliquam massa ac venenatis.", sender: someGuy),
            ExampleMessage(text: "Proin vestibulum.", sender: me),
            ExampleMessage(text: "Nunc id ipsum porta, mattis lacus eget, semper turpis. Fusce 🎉🎉🎉", sender: me),
            ExampleMessage(text: "Nullam elementum id orci quis molestie. Donec eleifend libero massa, id ornare quam condimentum at. Curabitur pulvinar et ligula id venenatis. Duis in ante a mi aliquet hendrerit. Sed dolor justo, lobortis non vehicula eu, sollicitudin eget nisl. Nunc quis mi turpis. Suspendisse ac fringilla massa. Proin mauris lorem, sodales in commodo in, consequat ut sapien. In eros sem, commodo id risus quis, maximus dictum orci. Morbi nec velit sem. Aenean at interdum lorem, eu interdum nibh.", sender: someGuy),
            ExampleMessage(text: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...", sender: me),
            ExampleMessage(text: "Proin ut venenatis odio, nec gravida massa. Maecenas! 😂", sender: someGuy),
            ExampleMessage(text: "Curabitur non lorem a turpis congue dictum gravida.", sender: someGuy),
            ExampleMessage(text: "Nullam at arcu aliquam, aliquet lectus sodales, scelerisque massa. Morbi vel ullamcorper mauris, a malesuada lacus. Praesent dapibus tempor est, quis scelerisque enim. Suspendisse.", sender: me),
            ExampleMessage(text: "Phasellus pellentesque 👍🏻", sender: someGuy),
            ExampleMessage(text: "Pellentesque consequat. \n👨🏿‍💻", sender: me)
        ]
        
    }()
}
