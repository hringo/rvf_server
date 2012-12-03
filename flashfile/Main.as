package
{
	import flash.display.MovieClip;
	
	import rvf.classes.Game;
	import rvf.socket.Server;
	
	public class Main extends MovieClip
	{
		private var oServer:Server;
		private var oGame:Game;
		//test
		//testdsfq
		//test4
		//ultimate test
		//test2
		//test5
		//test6
		//tet7
		//test123
		
		///matthiaaaasjjj
		//preute leute
		public function Main()
		{
			oServer = new Server();
			oGame = new Game();
			
			var wLogin:WinLogin = new WinLogin(oServer,oGame);
			this.addChild(wLogin);
		}
		
		public static function trim(s:String ):String {
			return s.replace( /^([\r|\s|\t|\n]+)?(.*)([\r|\s|\t|\n]+)?$/gm, "$2" );
		}
	}
}