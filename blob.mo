import Char "mo:base/Char";
import Text "mo:base/Text";
import Blob "mo:base/Blob";

// *playgroundではエラーになりました dfx canister call <canister-name> <method-name> でテストしてください

actor {
    // hash
    public func hash(b: Blob) : async Nat32 {
        return Blob.hash(b);
    };
    // hash(vec {2;3;4})-> (3_498_416_806 : nat32) 

    // equal
    public func equal(b1: Blob, b2: Blob) : async Bool {
        return Blob.equal(b1, b2);
    };
    // equal(vec{2;3;4}, vec{2;3;4})->true 

    // notEqual
    public func notEqual(b1: Blob, b2: Blob) : async Bool {
        return Blob.notEqual(b1, b2);
    };
    // notEqual(vec{2;3;4}, vec{2;3;4})->false

    // less
    public func less(b1: Blob, b2: Blob) : async Bool {
        return Blob.less(b1, b2);
    };
    // less(vec {2;3;4}, vec {3;4;5})->true

    // lessOrEqual
    public func lessOrEqual(b1: Blob, b2: Blob) : async Bool {
        return Blob.lessOrEqual(b1, b2);
    };
    // lessOrEqual(ec {2;3;4}, vec {3;4;5})->true

    // greater
    public func greater(b1: Blob, b2: Blob) : async Bool {
        return Blob.greater(b1, b2);
    };
    // greater(ec {2;3;4}, vec {3;4;5})->false

    // greaterOrEqual
    public func greaterOrEqual(b1: Blob, b2: Blob) : async Bool {
        return Blob.greaterOrEqual(b1, b2);
    };
    // greaterOrEqual(ec {2;3;4}, vec {3;4;5})->false

    // compare
    public func compare(b1: Blob, b2: Blob) : async {#less; #equal; #greater} {
        return Blob.compare(b1, b2);
    };
    // compare(ec {2;3;4}, vec {3;4;5})->#less

    //fromArray
    public func fromArray(n8: [Nat8]) : async Blob {
        return Blob.fromArray(n8);
    };
    // fromArray([3, 4, 5, 6, 7, 8])->(blob "\03\04\05\06\07\08")

    //fromArrayMut not public関数
    func fromArrayMut(n8: [var Nat8]) : Blob {
        return Blob.fromArrayMut(n8);
    };
    // fromArrayMut([3, 4, 5, 6, 7, 8])->(blob "\03\04\05\06\07\08")

    //toArray
    public func toArray(b: Blob) : async [Nat8] {
        return Blob.toArray(b);
    };
    // toArray([3, 4, 5, 6, 7, 8])->(blob "\03\04\05\06\07\08")

    //toArrayMut not public関数
    func toArrayMut(b: Blob) : [var Nat8] {
        return Blob.toArrayMut(b);
    };
    // toArrayMut([3, 4, 5, 6, 7, 8])->(blob "\03\04\05\06\07\08")

};