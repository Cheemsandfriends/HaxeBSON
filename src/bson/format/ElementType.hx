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

enum abstract ElementType(Null<Int>) 
{
    var DOUBLE = 0x1;
    var STRING = 0x2;
    var INT32 = 0x10;
    var UINT64 = 0x11;
    var INT64 = 0x12;
}