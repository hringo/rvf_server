package
{
	import com.adobe.serialization.json.JSON;
	
	import flash.display.MovieClip;
	
	import rvf.classes.Game;
	import rvf.classes.User;
	import rvf.events.UserEvent;
	import rvf.socket.Server;
	
	public class WinLogin extends MovieClip
	{
		private var oServer:Server;
		private var oGame:Game;
		
		public function WinLogin(server:Server, game:Game)
		{
			super();
			
			oServer = server;
			oServer.addEventListener(UserEvent.USER_LOGED_IN, LoginHandler);
			
			oGame = game;
		}
		
		protected function LoginHandler(evt:UserEvent):void {
			var u:User = User.UserLogin(evt.getData().username, evt.getData().password);
			
			if(u != null) {
				oGame.AddUserToGame(u);
				this.mcPlayers.txtPlayers.text = this.mcPlayers.txtPlayers.text + u.getUsername() + "\n";
				
				var oData:Object = new Object();
				oData.servercode = oGame.getGame();
				oData.username = u.getUsername();
				oData.firstname = u.getFirstname();
				oData.lastname = u.getLastname();
				
				var oJson:Object = {type:"login_success", data:oData};
				oServer.SendDataClient(evt.getClient(), com.adobe.serialization.json.JSON.encode(oJson));
			} else {
				trace("no-user found");
			}
		}
	}
}