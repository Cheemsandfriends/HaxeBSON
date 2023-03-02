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
package bson.format;

import haxe.io.Bytes;
import haxe.io.BytesInput;

class BsonParser 
{
    public static inline function parse(text:String)
    {
        return new BsonParser(Bytes.ofString(text)).doParse();
    }

    var input:BytesInput;

    function new(text:Bytes)
    {
        input = new BytesInput(text);
    }

    function doParse():Dynamic
    {
        var object = {};
        var size = input.readInt32();
        if (size != input.length)
            throw "Inaccurate size!";
        while (input.position + 1 != size)
        {
            var type:ElementType = cast input.readByte();
            var name = readString();
            var field:Dynamic = switch (type)
            {
                case DOUBLE: input.readDouble();
                case STRING: readString(input.readInt32());
                case INT32: input.readInt32();
                default: {}
            }
            Reflect.setField(object, name, field);
        }
        
        
        return object;
    }
    function readString(?size:Int):String
    {
        if (size != null)
        {
            return input.readString(size);
        }

        var buf = new StringBuf();
        var byte = input.readByte();
        while (byte != 0)
        {
            buf.addChar(byte);
            byte = input.readByte();
            if (byte == 0) break;
        }
        return buf.toString();
    }
}