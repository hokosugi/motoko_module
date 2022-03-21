import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Result "mo:base/Result";
import Int "mo:base/Int";
import Iter "mo:base/Iter";

actor array {
    // equal
    public func equal(arr1: [Nat], arr2: [Nat]) :async Bool {
        return Array.equal<Nat>(arr1, arr2, Nat.equal);
    };
    // equal([1, 2], [1, 2])->true

    // append [注]appendは非推奨になっています。これは配列を Bufferに変換して関数実行してまた配列に戻しているため
    public func append(arr: [Nat], n: Nat) :async [Nat] {
        return Array.append<Nat>(arr, [n]);
    };
    // append([1, 2, 3], [4])->[1, 2, 3, 4]

    // sort
    public func sort(arr: [Nat]) :async [Nat] {
        return Array.sort<Nat>(arr, Nat.compare);
    };
    // sort([1, 3, 5, 4])->[1, 2, 3, 4]

    // sortInPlace 可変配列をsortする
    public func sortInPlace(arr: [Nat]) :async [Nat] { // shared関数は引数に可変配列は出来ない
        let arr1 : [var Nat] = Array.thaw(arr);        // 不変配列を可変配列に
        Array.sortInPlace(arr1, Nat.compare);
        return Array.freeze(arr1);                     // 再度不変配列に戻す
    };
    // sortInPlace([1, 4, 3, 2])->[1, 2, 3, 4]

    // chain
    public func chain(arr: [Nat]) :async [Nat] {
        return Array.chain<Nat, Nat>(
            arr, 
            func(x: Nat): [Nat]{[x+1]} // ここで現配列に変化させる計算式
        );
    };
    // chain([3, 4, 5, 1])->[4, 5, 6, 2]

    // filter
    public func filter(arr: [Nat]) :async [Nat] {
        return Array.filter<Nat>(
            arr,
            func(x: Nat): Bool {x%2==0} // ここで現配列にfilterを掛ける計算式
        );
    };
    // filter([3, 4, 5, 1])->[4]

    // mapFilter
    public func mapFilter(arr: [Nat]) :async [Nat] {
        return Array.mapFilter<Nat, Nat>(
            arr,
            func(x: Nat): ?Nat {if(x%2==0) ?x else ?0} // ここで現配列にfilterを掛ける計算式
        );
    };
    // mapFilter([3, 5, 6, 7])->[0, 0, 6, 0]

    // foldLeft
    public func foldLeft(arr: [Nat]) :async Nat {
        return Array.foldLeft<Nat, Nat>(
            arr,
            0,                                  // 元の値
            func(x: Nat, y: Nat): Nat {x + 2*y} // ここで現配列に元の値(x)にインデックス順に(y)を計算
        );
    };
    // foldLeft([1, 3, 4])->16, 第２引数を2の場合、foldLeft([1, 3, 4])->18

    // foldRight
    public func foldRight(arr: [Nat]) :async Nat {
        return Array.foldRight<Nat, Nat>(
            arr,
            0,                                  // 元の値
            func(x: Nat, y: Nat): Nat {x + 2*y} // ここで現配列に元の値(x)にインデックス順に(y)を計算
        );
    };
    // foldRight([1, 3, 4])->23 第２引数を2の場合、foldRight([1, 3, 4])->39

    // find
    public func find(arr: [Nat]) :async ?Nat {
        return Array.find<Nat>(
            arr,
            func(x: Nat): Bool {x == 2} // ここで現配列内に2があるかの式
        );
    };
    // find([1, 2, 3, 2])->2

    // freeze
    public func freeze(arr: [Nat]) : async [Nat]{
        let mutable_arr = Array.thaw<Nat>(arr); //mutableへ変換
        return Array.freeze(mutable_arr);       //immutableへ
    };
    // freeze([1, 3, 4])-> [1, 3, 4] immutable

    // flatten
    public func flatten(arr: [[Nat]]) : async [Nat]{
        return Array.flatten(arr);      
    };
    // flatten([[1,2], [3, 4], [5, 6]])->[1, 2, 3, 4, 5, 6]

    // map
    public func map(arr: [Nat]) :async [Nat] {
        return Array.map<Nat, Nat>(
            arr,
            func(x: Nat): Nat {x + 2} 
        );
    };
    // map([1, 3, 4])->[3, 5, 6]

    // mapEntries
    public func mapEntries(arr: [Nat]) :async [Nat] {
        return Array.mapEntries<Nat, Nat>(
            arr,
            func(x: Nat, i: Nat): Nat {x+i} 
        );
    };
    // mapEntries([1, 3, 4])->[1, 4, 6]

    // mapResult 最初のエラーを返す、ない場合はそのまま配列を返す
    public func mapResult(arr: [Nat]) :async Result.Result<[Nat], Text> {
        return Array.mapResult<Nat, Nat, Text>(
            arr,
            func(x: Nat): Result.Result<Nat, Text> {
                if(x<=10){
                    return #ok(x);
                }else {
                 return #err(Nat.toText(x));
                };
            }
        );
    };
    // mapResult([1, 3, 10, 11])->"11"(Text), mapResult([1, 3, 9, 10])->[1, 3, 9, 10]

    // make
    public func make(n: Nat) : async [Nat]{
        return Array.make(n);
    };
    // make(8)->[8]

    // vals
    public func vals(arr: [Nat]) : async [Nat] {
        var new_arr: [Nat] = [];
        for (v in Array.vals(arr)){
            new_arr := Array.append<Nat>(new_arr, [v]);
        };
        return new_arr;
    };
    // vals([1, 2, 3, 4])->[1, 2, 3, 4]

    //keys
    public func keys(arr: [Nat]) : async [Nat] {
        var new_arr: [Nat] = [];
        for (i in Array.keys(arr)){
            new_arr := Array.append<Nat>(new_arr, [i]);
        };
        return new_arr;
    };
    // keys([1, 2, 3, 4])->[0, 1, 2, 3]

    //thaw
    public func thaw(arr: [Nat]) : async [Nat]{
        let mutable_arr = Array.thaw<Nat>(arr); //mutableへ変換 public関数ではmutable配列を戻り値にできない
        return Array.freeze(mutable_arr);         //immutable 
    };
    // freeze([1, 3, 4])-> [1, 3, 4] immutable

    //init
    public func init(size: Nat, initial: Nat) : async [Nat]{
        let init_arr = Array.init<Nat>(size, initial);
        return Array.freeze(init_arr);      
    };
    // init(3, 0)->[0, 0, 0]  mutable

    // tabulate
    public func tabulate(size: Nat) : async [Nat] {
        return Array.tabulate<Nat>(
            size,
            func (i: Nat){
                i*3;
            }
            );
    };
    // tabulate(4)->[0, 3, 6, 9]

    //tabulateVar 
    public func tabulateVar(size: Nat) : async [Nat] {
        let mutable_arr = Array.tabulateVar<Nat>(
            size,
            func (i:Nat){
                i*3;
            }
            );
        return Array.freeze(mutable_arr)
    };
    // tabulateVar(4)->[0, 3, 6, 9]
};