import Nat8 "mo:base/Nat8";

actor {
    // toNat
    public func toNat(n8: Nat8) : async Nat {
        return Nat8.toNat(n8);
    };
    // toNat(10)->10 (Nat)

    // fromNat
    public func fromNat(n: Nat) : async Nat8 {
        return Nat8.fromNat(n);
    };
    // fromNat(10)-> (Nat8)

    // fromIntWrap
    public func fromIntWrap(i: Int) : async Nat8 {
        return Nat8.fromIntWrap(i);
    };
    // fromIntWrap(10)->10 (Nat8)

    // toText
    public func toText(n: Nat8) : async Text {
        return Nat8.toText(n);
    };
    // toText(10)->"10"

    // min
    public func min(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.min(n, m);
    };
    // min(5, 10)->5

    // max
    public func max(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.max(n, m);
    };
    // max(5, 10)->10

    // equal
    public func equal(n: Nat8, m: Nat8) : async Bool {
        return Nat8.equal(n, m);
    };
    // equal(5, 10)->false

    // notEqual
    public func notEqual(n: Nat8, m: Nat8) : async Bool {
        return Nat8.notEqual(n, m);
    };
    // notEqual(5, 10)->true

    // less
    public func less(n: Nat8, m: Nat8) : async Bool {
        return Nat8.less(n, m);
    };
    // less(5, 10)->true

    // lessOrEqual
    public func lessOrEqual(n: Nat8, m: Nat8) : async Bool {
        return Nat8.lessOrEqual(n, m);
    };
    // lessOrEqual(5, 5)->true

    // greater
    public func greater(n: Nat8, m: Nat8) : async Bool {
        return Nat8.greater(n, m);
    };
    // greater(5, 10)->false

    // greaterOrEqual
    public func greaterOrEqual(n: Nat8, m: Nat8) : async Bool {
        return Nat8.greaterOrEqual(n, m);
    };
    // greaterOrEqual(5, 5)->true

    // compare
    public func compare(n: Nat8, m: Nat8) : async {#less; #equal; #greater} {
        return Nat8.compare(n, m);
    };
    // compare(5, 10)->#less, compare(10, 5)->#greater

    // add
    public func add(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.add(n, m);
    };
    // add(5, 10)->15 

    // sub
    public func sub(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.sub(n, m);
    };
    // sub(10, 5)->5

    // mul
    public func mul(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.mul(n, m);
    };
    // mul(10, 5)->50

    // div
    public func div(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.div(n, m);
    };
    // div(1, 3)->?

    // rem
    public func rem(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.rem(n, m);
    };
    // rem(1, 3)->1

    // pow
    public func pow(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.pow(n, m);
    };
    // pow(3, 3)->27

    // bitnot
    public func bitnot(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitnot(n, m);
    };
    // bitnot()

    // bitand
    public func bitand(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitand(n, m);
    };
    // bitand(0011, 0010)->10

    // bitor
    public func bitor(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitor(n, m);
    };
    // bitor()->

    // bitxor
    public func bitxor(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitxor(n, m);
    };
    // bitxor()->

    // bitshiftLeft
    public func bitshiftLeft(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitshiftLeft(n, m);
    };
    // bitshiftLeft()->

    // bitshiftRight
    public func bitshiftRight(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitshiftRight(n, m);
    };
    // bitshiftRight()->

    // bitrotLeft
    public func bitrotLeft(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitrotLeft(n, m);
    };
    // bitrotLeft()->

    // bitrotRight
    public func bitrotRight(n: Nat8, m: Nat8) : async Nat8 {
        return Nat8.bitrotRight(n, m);
    };
    // bitrotRight()->

    // bittest
    public func bittest(n: Nat8, p: Nat) : async Bool {
        return Nat8.bittest(n, p);
    };
    // bittest()->

    // bitset
    public func bitset(n: Nat8, p: Nat) : async Nat8 {
        return Nat8.bitset(n, p);
    };
    // bitset()->

    // bitclear
    public func bitclear(n: Nat8, p: Nat) : async Nat8 {
        return Nat8.bitclear(n, p);
    };
    // bitclear()->

    // bitflip
    public func bitflip(n: Nat8, p: Nat) : async Nat8 {
        return Nat8.bitflip(n, p);
    };
    // bitflip()->

    // bitcountLeadingZero
    public func bitcountLeadingZero(n: Nat8) : async Nat8 {
        return Nat8.bitcountLeadingZero(n);
    };
    // bitcountLeadingZero()->

    // bitcountTrailingZero
    public func bitcountTrailingZero(n: Nat8) : async Nat8 {
        return Nat8.bitcountTrailingZero(n);
    };
    // bitcountTrailingZero()->

    // addWrap
    public func addWrap(n: Nat8, m:Nat8) : async Nat8 {
        return Nat8.addWrap(n, m);
    };
    // addWrap()->

    // subWrap
    public func subWrap(n: Nat8, m:Nat8) : async Nat8 {
        return Nat8.subWrap(n, m);
    };
    // subWrap()->

    // mulWrap
    public func mulWrap(n: Nat8, m:Nat8) : async Nat8 {
        return Nat8.mulWrap(n, m);
    };
    // mulWrap()->

    // powWrap
    public func powWrap(n: Nat8, m:Nat8) : async Nat8 {
        return Nat8.powWrap(n, m);
    };
    // powWrap()->

};
