# range-list

### clone this repo
### 
```shell
$ git clone git@github.com:StephenSoft/range-list.git
$ cd range-list
# run test
$ ruby test/range_list_test.rb
# use ruby irb
$ irb
```
```ruby
require './range_list.rb'

rl = RangeList.new
rl.range_size
#0
rl.rl.range_length
#0

rl.add([1,5])

rl.print
# "[ 1, 5 ) "

rl.add([1,8])
rl.print
# "[ 1, 8 ) "

rl.add([10,20])
rl.print
# "[ 1, 8 ) [ 10, 20 ) "

rl.add([10,21])
rl.print
# "[ 1, 8 ) [ 10, 21 ) "

rl.remove([10, 11])
rl.print
# "[ 1, 8 ) [ 11, 21 ) "

rl.remove([15,17])
rl.range_size # 3
rl.print
# "[ 1, 8 ) [ 11, 15 ) [ 17, 21 ) "

rl.remove([3,19])
rl.range_size # 2
rl.print
# "[ 1, 3 ) [ 19, 21 ) "

```
