import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Int "mo:base/Int";
import List "mo:base/List";


actor {
    // range
    public func range(i: Nat, j:Nat): async [Nat] {
        var range_arr = Array.init<Nat>(0, 0);
        var immutable_arr = Array.freeze(range_arr);
        for (iter in Iter.range(i, j)){
            immutable_arr := Array.append<Nat>(immutable_arr, [iter]);
        };
        return immutable_arr;
    };
    // range(0, 5)->[0, 1, 2, 3, 4, 5]

    // next
    public func next(): async ?Nat {
        let iter = Iter.range(1, 2);
        assert (?1==iter.next());
            return ?1;
        assert (?2==iter.next());
            return ?2;
        assert (null==iter.next()); 
            return null;   
    };
    // next()->1

    // revRange
    public func revRange(arr: [Text]) : async [Text] {
        var rev_arr : [Text] = []; 
        for (i in Iter.revRange(arr.size()-1, 0)){
            let int = Int.abs(i);
            //let v : Text = arr[int];
            rev_arr := Array.append<Text>(rev_arr, [arr[int]]);
        };
        return rev_arr;
    };
    // revRange(["1", "2", "3"])->["3", "2", "1"]
    // next()はマイナスになる可能性があるのでInt型

    // iterate
    public func iterate(i: Nat, j: Nat) : async Nat {
        var sum : Nat = 0;
        Iter.iterate(
            Iter.range(i, j),
            func(x: Nat, _index: Nat){
            sum += x+_index;
            });
        return sum;
    };
    // iterate(0,5)->30, iterate(0, 2)->6

    // size
    public func size(i:Nat, j: Nat) : async Nat {
        return Iter.size(Iter.range(i, j));
    };
    // size(0, 5)->6

    // map
    public func map(i:Nat, j: Nat) : async [Nat] {
        var map_arr : [Nat] = [];
        let iter = Iter.map(
            Iter.range(i, j),
            func (x:Nat): Nat{x*2}
        );
        for (v in iter){    //iterはIterタイプでrangeの働き
            map_arr := Array.append(map_arr, [v]);
        };
        return map_arr;
    };
    // map(0, 5)->[0, 2, 4, 6, 8, 10]

    // filter
    public func filter(i:Nat, j: Nat) : async [Nat] {
        var filter_arr: [Nat] = [];
        let iter = Iter.filter(
            Iter.range(i, j),
            func (x:Nat): Bool {x%2==0}
        );
        for (v in iter){
            filter_arr := Array.append(filter_arr, [v]);
        };
        return filter_arr;
    };
    // filter(0, 10)->
    
    //make
    public func make(t: Text): async Text {
        let make_iter = Iter.make(t);
        assert (?t==make_iter.next());  
        return t;
    };
    // make("test")->"test"
  
    // fromArray 何に使うのか分からない
    public func fromArray(arr: [Text]): async [Text] {
        var new_arr: [Text] = [];
        let iter = Iter.fromArray(arr);
        for (v in iter) {
            new_arr := Array.append(new_arr, [v]);
        };
        return new_arr;
    };
    // fromArray([1, 2, 3])->[1, 2, 3]

    // fromArrayMut
    public func fromArrayMut(arr: [Text]): async [Text] {
        var new_arr: [Text] = [];
        let mut_arr: [var Text] = Array.thaw(arr);
        let iter = Iter.fromArrayMut(mut_arr);
        for (v in iter) {
            new_arr := Array.append(new_arr, [v]);
        };
        return new_arr;
    };
    // fromArrayMut([1, 2, 3])->[1, 2, 3]

    // fromList
    public func fromList(t1: Text, t2:Text): async [Text] {
        var arr: [Text] = [];
        var list = List.nil<Text>();       // ()
        list := List.push<Text>(t1, list);  // ("test")
        list := List.push<Text>(t2, list);
        let iter_from_list = Iter.fromList(list);
        for (v in iter_from_list){
            arr := Array.append(arr, [v]);
        };
        return arr;
    };
    // fromList("test1", "test2")->("test2","test1")

    // toArray
    public func toArray(i: Nat, j: Nat): async [Nat] {
        let iter = Iter.range(i, j);
        let arr : [Nat] = Iter.toArray(iter);
        return arr;
    };
    // toArray(0, 4)->[0, 1, 2, 3, 4]

    // toArrayMut
    public func toArrayMut(i: Nat, j: Nat): async [Nat] {
        let iter = Iter.range(i, j);
        let arr : [var Nat] = Iter.toArrayMut(iter);
        return Array.freeze(arr);
    };
    // toArray(0, 4)->[0, 1, 2, 3, 4]

    // toList
    public func toList(i: Nat, j: Nat): async List.List<Nat> {
        let iter = Iter.range(i, j);
        let list = Iter.toList(iter);
        return list;
    };
    // toList(1, 3)->(1:(2:(3:null)))
    
};