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

    //　unicodeから変換
    public func fromChar(c : Char) : async Text {return Text.fromChar(c)}; 
    // fromChar(10010)=>"✚"

    // イテレート（unicodeへ変換） ＊c
    func toIter(t : Text) : Iter.Iter<Char> {return Text.toIter(t)};

    // イテレート（unicodeから）して文字列（text）にする 　＊import Char "mo:base/Char";
    func fromIter(c : Iter.Iter<Char>) : async Text {return Text.fromIter(c)}; 

    // textのサイズ
    public func size(t : Text) : async Nat {return Text.size(t)}; 
    //size(text)=>4

    // hash
    public func hash(t : Text) : async Hash.Hash {return Text.hash(t)}; 
    //hash(text)=>2090756362

    // concat（連結）
    public func concat(t1 : Text, t2 : Text) : async Text {return Text.concat(t1, t2)}; 
    //concat(text, text)=>"texttext"

    // equal（突合）
    public func equal(t1 : Text, t2 : Text) : async Bool {return Text.equal(t1, t2)}; 
    //equal(text, text)=>true

    // notEqual
    public func notEqual(t1 : Text, t2 : Text) : async Bool {return Text.notEqual(t1, t2)}; 
    // notEqual(text, text)=>false

    // less *アルファベット昇順true
    public func less(t1 : Text, t2 : Text) : async Bool {return Text.less(t1, t2)}; 
    // less(text, text)=>false

    // lessOrEqual
    public func lessOrEqual(t1 : Text, t2 : Text) : async Bool {return Text.lessOrEqual(t1, t2)}; 
    // lessOrEqual(text, test)=>true

    // greater *アルファベット降順true
    public func greater(t1 : Text, t2 : Text) : async Bool {
        return Text.greater(t1, t2)}; 
    // greater(text,"test")=>true

    // greaterOrEqual
    public func greaterOrEqual(t1 : Text, t2 : Text) : async Bool {
        return Text.greaterOrEqual(t1, t2)}; 
    // greaterOrEqual(text,"test")=>true

    // compare
    public func compare(t1 : Text, t2 : Text) : async compareType {
        return Text.compare(t1, t2)}; 
    // compare(text,text)=>#equal

    // join Iter.Iter<Text>を配列以外で書けるなら教えてほしい
    public func join(target : Text, txt: Text) : async Text {
        let iter_txt = Text.toIter(txt);
        var arr: [Text] = [];
        for (v in iter_txt){
            arr := Arr.append(arr, [Char.toText(v)]);
        };
        return Text.join(target, arr.vals());
    }; 
    //join(add, test)=>"taddeaddsaddt"


    // map 
    public func map(target : Text) : async Text {  
        let mapped = Text.map(
            target, 
            func(t){Char.fromNat32(32+Char.toNat32(t))}
            );
        return mapped;
    }; 
    // map("TEST")->"test"


    // translate
     public func translate(target : Text) : async Text {  
        let mapped = Text.translate(
            target, 
            func(t){Char.toText(Char.fromNat32(33))}
            );
        return mapped;
    }; 
    // translate("test")->"!!!!" *unicode33は"!"

    // pattern 以下のメソッドで利用する
    // type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)}

    public func split(t: Text, split_target: Text) : async [Text]{
        let txt = Text.split(t, #text split_target);  //txtはIterタイプ
        var arr: [Text] = [];
        for (v in txt){
            arr := Arr.append(arr, [v]);
        };
        return arr;
    };
    // split("test", "e")->["t", "st"]

    // tokens
    public func tokens(t: Text, split_target: Text) : async [Text]{
        let txt = Text.tokens(t, #text split_target);  //txtはIterタイプ
        var arr: [Text] = [];
        for (v in txt){
            arr := Arr.append(arr, [v]);
        };
        return arr;
    };
    // tokens("test", "e")->["t", "st"]

    // contains
    public func contains(t: Text, p: Text) : async Bool {
        return Text.contains(t, #text p);
    };
    // contains("test", "es")->true

    // startsWith
    public func startsWith(t: Text, p: Text) : async Bool {
        return Text.startsWith(t, #text p);
    };
    // startsWith("test", "t")->true

    // endsWith
    public func endsWith(t: Text, p: Text) : async Bool {
        return Text.startsWith(t, #text p);
    };
    // endsWith("test", "t")->true

    // replace
    public func replace(t: Text, p: Text, r: Text) : async Text {
        return Text.replace(t, #text p, r);
    };
    // replace("test", "s", "x")->"text"

    // stripStart
    public func stripStart(t: Text, p: Text) : async ?Text {
        return Text.stripStart(t, #text p);
    };
    // stripStart("test", "t")->"est", stripStart("test", "e")->null

    // stripEnd
    public func stripEnd(t: Text, p: Text) : async ?Text {
        return Text.stripEnd(t, #text p);
    };
    // stripEnd("test", "t")->"tes", stripEnd("test", "s")->null

    // trimStart
    public func trimStart(t: Text, p: Text) : async Text {
        return Text.trimStart(t, #text p);
    };
    // trimStart("test", "t")->"est", trimStart("test", "e")->"test"

    // trimEnd
    public func trimEnd(t: Text, p: Text) : async Text {
        return Text.trimEnd(t, #text p);
    };
    // trimEnd("test", "t")->"tes", trimEnd("test", "s")->"test"

    // trim
    public func trim(t: Text, p: Text) : async Text {
        return Text.trim(t, #text p);
    };
    // trim("test", "t")->"es",trim("test", "e")->"test"

    // compareWith
    public func compareWith(t1: Text, t2: Text) : async compareType {
        return Text.compareWith(t1, t2, Char.compare);
    };
    // compareWith("test", "test")->#equal, compareWith("test", "text")->#less

    // encodeUtf8
    public func encodeUtf8(t: Text) : async Blob {
        return Text.encodeUtf8(t);
    };
    // encodeUtf8("test")->(vec {116; 101; 115; 116})

    // decodeUtf8
    public func decodeUtf8(b: Blob) : async ?Text {
        return Text.decodeUtf8(b);
    };
    // decodeUtf8([116, 101, 115, 116])->"test"

};