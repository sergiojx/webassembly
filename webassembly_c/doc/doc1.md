# Embind
### https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind.html
Embind is used to bind C++ functions and classes to JavaScript, so that the compiled code can be used in a natural way by “normal” JavaScript. Embind also supports calling JavaScript classes from C++.  


### vagrant@vagrant:~/emsdk$ source ./emsdk_env.sh
Initially `emcc` command is not detected
```
vagrant@vagrant:/vagrant/webassembly_c$ emcc -lembind -o quick_example.js quick_example.cpp
cache:INFO: generating system asset: symbol_lists/dee743bffbb133766159b810e84bdff930110c34.json... (this will be cached in "/home/vagrant/emsdk/upstream/emscripten/cache/symbol_lists/dee743bffbb133766159b810e84bdff930110c34.json" for subsequent builds)
cache:INFO:  - ok
```

### Star a simple server with Python3
Add index.html and index.js and start a web server with Python3
```
python3 -m http.server
```

### Note:
The jenerated .js has a lot of extra things that might not be
necesary.