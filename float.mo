import Float "mo:base/Float";

// Floatのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Floatのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Float.html)

actor {
    // abs
    public func abs(x : Float) : async Float { return Float.abs(x);}; //abs(5)->5
    // sqrt
    public func sqrt(x : Float) : async Float { return Float.sqrt(x);}; //sqrt(5)->2.2236...
    // ceil
    public func ceil(x : Float) : async Float { return Float.ceil(x);}; //ceil(5)->5
    // floor
    public func floor(x : Float) : async Float { return Float.floor(x);}; //floor(5)->5
    // trunc
    public func trunc(x : Float) : async Float { return Float.trunc(x);}; //trunc(5)->5
    // nearest(積分)
    public func nearest(x : Float) : async Float { return Float.nearest(x);}; //nearest(5.1)->5
    // copySign
    public func copySign(x : Float, y : Float) : async Float { return Float.copySign(x, y);}; //copySign(4,5)->4
    // min
    public func min(x : Float, y : Float) : async Float { return Float.min(x, y);}; //min(5, 7)->5
    // max
    public func max(x : Float, y : Float) : async Float { return Float.max(x, y);}; //max(5, 7)->7
    // sin
    public func sin(x : Float) : async Float { return Float.sin(x);}; //sin(5)->-0.95892427466
    // cos
    public func cos(x : Float) : async Float { return Float.cos(x);}; //cos(5)->0.28366218546
    // tan
    public func tan(x : Float) : async Float { return Float.tan(x);}; //tan(5)->-3.38051500625
    // arcsin(return radians)
    public func arcsin(x : Float) : async Float { return Float.arcsin(x);}; //arcsin(1)->1.570796
    // arccos
    public func arccos(x : Float) : async Float { return Float.arccos(x);}; //arccos(0.5)->1.04719755
    // arctan
    public func arctan(x : Float) : async Float { return Float.arctan(x);}; //arctan(1)->0.78539816
    // arctan2
    public func arctan2(x : Float, y : Float) : async Float { return Float.arctan2(x, y);}; //arctan2(1,2)->0.463647609001
    // exp
    public func exp(x : Float) : async Float { return Float.exp(x);}; //exp(1)->2.71828..
    // log
    public func log(x : Float) : async Float { return Float.log(x);}; //log(5)->0.69897000433
    // format
    type Format = {#fix : Nat8; #exp : Nat8; #gen : Nat8; #hex : Nat8; #exact;};
    public func format(fmt : Format, x : Float) : async Text { return Float.format(fmt, x);}; //

}