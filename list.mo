import List "mo:base/List";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Result "mo:base/Result";
import Nat "mo:base/Nat";


actor {
    public type List<T> = ?(T, List<T>);
    let text_list = List.nil<Text>();
    let nat_list = List.nil<Nat>();
    public type list<N> = (N, N);

    // nil
    public func nil() : async List<Text> {
        return List.nil();
    };
    // nil()->(null)
    
    // isNil
    public func isNil(l: List<Text>) : async Bool {
        return List.isNil(l);
    };
    // isNil(List.nil())->true

    // push
    public func push(n: Nat, l: List<Nat>) : async List<Nat> {
        return List.push(n, l);
    };
    // push(0, (1, (2, (3, null)))))->(0,(1, (2, (3, null))))

    // last
    public func last(l: List<Text>) : async ?Text {
        return List.last(l);
    };
    // last(("a", ("b", ("c", null))))->"c"

    // pop
    public func pop(l: List<Text>) : async (?Text,List<Text>) {
        return List.pop(l);
    };
    // pop(("a", ("b", ("c", null))))->("b", ("c", null)))

    // size
    public func size(l: List<Text>) : async Nat {
        return List.size(l);
    };
    // size(("a", ("b", ("c", null))))->3

    // get
    public func get(l: List<Text>, n: Nat) : async ?Text {
        return List.get(l, n);
    };
    // get(("a", ("b", ("c", null)))), 1)->"b"

    // reverse
    public func reverse(l: List<Text>) : async List<Text> {
        return List.reverse(l);
    };
    // reverse(("a", ("b", ("c", null))))->("c", ("b", ("a", null)))

    // iterate
    public func iterate(l: List<Nat>) : async Nat {
        let list = List.nil<Nat>();
        var sum = 0;
        List.iterate(
            l,
            func(x: Nat){sum += x}
        );
        return sum;
    };
    // iterate((1, (2, (3, null))))->6

    // map
    public func map(l: List<Text>) : async List<Text> {
        return List.map<Text, Text>(
            l,
            func(x: Text){Text.concat(x, "a")}
        );
    };
    // map(("a", ("b", ("c", null))))->("aa", ("ba", ("ca", null)))

    // filter
    public func filter(l: List<Text>) : async List<Text> {
        return List.filter<Text>(
            l,
            func(x: Text){x == "a"}
        );
    };
    // filter(("a", ("b", ("c", null))))->("a", null)

    // partition
    public func partition(l: List<Text>) : async (List<Text>, List<Text>) {
        return List.partition<Text>(
            l,
            func(x: Text){x == "a"}
        );
    };
    // partition(("a", ("b", ("c", null))))->(("a", null), ("b", ("c", null)))

    // mapFilter
     public func mapFilter(l: List<Text>) : async List<Text> {
        return List.mapFilter<Text, Text>(
            l,
            func(x: Text){?Text.concat(x, "a")}
        );
    };
    // mapFilter(("a", ("b", ("c", null))))->(("a", ("b", ("c", null))))

    // mapResult
    public func mapResult(l: List<Text>) : async Result.Result<List<Text>, Text> {
        return List.mapResult<Text, Text, Text>(
            l,
            func(x: Text): Result.Result<Text, Text>{
                if (x=="a") {#ok x;}
                else {#err x;}
            }
        );
    };
    // mapResult(("a", ("b", ("c", null))))->(("a", ("b", ("c", null))))

    // append
    public func append(l: List<Text>, add: List<Text>) : async List<Text> {
        return List.append<Text>(l, add);
            
    };
    // append(("a", ("b", ("c", null))), ("d"))->(("a", ("b", ("c", ("d", null))))

    // flatten
    public func flatten(l: List<List<Text>>) : async List<Text> {
        return List.flatten<Text>(l);
            
    };
    // flatten(("a", ("b", ("c", ("d", null))))->("a", ("b", ("c", ("d", null)))

    // take
    public func take(l: List<Text>, n: Nat) : async List<Text> {
        return List.take<Text>(l, n);        
    };
    // take(("a", ("b", ("c", null))), 2)->(("a", ("b", null)))

    // drop
    public func drop(l: List<Text>, n: Nat) : async List<Text> {
        return List.drop<Text>(l, n);        
    };
    // drop(("a", ("b", ("c", null)), 2)->(("a", ("c", null)))

    // foldLeft
    public func foldLeft(l: List<Nat>, a: Nat) : async Nat {
        return List.foldLeft<Nat, Nat>(
            l, 
            a,
            func(ax: Nat, ly: Nat){ax + 2*ly}
        );        
    };
    // foldLeft((1, (2, (3, null), 10)->22

    // foldRight
    public func foldRight(l: List<Nat>, a: Nat) : async Nat {
        return List.foldRight<Nat, Nat>(
            l, 
            a,
            func(ax: Nat, ly: Nat){ax + 2*ly}
        );        
    };
    // foldRight((1, (2, (3, null), 10)->97

    // find
    public func find(l: List<Text>) : async ?Text {
        return List.find<Text>(
            l,
            func(x: Text): Bool{
                x=="a"
            }
        )        
    };
    // find(("a", ("b", ("c", null))->("a")

    // some
    public func some(l: List<Text>) : async Bool {
        return List.some<Text>(
            l, 
            func(x: Text): Bool {x=="a"}
        );        
    };
    // some(("a", ("b", ("c", null))-> false, some(("a", ("a", ("c", null))-> true

    // all
    public func all(l: List<Text>) : async Bool {
        return List.all<Text>(
            l, 
            func(x: Text): Bool {x=="a"}
        );        
    };
    // all(("a", ("b", ("c", null))-> false, some(("a", ("a", ("a", null))-> true

    // merge
    public func merge(l1: List<Text>, l2: List<Text>) : async List<Text> {
        return List.merge<Text>(
            l1, 
            l2,
            func(x: Text, y: Text): Bool {x == y}
        );        
    };
    // merge(("a", ("b", ("c", null))), ("d", ("e", ("f", null))))-> (("d", ("e", ("f", ("a", ("b", ("c", )))))))

    // compare
    // public func compare(l1: List<Text>, l2: List<Text>) : async {#less; #equal; #greater} {
    //     return List.compare<Text>(
    //         l1, 
    //         l2,
    //         func(x: Text, y: Text): {#less; #equal; #greater} {
    //             // if(x==y){#equal};
    //             // if(x>=y){#greater};
    //             // if(x==y){#less};                
    //         }
    //     );        
    // };


    // equal
    public func equal(l1: List<Text>, l2: List<Text>) : async Bool {
        return List.equal<Text>(
            l1, 
            l2,
            func(x: Text, y: Text): Bool {x==y}
        );        
    };
    // equal(("a", ("b", ("c", null)))), ("a", ("b", ("c", null))))->true

    // tabulate
    public func tabulate(n: Nat) : async List<Text> {
        return List.tabulate<Text>(
            n, 
            func(x: Nat): Text {Nat.toText(x*3)}
        );        
    };
    // tabulate(3)->((0, (3, (6, null))))

    // make
    public func make(t: Text) : async List<Text> {
        return List.make(t);
    };
    // make("a")->(("a", null))

    // replicate
    public func replicate(n: Nat, t: Text) : async List<Text> {
        return List.replicate(n, t);
    };
    // replicate(2, "a")->(("a", ("a", null)))

    // zip
    public func zip(l1: List<Nat>, l2: List<Nat>) : async List<(Nat, Nat)> {
        return List.zip(l1, l2);
    };
    // zip()->

    // zipWith
    public func zipWith(l1: List<Nat>, l2: List<Nat>) : async List<Nat> {
        let f = func(x: Nat, y: Nat): Nat {return x+y};
        return List.zipWith(l1, l2, f);
    };
    // zipWith((1, (2, (3, null)))), (1, (2, (3, null))))->((2, (4, (6, null))))

    // split
    public func split(n: Nat, l: List<Text>) : async (List<Text>, List<Text>) {
        return List.split(n, l);
    };
    // split(2, (1, (2, (3, null))))-> ((1, (2, null)), (3, null))

    // chunks
    public func chunk(n: Nat, l: List<Text>) : async List<List<Text>> {
        return List.chunks(n, l);
    };
    // chunks(2, (1, (2, (3, null))))->

    // fromArray
    public func fromArray(arr: [Nat]) : async List<Nat> {
        return List.fromArray(arr);
    };
    // fromArray([3, 4, 7, 8])->((3, (4, (7, (8, null)))))

    // fromVarArray *private function
    private func fromVarArray(arr: [var Nat]) : List<Nat> {
        return List.fromVarArray(arr);
    };
    // fromVarArray([3, 4, 7, 8])->((3, (4, (7, (8, null)))))

    // toArray
    public func toArray(l: List<Text>) : async [Text] {
        return List.toArray(l);
    };
    // toArray((3, (4, (7, (8, null)))))->[3, 4, 7, 8]

    // toVarArray *private function
    private func toVarArray(l: List<Text>) : [var Text] {
        return List.toVarArray(l);
    };
    // toVarArray((3, (4, (7, (8, null)))))->[3, 4, 7, 8]

    
  
}; 