# python-speed-tests
Simple Python speed tests

## requirements
- python >3.10
- uv package installed in system (python pip install uv)
- make
- golang > 1.22

## prepare environment
make prepare_env
or make prepare_env313
or make prepare_env313jit

## start tests
make build && make run

## clean
make clean


## results examples
### 3.12.6

```
py loop   time: 0.336322s result: 49999995000000
py reduce time: 0.541948s result: 49999995000000
py sum    time: 0.594404s result: 49999995000000
py sumgen time: 0.776873s result: 49999995000000
js loop   time: 1.470004s result: 49999995000000
js loop   time: 0.069557s result: 49999995000000 - local JS array
js reduce time: 0.761164s result: 49999995000000
js reduce time: 0.081517s result: 49999995000000 - local JS array
go loop   time: 0.005713s result: 49999995000000
```

### 3.13.0rc2

```
py loop   time: 0.429369s result: 49999995000000
py reduce time: 0.851984s result: 49999995000000
py sum    time: 0.901671s result: 49999995000000
py sumgen time: 1.079927s result: 49999995000000
js loop   time: 2.040493s result: 49999995000000
js loop   time: 0.070073s result: 49999995000000 - local JS array
js reduce time: 1.354744s result: 49999995000000
js reduce time: 0.081942s result: 49999995000000 - local JS array
go loop   time: 0.005130s result: 49999995000000
```

### 3.13.0rc2 jit

```
py loop   time: 0.333213s result: 49999995000000
py reduce time: 0.862173s result: 49999995000000
py sum    time: 0.910673s result: 49999995000000
py sumgen time: 1.187532s result: 49999995000000
js loop   time: 2.021253s result: 49999995000000
js loop   time: 0.069525s result: 49999995000000 - local JS array
js reduce time: 1.275803s result: 49999995000000
js reduce time: 0.081623s result: 49999995000000 - local JS array
go loop   time: 0.005237s result: 49999995000000
```

