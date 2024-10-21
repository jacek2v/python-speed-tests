from functools import reduce
import time
import array
from py_mini_racer import MiniRacer

ctx = MiniRacer()

N = 10_000_000

quotas = [idx for idx in range(N)]


def python_bench():
    start = time.time()
    total = 0
    for i in quotas:
        total += quotas[i]
    end = time.time() - start
    print(f"py loop   time: {end:5f}s result: {total}")

    start = time.time()
    result = reduce(lambda total, a: total + a, quotas, 0)
    end = time.time() - start
    print(f"py reduce time: {end:5f}s result: {result}")

    start = time.time()
    result = reduce(lambda total, a: total + a, quotas, 0)
    result = sum(quotas)
    end = time.time() - start
    print(f"py sum    time: {end:5f}s result: {result}")

    start = time.time()
    result = reduce(lambda total, a: total + a, quotas, 0)
    result = sum(elm for elm in quotas)
    end = time.time() - start
    print(f"py sumgen time: {end:5f}s result: {result}")


def javascript_bench():
    # var QUOTAS = Array.from(new Array(100_000_000),(val,index)=> index );
    js_func1 = """
    var main = function(QUOTAS, max_number) {
        total = 0;
        for (var i = 0; i < max_number; i++) {
            total = total + QUOTAS[i];
        }
        return total;
    }
    """

    ctx.eval(js_func1)
    start = time.time()
    result = ctx.call("main", quotas, N)
    end = time.time() - start
    print(f"js loop   time: {end:5f}s result: {result}")

    # var QUOTAS = Array.from(new Array(100_000_000),(val,index)=> index );
    js_func2 = """
    var main = function(QUOTAS, max_number) {
        const total = QUOTAS.reduce((partialSum, a) => partialSum + a, 0);
        return total;
    }
    """

    ctx.eval(js_func2)
    start = time.time()
    result = ctx.call("main", quotas, N)
    end = time.time() - start
    print(f"js reduce time: {end:5f}s result: {result}")


import ctypes  # noqa: E402

library = ctypes.cdll.LoadLibrary("./out/library.so")


def go_bench():
    loop_quotas = library.loop_quotas
    array_arg_type = ctypes.POINTER(ctypes.c_int64)
    loop_quotas.argtypes = [array_arg_type, ctypes.c_int]
    loop_quotas.restype = ctypes.c_int64
    array_tmp = array.array("q", quotas)
    array_arg = array_arg_type((ctypes.c_int64 * len(quotas)).from_buffer(array_tmp))

    start = time.time()
    result = loop_quotas(array_arg, N)
    end = time.time() - start
    print(f"go loop   time: {end:5f}s result: {result}")


if __name__ == "__main__":
    python_bench()
    javascript_bench()
    go_bench()
