
import Char "mo:base/Char";


// Charのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Charのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Char.html)


actor {
    // toNat32
    public func toNat32(c: Char) : async Nat32 {
        return Char.toNat32(c);
    };
    // toNat32(97)->97 (Char)

    // fromNat32
    public func fromNat32(n: Nat32) : async Char {
        return Char.fromNat32(n);
    };
    // fromNat32(97)->97, fromNat32(55296)->trap

    // toText
    public func toText(c: Char) : async Text {
        return Char.toText(c);
    };
    // toText(97)->"a"

    // isDigit
    public func isDigit(c: Char) : async Bool {
        return Char.isDigit(c);
    };
    // isDigit(97)->false, isDigit(48)->true

    // isWhitespace
    public func isWhitespace(c: Char) : async Bool {
        return Char.isWhitespace(c);
    };
    // isWhitespace(97)->false, isWhitespace(32)->true

    // isLowercase
    public func isLowercase(c: Char) : async Bool {
        return Char.isLowercase(c);
    };
    // isLowercase(97)->true, isLowercase(65)->false
  
    // isUppercase
    public func isUppercase(c: Char) : async Bool {
        return Char.isUppercase(c);
    };
    // isUppercase(97)->false, isUppercase(65)->true

    // isAlphabetic
    public func isAlphabetic(c: Char) : async Bool {
        return Char.isAlphabetic(c);
    };
    // isAlphabetic(98)->true, isAlphabetic(33)->true

    // equal
    public func equal(c1: Char, c2: Char) : async Bool {
        return Char.equal(c1, c2);
    };
    // equal(98, 98)->true

    // notEqual
    public func notEqual(c1: Char, c2: Char) : async Bool {
        return Char.notEqual(c1, c2);
    };
    // notEqual(98, 98)->false

    // less
    public func less(c1: Char, c2: Char) : async Bool {
        return Char.less(c1, c2);
    };
    // less(97, 98)->true

    // lessOrEqual
    public func lessOrEqual(c1: Char, c2: Char) : async Bool {
        return Char.lessOrEqual(c1, c2);
    };
    // lessOrEqual(98, 99)->false, lessOrEqual(99, 99)->true

    // greater
    public func greater(c1: Char, c2: Char) : async Bool {
        return Char.greater(c1, c2);
    };
    // greater(97, 98)->false

    // greaterOrEqual
    public func greaterOrEqual(c1: Char, c2: Char) : async Bool {
        return Char.greaterOrEqual(c1, c2);
    };
    // greaterOrEqual(99, 98)->true, greaterOrEqual(98, 98)->true

    // compare
    public func compare(c1: Char, c2: Char) : async {#less; #equal; #greater} {
        return Char.compare(c1, c2);
    };
    // compare(97, 98)->#less, compare(99, 98)->#greater
};