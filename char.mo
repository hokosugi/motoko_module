import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Arr "mo:base/Array";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";

// Charのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Charのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Char.html)

actor {
    // Char toNat32
    public func char(c : Char) : async Nat32 {return Char.toNat32(c);};
    // fromNat32
    public func fromNat32(n : Nat32) : async Char {return Char.fromNat32(n);};
    // toText
    public func totext(c : Char) : async Text {return Char.toText(c);};
    // isDigit
    public func isdigit(c : Char) : async Bool {return Char.isDigit(c);};

}