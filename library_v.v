
@[export: 'loop_quotas']
fn loop_quotas(quotas_p &i64, n i64) i64 {
    // FIXME: array parameter parsing
    // quotas := unsafe 
    // println(quotas_p)
    // println(n)

	mut total := i64(0)
	// for _, value in quotas {
	// 	total += value
	// }

    // TODO: to remove temporary simple loop
    mut i := 0
    for {
        i += 1
        if i >= n {
            break
        }
    }

	return total
}

fn main() {
    println("main")
}