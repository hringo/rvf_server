package rvf.classes
{
	public class User
	{
		private static var DUMMY_USERS:Vector.<User> = new <User>[
			new User("stieno007","Stijn","Goethals"),
			new User("schaemelhoutM","Mathias", "Schaemelhout"),
			new User("MDeruddere", "Matthias", "Deruddere"),
			new User("PeerT", "Thomas","Peire")
		];
		
		private var sGame:String;
		private var sUsername:String;
		private var sFirstname:String;
		private var sLastname:String;
		
		public function User(username:String, firstname:String, lastname:String) {
			this.sUsername = username;
			this.sFirstname = firstname;
			this.sLastname = lastname;
		}
		
		public function getGame():String {return sGame;}
		public function getUsername():String {return sUsername;}
		public function getFirstname():String {return sFirstname;}
		public function getLastname():String {return sLastname;}
		
		public static function UserLogin(username:String, password:String):User {
			//Hier moet naar de database worden gegaan om te controleren of de username wel bestaat en of het wachtwoord correct is
			for each(var u:User in DUMMY_USERS) {
				if(u.getUsername() == username)
					return u;
			}
			
			return null;
		}
	}
}