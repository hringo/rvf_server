package rvf.events
{
	import com.adobe.fileformats.vcard.Email;
	
	import flash.events.Event;
	import flash.net.Socket;

	public class UserEvent extends Event
	{
		public static const USER_LOGED_IN:String = "userLogedIn";
		
		private var oData:Object;
		private var oClient:Socket;
		
		public function UserEvent(type:String, client:Socket, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type,bubbles,cancelable);
			this.oClient = client;
			this.oData = data;
		}
		
		public function getData():Object {return oData;}
		public function getClient():Socket {return oClient;}
	}
}