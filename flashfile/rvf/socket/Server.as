package rvf.socket
{
	import com.adobe.serialization.json.JSON;
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.events.ServerSocketConnectEvent;
	import flash.net.ServerSocket;
	import flash.net.Socket;
	import flash.text.engine.EastAsianJustifier;
	
	import rvf.events.UserEvent;
	
	public class Server extends Sprite
	{
		private var server:ServerSocket;
		private var clients:Vector.<Socket> = new Vector.<Socket>;
		
		public function Server()
		{
			server = new ServerSocket();
			server.bind(4500,"172.23.237.190");
			
			server.addEventListener(ServerSocketConnectEvent.CONNECT,clientConnected);
			server.listen();
		}
		
		public function clientConnected(event:ServerSocketConnectEvent):void {		
			var client:Socket = event.socket as Socket;
			client.addEventListener(ProgressEvent.SOCKET_DATA, clientDataHandler);
			
			clients.push(client);
		}
		
		public function clientDataHandler(event:ProgressEvent):void {
			var client:Socket =  event.target as Socket;
			var sData:String = client.readUTFBytes(client.bytesAvailable);
			
			try {
				var oData:Object = com.adobe.serialization.json.JSON.decode(sData);
				
				switch(oData.type) {
					case 'login':
						var evt:UserEvent = new UserEvent("userLogedIn",client, oData);
						dispatchEvent(evt);
						break;
				}
			} catch(err:Error) {
				trace(err);
			}
		}
		
		public function SendDataClient(client:Socket, data:String):void {
			try {
				if(client != null && client.connected) {
					client.writeUTFBytes(data);
					client.flush(); 
					trace("Sent message to " + client.remoteAddress + ":" + client.remotePort);
				} else {
					trace("No socket connection.");
				}
			} catch (error:Error) {
				trace(error.message);
			}
		}
		
		public function SendDataAllClients(data:String):void {
			for each(var client:Socket in clients) {
				try {
					if(client != null && client.connected) {
						client.writeUTFBytes(data);
						client.flush(); 
						trace("Sent message to " + client.remoteAddress + ":" + client.remotePort);
					} else {
						trace("No socket connection.");
					}
				} catch (error:Error) {
					trace(error.message);
				}
			}
		}
	}
}