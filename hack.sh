#!/bin/bash
echo 'Dropping current directory into ctf machine'
d=$(python -c "print '/'.join('$(pwd)'.split('/')[3:])")
cd /Users/redteam/pulls/ctf_machine; vagrant ssh -c "cd /home/ubuntu/red/$d;fish"
