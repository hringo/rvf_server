package rvf.classes
{
	public class Game
	{
		private static var sGameID:String = (Math.random() * 1000).toString();
		private static var oPlayers:Vector.<User> = new Vector.<User>;
		
		public function Game() {}
		
		public function getGame():String {return sGameID;}
		public function getUsers():Vector.<User> {return oPlayers;}
		
		public function AddUserToGame(u:User):void {
			oPlayers.push(u);
		}
	}
}