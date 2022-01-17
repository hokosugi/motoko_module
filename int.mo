import Int "mo:base/Int";
import Hash "mo:base/Hash";

// Intのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Intのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Int.html)

actor {    
    let max : Int = 2;
    let min : Int = 1;
    let same : Int = 2;
    let hashOfTwo : Hash.Hash = 3469318313; // maxのhash値

    // method compareは型指定なので以下のtypeを利用します。
    type compareType = {
        #less; 
        #equal; 
        #greater
    };


    public func abs(i : Int) : async Nat {return Int.abs(i)};   // 2 (Int -> Nat)
    public func toText(i : Int) : async Text {return Int.toText(i)}; // "2"
    let whichMin : Int = Int.min(max, min); // 1
    let whichMax : Int = Int.max(max, min); // 2
    public func hash(i : Int) : async Hash.Hash {return Int.hash(i)}; //hash(max)（実行）=>3469318313
    public func hashAcc(hash : Hash.Hash, i : Int) : async Hash.Hash {return Int.hashAcc(hash, i)}; //hashAcc(hashOfTwo, max)=>1589815755
    public func equal(i : Int, j : Int) : async Bool {return Int.equal(i, j)}; //equal(max,min)=>false
    public func notEqual(i : Int, j : Int) : async Bool {return Int.notEqual(i, j)}; // notEqual(max,min)=>true
    public func less(i : Int, j : Int) : async Bool {return Int.less(i, j)}; //less(max,min)=>false
    public func lessOrEqual(i : Int, j : Int) : async Bool {return Int.lessOrEqual(i, j)}; //lessOrEqual(max,same)=>true
    public func greater(i : Int, j : Int) : async Bool {return Int.greater(i, j)}; //greater(max,min)=>true
    public func greaterOrEqual(i : Int, j : Int) : async Bool {return Int.greaterOrEqual(i, j)}; //greaterOrEqual(max,same)=>true
    public func compare(i : Int, j : Int) : async compareType {return Int.compare(i, j)}; //compare(max,same)=>#equal *compareTypeを作成する
    public func neq(i : Int) : async Int {return Int.neq(i)}; //neq(max)=>-2
    public func add(i : Int, j : Int) : async Int {return Int.add(i, j)}; //add(max, same)=>4
    public func sub(i : Int, j : Int) : async Int {return Int.sub(i, j)}; //sub(max, same)=>0
    public func mul(i : Int, j : Int) : async Int {return Int.mul(i, j)}; //mul(max, min)=>2
    public func div(i : Int, j : Int) : async Int {return Int.div(i, j)}; //div(max, same)=>1
    public func rem(i : Int, j : Int) : async Int {return Int.rem(i, j)}; //rem(8, 3)=>2
    public func pow(i : Int, j : Int) : async Int {return Int.pow(i, j)}; //pow(2, 3)=>8

    
}