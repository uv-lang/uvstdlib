/// Standard Ultraviolet library

/// STD sin function
pub fn sin(x: f64) -> f64 {
    x.sin()
}

/// STD cos function
pub fn cos(x: f64) -> f64 {
    x.cos()
}

/// STD tan function
pub fn tan(x: f64) -> f64 {
    x.tan()
}

/// STD cot function
pub fn cot(x: f64) -> f64 {
    1.0 / x.tan()
}

/// STD power function
pub fn pow(x: f64, n: f64) -> f64 {
    x.powf(n)
}
