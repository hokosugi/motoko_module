import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Arr "mo:base/Array";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";

// Textのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Textのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Text.html)

actor {
    let text = "text";

    // method compareは型指定なので以下のtypeを利用します。
    type compareType = {
        #less; 
        #equal; 
        #greater
    };
    // map用関数
    func mapTs(c : Char) : Char {return c};
    let fromCharIter = func fromChar(c : Char) : Text {return Text.fromChar(c)};

    //　unicodeから変換
    public func fromChar(c : Char) : async Text {return Text.fromChar(c)}; // fromChar(10010)=>"✚"
    // イテレート（unicodeへ変換） ＊c
    func toIter(t : Text) : Iter.Iter<Char> {return Text.toIter(t)};  
    // イテレート（unicodeから）して文字列（text）にする 　＊import Char "mo:base/Char";
    func fromIter(c : Iter.Iter<Char>) : async Text {return Text.fromIter(c)}; 
    // textのサイズ
    public func size(t : Text) : async Nat {return Text.size(t)}; //size(text)=>4
    // hash
    public func hash(t : Text) : async Hash.Hash {return Text.hash(t)}; //hash(text)=>2090756362
    // concat（連結）
    public func concat(t1 : Text, t2 : Text) : async Text {return Text.concat(t1, t2)}; //concat(text, text)=>"texttext"
    // equal（突合）
    public func equal(t1 : Text, t2 : Text) : async Bool {return Text.equal(t1, t2)}; //equal(text, text)=>true
    // notEqual
    public func notEqual(t1 : Text, t2 : Text) : async Bool {return Text.notEqual(t1, t2)}; //notEqual(text, text)=>false
    // less *アルファベット昇順true
    public func less(t1 : Text, t2 : Text) : async Bool {return Text.less(t1, t2)}; //less(text, text)=>false
    // lessOrEqual
    public func lessOrEqual(t1 : Text, t2 : Text) : async Bool {return Text.lessOrEqual(t1, t2)}; //lessOrEqual(text, test)=>true
    // greater *アルファベット降順true
    public func greater(t1 : Text, t2 : Text) : async Bool {return Text.greater(t1, t2)}; //greater(text,"test")=>true
    // greaterOrEqual
    public func greaterOrEqual(t1 : Text, t2 : Text) : async Bool {return Text.greaterOrEqual(t1, t2)}; //greaterOrEqual(text,"test")=>true
    // compare
    public func compare(t1 : Text, t2 : Text) : async compareType {return Text.compare(t1, t2)}; //compare(text,text)=>#equal
    // join ＊Iterはshared & public関数では使えないかも
    func join(target : Text, txt : Iter.Iter<Text>) : async Text {return Text.join(target, txt)}; //join(text, text)=>"text"
    // map ＊public関数では""shared function has non-shared parameter type(Text, Char -> Char)type(Text, Char-> Char)is or contains non-shared type Char -> Char"
    public func map(target : Text) : async Text {  //map(text)=>"text"
        let m = Text.map(target, mapTs);
        return m;}; 
    // translate
    public func translate(t1 : Text) : async Text {
        let t = Text.translate(t1, fromCharIter);
        return t;}; //translate(text,mapTs)=>??????
    // pattern
    func join(target : Text, txt : Iter.Iter<Text>) : async Text {return Text.join(target, txt)}; //join(text, text)=>"text"

    

}