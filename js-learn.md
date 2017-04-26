#### 1. parseInt  [永远都要明确给出radix参数的值](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/parseInt)

如果字符串 string 以"0"开头, 基数是8（八进制）或者10（十进制），那么具体是哪个基数由实现环境决定。ECMAScript 5 规定使用10，但是并不是所有的浏览器都遵循这个规定。因此，永远都要明确给出radix参数的值。

尽管 ECMAScript 3 已经不赞成这种做法，且 ECMAScript 5 已经禁止了这种做法，但是仍然有很多实现环境仍然把以 0 开头的数值字符串（numeric string）解释为一个八进制数。

#### 2. AngularJS: How to Use Filter in Controller
请参考 [AngularJS: How to Use Filter in Controller](http://budiirawan.com/angular-js-use-filter-controller/)

#### 3. AngularJS injectors internals
讲解了angularjs injector的能力, 参考[AngularJS injectors internals](http://agiliq.com/blog/2017/04/angularjs-injectors-internals/)

#### 4. IE bug.将httpStatus=204响应转化为了httpStatus=1223
[IE0013: IE XMLHTTP implementation turns 204 response code into bogus 1223 status code](http://www.enhanceie.com/ie/bugs.asp)

### 参考
1. [MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects)
