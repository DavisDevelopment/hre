package hre;

import haxe.ds.Option;

/* == [Pair type] == */
#if tink_core
typedef Pair<A, B> = tink.core.Pair<A, B>;
typedef Error = tink.core.Error;
#else

abstract Pair<A, B> (MPair<A, B>) from MPair<A, B> to MPair<A, B> {
    public inline function new(a:A, b:B) this = new MPair(a, b);

    public var a(get, never): A;
    inline function get_a():A return this.a;

    public var b(get, never): B;
    inline function get_b():B return this.b;

    @:to
    inline function toBool():Bool return this != null;
    @:op(!a)
    inline function isNil():Bool return this == null;
}

//private typedef T2<A,B> = {a:A, b:B};
class MPair<X, Y> {
    public var a: X;
    public var b: Y;
    /* Constructor Function */
    public inline function new(x:X, y:Y) {
        a = x;
        b = y;
    }
}

class Error {
    /* Constructor Function */
    public function new(msg) {
        message = msg;
    }

    public var message: String;
}

#end
