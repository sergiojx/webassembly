## Compiling the package to wasm
Once you have the code written, we will use `wasm-pack` to not only compile the Rust code into wasm, but create a JavaScript module we can load using es6 module syntax. To do this, we will tell `wasm-pack` to build with a target of web:

```
wasm-pack build --target web
```
https://doc.rust-lang.org/cargo/reference/cargo-targets.html
Possible output becasue `console::log_1(&"Hello, world!".into());`. the & was in the wrong place.
```
vagrant@vagrant:/vagrant/rust-projects/rustwebassembly$ wasm-pack build --target web
[INFO]: 🎯  Checking for the Wasm target...
info: downloading component 'rust-std' for 'wasm32-unknown-unknown'
info: installing component 'rust-std' for 'wasm32-unknown-unknown'
 17.1 MiB /  17.1 MiB (100 %)  11.4 MiB/s in  1s ETA:  0s
[INFO]: 🌀  Compiling to Wasm...
   Compiling proc-macro2 v1.0.70
   Compiling unicode-ident v1.0.12
   Compiling wasm-bindgen-shared v0.2.89
   Compiling quote v1.0.33
   Compiling syn v2.0.39
   Compiling log v0.4.20
   Compiling once_cell v1.19.0
   Compiling bumpalo v3.14.0
   Compiling wasm-bindgen-backend v0.2.89
   Compiling wasm-bindgen-macro-support v0.2.89
   Compiling wasm-bindgen v0.2.89
   Compiling wasm-bindgen-macro v0.2.89
   Compiling cfg-if v1.0.0
   Compiling js-sys v0.3.66
   Compiling web-sys v0.3.66
   Compiling rustwebassembly v0.1.0 (/vagrant/rust-projects/rustwebassembly)
error[E0277]: the trait bound `&JsValue: From<&str>` is not satisfied
  --> src/lib.rs:10:37
   |
10 |     console::log_1("&Hello, world!".into());
   |                                     ^^^^ the trait `From<&str>` is not implemented for `&JsValue`
   |
   = help: the following other types implement trait `From<T>`:
             <JsValue as From<bool>>
             <JsValue as From<isize>>
             <JsValue as From<i8>>
             <JsValue as From<i16>>
             <JsValue as From<i32>>
             <JsValue as From<i64>>
             <JsValue as From<i128>>
             <JsValue as From<usize>>
           and 73 others
   = note: required for `&str` to implement `Into<&JsValue>`

For more information about this error, try `rustc --explain E0277`.
error: could not compile `rustwebassembly` (lib) due to previous error
Error: Compiling your crate to WebAssembly failed
Caused by: Compiling your crate to WebAssembly failed
Caused by: failed to execute `cargo build`: exited with exit status: 101
  full command: cd "/vagrant/rust-projects/rustwebassembly" && "cargo" "build" "--lib" "--release" "--target" "wasm32-unknown-unknown"
```
Once fixed          
```
vagrant@vagrant:/vagrant/rust-projects/rustwebassembly$ wasm-pack build --target web
[INFO]: 🎯  Checking for the Wasm target...
[INFO]: 🌀  Compiling to Wasm...
   Compiling rustwebassembly v0.1.0 (/vagrant/rust-projects/rustwebassembly)
    Finished release [optimized] target(s) in 0.48s
[INFO]: ⬇️  Installing wasm-bindgen...
[INFO]: Optimizing wasm binaries with `wasm-opt`...
[INFO]: Optional fields missing from Cargo.toml: 'description', 'repository', and 'license'. These are not necessary, but recommended
[INFO]: ✨   Done in 8.85s
[INFO]: 📦   Your wasm pkg is ready to publish at /vagrant/rust-projects/rustwebassembly/pkg.
```
This step does the follow:
* Compilation to WebAssembly
* Creates a JS module to include
* Package everything


### Star a simple server with Python3
Add index.html and index.js and start a web server with Python3
```
python3 -m http.server
```