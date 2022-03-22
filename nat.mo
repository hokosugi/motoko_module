import Nat "mo:base/Nat";

// Natのライブラリにあるメソッド使用例です。deployして使ってみてください。
// deploy後は
// dfx canister call <CANISTER-NAME> <METHOD-NAME> '()'
// Natのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Nat.html)


actor {
    // toText
     public func toText(n : Nat) : async Text {
         return Nat.toText(n);
    }; 
     // toText(5)->"5"

     // min
     public func min(n : Nat, m: Nat) : async Nat {
         return Nat.min(n, m);
    }; 
     // min(10, 20)->10

     // max
     public func max(n : Nat, m: Nat) : async Nat {
         return Nat.max(n, m);
    }; 
    // max(10, 20)->20

    // equal
     public func equal(n : Nat, m: Nat) : async Bool {
         return Nat.equal(n, m);
    }; 
    // equal(10, 20)-> false

    // notEqual
     public func notEqual(n : Nat, m: Nat) : async Bool {
         return Nat.notEqual(n, m);
    }; 
    // notEqual(10, 20)-> true

    // less
     public func less(n : Nat, m: Nat) : async Bool {
         return Nat.less(n, m);
    }; 
    // less(10, 20)-> true

    // lessOrEqual
    public func lessOrEqual(n : Nat, m: Nat) : async Bool {
         return Nat.lessOrEqual(n, m);
    }; 
    // lessOrEqual(10, 20)-> true, lessOrEqual(10, 10)-> true

    // greater
    public func greater(n : Nat, m: Nat) : async Bool {
         return Nat.greater(n, m);
    }; 
    // greater(10, 20)-> false

    // greaterOrEqual
    public func greaterOrEqual(n : Nat, m: Nat) : async Bool {
         return Nat.greaterOrEqual(n, m);
    }; 
    // greaterOrEqual(10, 20)-> true, greaterOrEqual(10, 10)-> true

    // compare
    public func compare(n : Nat, m: Nat) : async {#less; #equal; #greater} {
         return Nat.compare(n, m);
    }; 
    // compare(10, 20)-> #less,  compare(20, 10)-> #greater,

    // add
    public func add(n : Nat, m: Nat) : async Nat{
         return Nat.add(n, m);
    }; 
    // add(10, 20)-> 30

    // sub
    public func sub(n : Nat, m: Nat) : async Nat {
         return Nat.sub(n, m);
    }; 
    // sub(20, 10)-> 10, sub(10, 20)->"Call was rejected"

    // mul
    public func mul(n : Nat, m: Nat) : async Nat {
         return Nat.mul(n, m);
    }; 
    // mul(10, 20)-> 200

    // div
    public func div(n : Nat, m: Nat) : async Nat {
         return Nat.div(n, m);
    }; 
    // div(20, 10)-> 2, div(10, 20)-> 0, div(10, 0)->"Call was rejected"

    // rem
    public func rem(n : Nat, m: Nat) : async Nat {
         return Nat.rem(n, m);
    }; 
    // rem(20, 11)-> 9, div(10, 20)-> 10

    //pow
    public func pow(n : Nat, m: Nat) : async Nat {
         return Nat.pow(n, m);
    }; 
    // pow(10, 2)-> 100

}