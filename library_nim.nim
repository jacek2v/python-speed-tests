import nimpy
proc loop_quotas(quotas: seq[int], n: int): int {.exportpy.} =
    var total = 0
    # simple count loop 
    # for i in 0..n-1:
    #     total += i
    for value in quotas:
        total += value
    return total
