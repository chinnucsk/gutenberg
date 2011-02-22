#!/bin/sh
rlwrap erl \
    -pa ebin \
    -pa deps/lfe/ebin/ \
    -noshell \
    -s lfe_shell \
    start
