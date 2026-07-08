/// Standard Ultraviolet library

/// STD sin function
#[unsafe(no_mangle)]
pub extern "C" fn uv_sin(x: f64) -> f64 {
    x.sin()
}

/// STD cos function
#[unsafe(no_mangle)]
pub extern "C" fn uv_cos(x: f64) -> f64 {
    x.cos()
}

/// STD tan function
#[unsafe(no_mangle)]
pub extern "C" fn uv_tan(x: f64) -> f64 {
    x.tan()
}

/// STD cot function
#[unsafe(no_mangle)]
pub extern "C" fn uv_cot(x: f64) -> f64 {
    1.0 / x.tan()
}

/// STD power function
#[unsafe(no_mangle)]
pub extern "C" fn uv_pow(x: f64, n: f64) -> f64 {
    x.powf(n)
}
