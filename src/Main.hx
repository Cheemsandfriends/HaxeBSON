/*
 * Apache License, Version 2.0
 *
 * Copyright (c) 2023 CheemsAndFriends
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import haxe.Json;
import haxe.PosInfos;
import haxe.Log;
import haxe.io.Path;
import sys.FileSystem;
import bson.Bson;
import sys.io.File;

class Main 
{
	static function main() 
	{
		readBSON();
	}

	static function readBSON()
	{
		Log.trace = processTrace;
		var file = "./assets/";
		var stuff = FileSystem.readDirectory(file).filter((file) -> return Path.extension(file) == "bson");
		if (stuff.length == 0)
		{
			trace("\t\t\t\t\t    THE LIST OF BINARY JSONS IS EMPTY!");
			return;
		}
		trace("\t\t\t\t\t    LIST OF BINARY JSONS INSIDE ASSETS");
		trace("\t\t\t\t\t\t[");
		trace("\t\t\t\t\t\t\t" + stuff.join("\n\t\t\t\t"));
		trace("\t\t\t\t\t\t]");
		trace("\t\t\t  Which BSON are you choosing? (choose an array index starting from 1)");
		var line = Std.parseInt(Sys.stdin().readLine());
		

		if (!Math.isNaN(line) && stuff.length > line - 1) 
			file += stuff[line - 1] 
		else 
		{
			trace("\t\t\t\t\t\t\tNOT VALID!");
			return;
		}
		
		var json = Json.stringify(Bson.parse(File.getContent(file)), "\n\t\t\t\t\t\t\t");
		trace("\t\t\t\t\t\t" + json.substring(0, json.length - 1));
		trace("\t\t\t\t\t\t}");
		Sys.sleep(0.3);
		trace("\t\t\t\t\t\tWanna read another BSON?");
		trace("\t\t\t\t\t\t\t  Y/N");
		var option = Sys.stdin().readLine();
		if (option.toUpperCase() == "Y") readBSON();
	}
	static function processTrace(v:Dynamic, ?infos:PosInfos):Void
	{
		var str = Std.string(v);
		#if js
		if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
			(untyped console).log(str);
		#elseif lua
		untyped __define_feature__("use._hx_print", _hx_print(str));
		#elseif sys
		Sys.println(str);
		#else
		throw new haxe.exceptions.NotImplementedException()
		#end
	}

}
