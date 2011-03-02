#!/bin/sh

curl -X POST \
    -H "accept: application/json" \
    -H "content-type: application/json" \
    http://localhost:8098/mapred --data @-<<\EOF
{
  "query":[{"map":{"language":"javascript","source":"
function(v) {
  var m = v.values[0].data.toLowerCase().match(/\w*/g);
  var r = [];
  for(var i in m) {
    if(m[i] != '') {
      var o = {};
      o[m[i]] = 1;
      r.push(o);
    }
  }
  return r;
}
  "}},{"reduce":{"language":"javascript","source":"
function(v) {
  var r = {};
  for(var i in v) {
    for(var w in v[i]) {
      if(w in r) r[w] += v[i][w];
      else r[w] = v[i][w];
    }
  }
  return [r];
}
  "}}]
  ,"inputs": [
    ["book","adventures-of-huckleberry-finn"]
  ]
 ,"timeout": 120000
}
EOF
