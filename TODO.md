# お題



- LTSVライブラリ

```
class LTSV {
  set(String key, String val) : String
  get(String key) : String
  dump() : String
}

ltsv = new LTSV();
ltsv.set("foo", "hoge");
ltsv.get("foo");
ltsv.dump();

ltsv.set("foo", "hoge");
```


## TODO

- .setで"foo"に"hoge"を入れるとnilを返すこと
- .getをすると"hoge"を返すこと
- .dumpをすると"foo:hoge\n"を返すこと
