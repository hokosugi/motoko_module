
import Bool "mo:base/Bool";

// Boolのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Boolのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Bool.html)

actor {
    // for compare
    type compareType = {
        #less; 
        #equal; 
        #greater
    };

    // toText
    public func totext(b : Bool) : async Text {return Bool.toText(b);}; //true->"true"
    // logand(a and b)
    public func logand(a : Bool, b : Bool) : async Bool {return Bool.logand(a, b);}; //a:true,b:false->false
    // logor(a or b)
    public func logor(a : Bool, b : Bool) : async Bool {return Bool.logor(a, b);}; //a:true,b:false->true
    // logxor(exclusive or of a and b,  a != b))
    public func logxor(a : Bool, b : Bool) : async Bool {return Bool.logxor(a, b);}; //a:true,b:true->false
    // lognot(not a)
    public func lognot(a : Bool) : async Bool {return Bool.lognot(a);}; // a=true->false
    // equal(a==b)
    public func equal(a : Bool, b : Bool) : async Bool {return Bool.equal(a, b);}; // a:true, b:true->true
    // notEqual(a!=b)
    public func notEqual(a : Bool, b : Bool) : async Bool {return Bool.notEqual(a, b);}; // a:true, b:true->false
    // compare(order of a and a, where false < true.)
    public func compare(a : Bool, b : Bool) : async compareType {return Bool.compare(a, b);}; // a:true, b:false->#greater
};