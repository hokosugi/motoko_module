import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Arr "mo:base/Array";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Random "mo:base/Random";

// error (expected object type, but expression produces type Blob -> async Finite/177)が出ている（未解決）


// Ramdomのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Ramdomのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/random.html)

actor class Finite(entropy : Blob) {
    // byte error(expected object type, but expression produces type Blob -> async Finite/177)
    public func byte() : async ?Nat8 {return Finite.byte();};
    // coin　error(expected object type, but expression produces type Blob -> async Finite/177)
    public func coin() : async ?Bool {return Finite.coin();};
    // range　error(expected object type, but expression produces type Blob -> async Finite/177)
    public func range(p : Nat8) : async ?Bool {return Finite.coin(p);};

};
    