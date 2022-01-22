import D "mo:base/Debug";
import Result "mo:base/Result";


// Debugのライブラリにあるメソッド使用例です。deployして使ってみてください。
// Debugのライブラリ上から順に(https://smartcontracts.org/docs/base-libraries/Debug.html)

actor {
    // print
    public func print (t : Text) : async () { D.print(t) }; //D.printは返り値なし
    // trap
    public func trap (t : Text) : async None { D.trap(t) }; //D.trapはNoneを返す（call rejectedなのはなぜ？）
    
};